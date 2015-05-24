//
//  MainMenuViewController.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MainMenuViewController.h"
#import "SearchforDiseaseViewController.h"
#import "ChooseOrganViewController.h"
#import "SpecialitiesViewController.h"
#import "Specialitiesengine.h"
#import "MBProgressHUD.h"
#import "SpecialityEngine.h"
#import "QuestionsEngine.h"
#import "AllQuestionsViewController.h"
#import "RunningUser.h"
#import "User.h"
#import "QuestionsOptionsViewController.h"
#import "BodyViewController.h"
#import "FirstAidViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize tableView , mainitems ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"دكتوري";
		mainitems = [[NSMutableArray alloc]init];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (systemVersion >= 7.0) {
		self.navigationController.navigationBar.translucent = NO;
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	[mainitems addObject:@"موسوعتي الطبية"];
	[mainitems addObject:@"تشخيصي"];
	[mainitems addObject:@"موسوعتي الدوائية"];
	[mainitems addObject:@"إسأل دكتوري"];
	[mainitems addObject:@"صحتي الجنسية"];
	[mainitems addObject:@"كل الاسئلة"];
	[mainitems addObject:@"الطواريء و الاسعافات الاولية"];
	
	
	
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
	[self modifyinterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [mainitems count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
	
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"eventCell"];
    }
	
	cell.textLabel.text = [mainitems objectAtIndex:indexPath.row];
	
	return cell ; 
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *str = [mainitems objectAtIndex:indexPath.row] ;
	User *user = [RunningUser getSingleton_instance].user ;
	
	if ([str isEqualToString: @"Logout"]) {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:nil forKey:@"MyUser"];
		[defaults synchronize];
		[self modifyinterface] ;
	}
	
	if ([str isEqualToString: @"My Questions"]) {
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		QuestionsEngine *symengine = [[QuestionsEngine alloc]init];
		[symengine requestQuestionsByUserID:user.UserId onSuccess:^(NSMutableArray *QuestionsArray) {
			NSLog(@"succes") ;
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			AllQuestionsViewController *symperorg = [[AllQuestionsViewController alloc]init];
			//[symperorg setSymptoms:SymptomsArray] ;
			[symperorg setQuestions:QuestionsArray];
			[self.navigationController pushViewController:symperorg animated:YES];
		} onError:^(NSError *error) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			NSLog(@"failure");
		}];
	}
	
	if (indexPath.row == 0) {
		SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
		[searchdis setSexualhealth:0];
		[self.navigationController pushViewController:searchdis animated:YES];
	} else if (indexPath.row == 1) {
		ChooseOrganViewController *chooseorg = [[ChooseOrganViewController alloc]init];
		[self.navigationController pushViewController:chooseorg animated:YES];
	} else if (indexPath.row == 2) {
		SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
		[searchdis setSexualhealth:0];
		[searchdis setSearchformedicine:YES] ; 
		[self.navigationController pushViewController:searchdis animated:YES];
	}
	
	
	
	else if (indexPath.row == 3) {
		
		if (!(user.UserType == 2)) {
		
		SpecialityEngine *speceng = [[SpecialityEngine alloc]init] ;
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[speceng requestSpecialities:^(NSMutableArray *SymptomsArray) {
			NSLog(@"Success");
			SpecialitiesViewController *specview = [[SpecialitiesViewController alloc]init];
			[specview setSpecialities:SymptomsArray];
			[self.navigationController pushViewController:specview animated:YES];
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		} onError:^(NSError *error) {
			NSLog(@"failure") ;
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];

		}];
		} else {
			QuestionsEngine *symengine = [[QuestionsEngine alloc]init];
			[symengine requestQuestionsBySpecialityID:user.SpecialityId onSuccess:^(NSMutableArray *QuestionsArray) {
				NSLog(@"succes") ;
				[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
				AllQuestionsViewController *symperorg = [[AllQuestionsViewController alloc]init];
				[symperorg setEnabled:YES] ; 
				//[symperorg setSymptoms:SymptomsArray] ;
				[symperorg setQuestions:QuestionsArray];
				[self.navigationController pushViewController:symperorg animated:YES];
			} onError:^(NSError *error) {
				[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
				NSLog(@"failure");
			}];
		}
	}
	
	
	else if (indexPath.row == 4) {
		SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
		[searchdis setSexualhealth:1];
		[self.navigationController pushViewController:searchdis animated:YES];
	}
	
	
	else if (indexPath.row == 5) {
		SpecialityEngine *speceng = [[SpecialityEngine alloc]init] ;
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[speceng requestSpecialities:^(NSMutableArray *SymptomsArray) {
			NSLog(@"Success");
			SpecialitiesViewController *specview = [[SpecialitiesViewController alloc]init];
			[specview setSpecialities:SymptomsArray];
			[self.navigationController pushViewController:specview animated:YES];
			[specview setAskorshow:1]; 
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		} onError:^(NSError *error) {
			NSLog(@"failure") ;
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			
		}];
	}
}


