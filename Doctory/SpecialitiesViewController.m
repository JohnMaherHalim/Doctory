//
//  SpecialitiesViewController.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SpecialitiesViewController.h"
#import "Speciality.h"
#import "MyQuestionViewController.h"
#import "MBProgressHUD.h"
#import "QuestionsEngine.h"
#import "AllQuestionsViewController.h"
#import "LoginViewController.h"
#import "RunningUser.h"
#import "SignedUserQuestionViewController.h"

@interface SpecialitiesViewController ()

@end

@implementation SpecialitiesViewController

@synthesize tableView , Specialities , askorshow ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"اختر التخصص" ; 
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[tableView setBackgroundColor:[UIColor clearColor]];
	//[self.view setBackgroundColor:[UIColor colorWithPatternImage: [UIImage imageNamed: @"questions.png"]] ];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [Specialities count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
	NSString *identif = [NSString stringWithFormat:@"%d-%d",indexPath.section , indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:identif];
	
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identif];
    }
	
	//cell.textLabel.text = [diseases objectAtIndex:indexPath.row];
	[cell setSelectionStyle:UITableViewCellEditingStyleNone];
	[cell setBackgroundColor:[UIColor clearColor]];
	[cell.contentView setBackgroundColor:[UIColor clearColor]];
	Speciality *dis = [Specialities objectAtIndex:indexPath.row];
	//cell.textLabel.text = dis.NameAr ;
	
	UILabel *spectext = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width - 10, cell.frame.size.height)];
	[spectext setText:dis.NameAr];
	[spectext setBackgroundColor:[UIColor clearColor]];
	[spectext setTextAlignment:NSTextAlignmentRight];
	[cell addSubview:spectext];
	//cell.textLabel.textAlignment = UITextAlignmentRight;
	
	return cell ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	/*NSString *letter = [diseaseletters objectAtIndex:indexPath.row];
	 DiseaseEngine *diseng = [[DiseaseEngine alloc]init];
	 [diseng requestDiseases:0 Withletter:letter onSuccess:^(NSMutableArray *DiseasesArray) {
	 NSLog(@"success");
	 DiseaseArrayViewController *disarr = [[DiseaseArrayViewController alloc]init];
	 [disarr setDiseases:DiseasesArray];
	 [self.navigationController pushViewController:disarr animated:YES];
	 } onError:^(NSError *error) {
	 NSLog(@"error") ;
	 }];*/
	
	/*Symptom *dis = [Symptoms objectAtIndex:indexPath.row];
	 DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
	 [diseasedetails setDisease:dis];
	 [self.navigationController pushViewController:diseasedetails animated:YES];*/
	
	Speciality *dis = [Specialities objectAtIndex:indexPath.row];
	MyQuestionViewController *ques = [[MyQuestionViewController alloc]init] ;
	//[ques setSpecname:dis.NameAr] ;
	//[ques setSpecID:dis.SpecialityId];
	//[self.navigationController pushViewController:ques animated:YES];
	
	
	/*[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	//Organ *organ = [Organs objectAtIndex:indexPath.row];
	QuestionsEngine *symengine = [[QuestionsEngine alloc]init];
	[symengine requestQuestionsBySpecialityID:dis.SpecialityId onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"succes") ;
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		AllQuestionsViewController *symperorg = [[AllQuestionsViewController alloc]init];
		//[symperorg setSymptoms:SymptomsArray] ;
		[symperorg setQuestions:QuestionsArray];
		[self.navigationController pushViewController:symperorg animated:YES];
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		NSLog(@"failure");
	}];*/
	
	
	
	
	/*MyQuestionViewController *myquest = [[MyQuestionViewController alloc]init];
	[myquest setSpecID:dis.SpecialityId];
	[myquest setSpecname:dis.NameAr];
	[self.navigationController pushViewController:myquest animated:YES];*/
	
	
	
	/*[symengine requestSymptomsByOrganID:organ.OrganID onSuccess:^(NSMutableArray *SymptomsArray) {
		NSLog(@"succes") ;
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		SymptomsperOrgan *symperorg = [[SymptomsperOrgan alloc]init];
		[symperorg setSymptoms:SymptomsArray] ;
		[self.navigationController pushViewController:symperorg animated:YES];
		
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		NSLog(@"failure");
	}];*/
	
	
	//NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults]; ;
	User *user = [RunningUser getSingleton_instance].user;
	if (askorshow == 0) {
		if (user == nil) {
			LoginViewController *login = [[LoginViewController alloc]init] ;
			[login setSpecialities:Specialities];
			[login setSpecID:dis.SpecialityId];
			[login setSpecname:dis.NameAr];
			[self.navigationController pushViewController:login animated:YES];
		} else {
			if (user.UserType == 1) {
				SignedUserQuestionViewController *signeduser = [[SignedUserQuestionViewController alloc]init];
				[signeduser setMyuser:user];
				[signeduser setSpecID:dis.SpecialityId];
				[self.navigationController pushViewController:signeduser animated:YES]; 
			}
		}
	} else {
		QuestionsEngine *symengine = [[QuestionsEngine alloc]init];
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[symengine requestQuestionsBySpecialityID:dis.SpecialityId onSuccess:^(NSMutableArray *QuestionsArray) {
			NSLog(@"succes") ;
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			AllQuestionsViewController *symperorg = [[AllQuestionsViewController alloc]init];
			//[symperorg setSymptoms:SymptomsArray] ;
			[symperorg setQuestions:QuestionsArray];
			[MBProgressHUD hideHUDForView:self.view animated:YES];
			[self.navigationController pushViewController:symperorg animated:YES];
		} onError:^(NSError *error) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			NSLog(@"failure");
		}];
		
	}
	/*if (user == nil) {
		LoginViewController *login = [[LoginViewController alloc]init] ;
		[login setSpecialities:Specialities];
		[login setSpecID:dis.SpecialityId];
		[login setSpecname:dis.NameAr];
		[self.navigationController pushViewController:login animated:YES];
	} else {
		MyQuestionViewController *myquest = [[MyQuestionViewController alloc]init];
		[myquest setSpecID:dis.SpecialityId];
		[myquest setSpecname:dis.NameAr];
		[self.navigationController pushViewController:myquest animated:YES];
	}*/
	
}


@end
