//
//  QuestionsOptionsViewController.m
//  Doctory
//
//  Created by John Maher on 5/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "QuestionsOptionsViewController.h"
#import "RunningUser.h"
#import "SpecialityEngine.h"
#import "QuestionsEngine.h"
#import "MBProgressHUD.h"
#import "AllQuestionsViewController.h"
#import "SpecialitiesViewController.h"

@interface QuestionsOptionsViewController ()

@end

@implementation QuestionsOptionsViewController

@synthesize  myquestions , logout , answerorask ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	User *user = [RunningUser getSingleton_instance].user ;
	if (user == nil) {
		[myquestions setHidden:YES] ;
		[logout setHidden:YES] ; 
	}
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)checkallquestions:(id)sender {
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

-(IBAction)AskAQuestion:(id)sender{
	User *user = [RunningUser getSingleton_instance].user ;
	
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
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
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

-(IBAction)checkmyquestions:(id)sender{
	User *user = [RunningUser getSingleton_instance].user ;
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

-(void)viewWillAppear:(BOOL)animated {
	[self modifyinterface] ; 
}

-(IBAction)Logout:(id)sender{
	User *user = [RunningUser getSingleton_instance].user ;
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setInteger:user.UserId forKey:@"RegisterDeviceUserID"];
	[defaults setBool:false forKey:@"RegisterDeviceState"];
	//[defaults synchronize];
	
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
	 (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
	
	//NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:nil forKey:@"MyUser"];
	[defaults setObject:nil forKey:@"myUserName"];
	[defaults setObject:nil forKey:@"myPassword"];
	
	[defaults synchronize];
	[self modifyinterface] ;
}

-(void)modifyinterface{
	[self loaduser];
	User *user = [RunningUser getSingleton_instance].user ;
	if (user == nil) {
		[answerorask setBackgroundImage:[UIImage imageNamed:@"a.png"] forState:UIControlStateNormal];
		[myquestions setHidden:YES] ;
		[logout setHidden:YES] ;
	} else {
		[myquestions setHidden:NO];
		[logout setHidden:NO];
	}
	
	if (user.UserType == 2) {
		[answerorask setBackgroundImage:[UIImage imageNamed:@"z.png"] forState:UIControlStateNormal];
		[myquestions setHidden:YES];
	} else if (user.UserType == 1) {
		[answerorask setBackgroundImage:[UIImage imageNamed:@"a.png"] forState:UIControlStateNormal];
		[myquestions setHidden:NO];
		[answerorask setHidden:NO];
	}
	
	
	
}

-(void)loaduser {
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"MyUser"];
	User *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	[RunningUser getSingleton_instance].user = object ;
	
}

@end