-(IBAction)Ask:(id)sender {
	
	QuestionsOptionsViewController *options = [[QuestionsOptionsViewController alloc]init];
	[self.navigationController pushViewController:options animated:YES]; 
	
	/*User *user = [RunningUser getSingleton_instance].user ;
	
	if (!(user.UserType == 2)) {
		
		SpecialityEngine *speceng = [[SpecialityEngine alloc]init] ;
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[speceng requestSpecialities:^(NSMutableArray *SymptomsArray) {
			NSLog(@"Success");
			SpecialitiesViewController *specview = [[SpecialitiesViewController alloc]init];
			[specview setSpecialities:SymptomsArray];
			[self.navigationController pushViewController:specview animated:YES];
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		} onError:^(NSError *error) {
			NSLog(@"failure") ;
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			
		}];
	} else {
		QuestionsEngine *symengine = [[QuestionsEngine alloc]init];
		[symengine requestQuestionsBySpecialityID:user.SpecialityId onSuccess:^(NSMutableArray *QuestionsArray) {
			NSLog(@"succes") ;
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			AllQuestionsViewController *symperorg = [[AllQuestionsViewController alloc]init];
			[symperorg setEnabled:YES] ;
			//[symperorg setSymptoms:SymptomsArray] ;
			[symperorg setQuestions:QuestionsArray];
			[self.navigationController pushViewController:symperorg animated:YES];
		} onError:^(NSError *error) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			NSLog(@"failure");
		}];
	}*/
}

-(IBAction)myencyclopedia:(id)sender {
	
	UITabBarController *arabicenglish = [[UITabBarController alloc]init];
	SearchforDiseaseViewController *arabsearchdis = [[SearchforDiseaseViewController alloc]init];
	[arabsearchdis setLang:@"ar"];
	SearchforDiseaseViewController *englishsearchdis = [[SearchforDiseaseViewController alloc]init];
	[englishsearchdis setLang:@"en"];
	NSArray *viewcontrollers = [[NSArray alloc]initWithObjects:arabsearchdis,englishsearchdis, nil];
	
	
	
	arabicenglish.viewControllers = viewcontrollers ;
	
	float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (systemVersion >= 7.0) {
		arabicenglish.navigationController.navigationBar.translucent = NO;
		arabicenglish.edgesForExtendedLayout = UIRectEdgeNone;
	}
	//arabicenglish.selectedIndex = 0 ;
	/*SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
	[searchdis setSexualhealth:0];
	[self.navigationController pushViewController:searchdis animated:YES];*/
	[self.navigationController pushViewController:arabicenglish animated:YES];
}

-(IBAction)checker:(id)sender {
	ChooseOrganViewController *chooseorg = [[ChooseOrganViewController alloc]init];
	/*[self.navigationController pushViewController:chooseorg animated:YES];*/
	
	BodyViewController *bodycontrol = [[BodyViewController alloc]init] ;
	//[self.navigationController pushViewController:bodycontrol animated:YES];
	
	UITabBarController *arabicenglish = [[UITabBarController alloc]init];
	/*SearchforDiseaseViewController *arabsearchdis = [[SearchforDiseaseViewController alloc]init];
	[arabsearchdis setSexualhealth:1];
	[arabsearchdis setLang:@"ar"];
	SearchforDiseaseViewController *englishsearchdis = [[SearchforDiseaseViewController alloc]init];
	[arabsearchdis setSexualhealth:1];
	[englishsearchdis setLang:@"en"];*/
	NSArray *viewcontrollers = [[NSArray alloc]initWithObjects:bodycontrol,chooseorg, nil];
	
	arabicenglish.viewControllers = viewcontrollers ;
	
	[self.navigationController pushViewController:arabicenglish animated:YES];
	
}

-(IBAction)mymedicines:(id)sender {
	
	UITabBarController *arabicenglish = [[UITabBarController alloc]init];
	SearchforDiseaseViewController *arabsearchdis = [[SearchforDiseaseViewController alloc]init];
	[arabsearchdis setSexualhealth:0];
	[arabsearchdis setSearchformedicine:YES] ;
	[arabsearchdis setLang:@"ar"];
	SearchforDiseaseViewController *englishsearchdis = [[SearchforDiseaseViewController alloc]init];
	[englishsearchdis setSexualhealth:0];
	[englishsearchdis setSearchformedicine:YES] ;
	[englishsearchdis setLang:@"en"];
	NSArray *viewcontrollers = [[NSArray alloc]initWithObjects:arabsearchdis,englishsearchdis, nil];
	
	arabicenglish.viewControllers = viewcontrollers ;
	
	/*SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
	 [searchdis setSexualhealth:0];
	 [self.navigationController pushViewController:searchdis animated:YES];*/
	[self.navigationController pushViewController:arabicenglish animated:YES];
	
	/*SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
	[searchdis setSexualhealth:0];
	[searchdis setSearchformedicine:YES] ;
	[self.navigationController pushViewController:searchdis animated:YES];*/
}

-(IBAction)mysexualhealth:(id)sender {
	UITabBarController *arabicenglish = [[UITabBarController alloc]init];
	SearchforDiseaseViewController *arabsearchdis = [[SearchforDiseaseViewController alloc]init];
	[arabsearchdis setSexualhealth:1];
	[arabsearchdis setLang:@"ar"];
	SearchforDiseaseViewController *englishsearchdis = [[SearchforDiseaseViewController alloc]init];
	[englishsearchdis setSexualhealth:1];
	[englishsearchdis setLang:@"en"];
	NSArray *viewcontrollers = [[NSArray alloc]initWithObjects:arabsearchdis,englishsearchdis, nil];
	
	arabicenglish.viewControllers = viewcontrollers ;
	
	/*SearchforDiseaseViewController *searchdis = [[SearchforDiseaseViewController alloc]init];
	 [searchdis setSexualhealth:0];
	 [self.navigationController pushViewController:searchdis animated:YES];*/
	[self.navigationController pushViewController:arabicenglish animated:YES];
}

-(IBAction)AllQuestions:(id)sender {
	SpecialityEngine *speceng = [[SpecialityEngine alloc]init] ;
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[speceng requestSpecialities:^(NSMutableArray *SymptomsArray) {
		NSLog(@"Success");
		SpecialitiesViewController *specview = [[SpecialitiesViewController alloc]init];
		[specview setSpecialities:SymptomsArray];
		[self.navigationController pushViewController:specview animated:YES];
		[specview setAskorshow:1];
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
	} onError:^(NSError *error) {
		NSLog(@"failure") ;
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		
	}];
}

-(void)modifyinterface {
	[mainitems removeAllObjects];
	[self loaduser];
	User *user = [RunningUser getSingleton_instance].user ;
	if (user == nil) {
		[mainitems addObject:@"موسوعتي الطبية"];
		[mainitems addObject:@"تشخيصي"];
		[mainitems addObject:@"موسوعتي الدوائية"];
		[mainitems addObject:@"إسأل دكتوري"];
		[mainitems addObject:@"صحتي الجنسية"];
		[mainitems addObject:@"كل الاسئلة"];
		[mainitems addObject:@"الطواريء و الاسعافات الاولية"];
	}
	else {
		if (user.UserType == 1) {
			[mainitems addObject:@"موسوعتي الطبية"];
			[mainitems addObject:@"تشخيصي"];
			[mainitems addObject:@"موسوعتي الدوائية"];
			[mainitems addObject:@"إسأل دكتوري"];
			[mainitems addObject:@"صحتي الجنسية"];
			[mainitems addObject:@"كل الاسئلة"];
			[mainitems addObject:@"الطواريء و الاسعافات الاولية"];
			[mainitems addObject:@"My Questions"] ;
			[mainitems addObject:@"Logout"];
		} else {
			[mainitems addObject:@"موسوعتي الطبية"];
			[mainitems addObject:@"تشخيصي"];
			[mainitems addObject:@"موسوعتي الدوائية"];
			[mainitems addObject:@"أجب أسئلة المرضى"];
			[mainitems addObject:@"صحتي الجنسية"];
			[mainitems addObject:@"كل الاسئلة"];
			[mainitems addObject:@"الطواريء و الاسعافات الاولية"];
			//[mainitems addObject:@"Questions to answer"] ;
			[mainitems addObject:@"Logout"];
		}
	}
	
	[tableView reloadData];
}

-(void)loaduser {
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"MyUser"];
	User *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	[RunningUser getSingleton_instance].user = object ;
	
}

-(IBAction)GoToAids:(id)sender {
	FirstAidViewController *aid = [[FirstAidViewController alloc]init];
	[self.navigationController pushViewController:aid animated:YES];
}


-(IBAction)ShareOnFb:(id)sender {
	FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
	params.link = [NSURL URLWithString:@"https://itunes.apple.com/us/app/arabiata/id972572129?mt=8"];
	
	// If the Facebook app is installed and we can present the share dialog
	if ([FBDialogs canPresentShareDialogWithParams:params]) {
		[FBDialogs presentShareDialogWithLink:params.link
									  handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
										  if(error) {
											  // An error occurred, we need to handle the error
											  // See: https://developers.facebook.com/docs/ios/errors
											  NSLog(@"Error publishing story: %@", error.description);
										  } else {
											  // Success
											  NSLog(@"result %@", results);
										  }
									  }];
		
		

	} else {
		/*NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
									   @"Sharing Tutorial", @"name",
									   @"Build great social apps and get more installs.", @"caption",
									   @"Allow your users to share stories on Facebook from your app using the iOS SDK.", @"description",
									   @"https://developers.facebook.com/docs/ios/share/", @"link",
									   @"http://i.imgur.com/g3Qc1HN.png", @"picture",
									   nil];
		
		[FBWebDialogs presentFeedDialogModallyWithSession:nil
											   parameters:params
												  handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
													  if (error) {
														  // An error occurred, we need to handle the error
														  // See: https://developers.facebook.com/docs/ios/errors
														  NSLog(@"Error publishing story: %@", error.description);
													  } else {
														  if (result == FBWebDialogResultDialogNotCompleted) {
															  // User cancelled.
															  NSLog(@"User cancelled.");
														  } else {
															  // Handle the publish feed callback
															  NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
															  
															  if (![urlParams valueForKey:@"post_id"]) {
																  // User cancelled.
																  NSLog(@"User cancelled.");
																  
															  } else {
																  // User clicked the Share button
																  NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
																  NSLog(@"result %@", result);
															  }
														  }
													  }
												  }];*/
		
		UIAlertView *msg = [[UIAlertView alloc]initWithTitle:@"" message:@"You should have fb app first" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[msg show];
	}
}

- (NSDictionary*)parseURLParams:(NSString *)query {
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	for (NSString *pair in pairs) {
		NSArray *kv = [pair componentsSeparatedByString:@"="];
		NSString *val =
		[kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		params[kv[0]] = val;
	}
	return params;
}

@end
