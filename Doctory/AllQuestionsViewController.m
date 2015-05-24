//
//  AllQuestionsViewController.m
//  Doctory
//
//  Created by John Maher on 3/12/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "AllQuestionsViewController.h"
#import "SimpleTableCell.h"
#import "DoctorAnswerViewController.h"
#import "RunningUser.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "DoctorDetailsViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "UserEngine.h"

@interface AllQuestionsViewController ()

@end

@implementation AllQuestionsViewController

@synthesize Questions , tableView , enabled ;

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
	[self refreshuser];
	[self.view setBackgroundColor:[UIColor blackColor]];
	[tableView setBackgroundColor:[UIColor clearColor]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [Questions count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	/*UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
	
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"eventCell"];
    }
	
	//cell.textLabel.text = [diseases objectAtIndex:indexPath.row];
	/*Speciality *dis = [Specialities objectAtIndex:indexPath.row];
	cell.textLabel.text = dis.NameAr ;*/
	
	Question *quest = [Questions objectAtIndex:indexPath.row];
	//cell.textLabel.text = quest.QuestionText ;
	
	NSString *str = [NSString stringWithFormat:@"%d",indexPath.row];
	 NSString *simpleTableIdentifier = str;
	
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
		
    }
	
	cell.myquestion = quest ;
	
	cell.delegate = self ; 
	
	User *user = [RunningUser getSingleton_instance].user ;
	
	
	
	
	if (user == nil) {
		[cell.likebtn setHidden:YES];
		[cell.ReportBtn setHidden:YES] ;
		[cell.likeinfo setHidden:YES];
	}
	else {
		
		cell.userID = user.UserId ; 
		
		if (user.UserType == 1 ) {
			[cell.likebtn setHidden:NO];
			[cell.likeinfo setHidden:NO];
			[cell.ReportBtn setHidden:YES] ;
		} else if (user.UserType == 2) {
			[cell.likebtn setHidden:YES] ;
			[cell.likeinfo setHidden:YES]; 
			[cell.ReportBtn setHidden:NO] ;
		}

	}
	
	BOOL found = [self likedquestion:quest.QuestionId];
	if (found) {
		[cell.likebtn setTitle:@"Unlike" forState:UIControlStateNormal];
	}
	else {
		[cell.likebtn setTitle:@"Like" forState:UIControlStateNormal];
	}
	
	
	//cell.contentView.backgroundColor = [UIColor clearColor];
	
	[cell setBackgroundColor:[UIColor clearColor]];
	//cell.UserQuestion.text = quest.QuestionText ;
	NSString *Doctorname = quest.ActingDoctor.Name ;
	NSString *DoctorTitle = quest.ActingDoctor.Title ;
	NSString *UserName = quest.Patient.UserName ;
	if ([UserName isEqualToString:@""])
		UserName = @"غير مشترك" ;
	UserName = [NSString stringWithFormat:@"السائل:%@",UserName];
	Doctorname = [NSString stringWithFormat:@"%@ ، %@" , Doctorname ,DoctorTitle];

	
	if ([quest.ActingDoctor.UserName isEqualToString:@""]) {
		cell.CheckDoctorBtn.hidden = YES ;
		cell.infoinfo.hidden = YES ;
		//cell.DoctorAnswer.hidden = YES ;
		cell.DoctorName.hidden = YES ; 
	}
	
	if ([UserName isEqualToString:@""])
		UserName = @"\"Anonymous Patient\"";
	
	/*if ([Doctorname isEqualToString:@""])
		Doctorname = @"<Anonymous Doctor>";*/
	
	/*cell.UserQuestion.text = quest.QuestionText ;
	cell.UserName.text = UserName ;
	cell.DoctorName.text = Doctorname ;
	cell.DoctorAnswer.text  = quest.AnswerText ;*/
	
	NSString *imageurlstring = [NSString stringWithFormat:@"http://ws.doctory.info/DoctorsImages/%d.png",quest.ActingDoctor.UserId];
	NSURL *imageurl = [NSURL URLWithString:imageurlstring];
	UIImage *placeholderimg = [UIImage imageNamed:@"DocPlaceHolder.jpg"];
	[cell.DocPic sd_setImageWithURL:imageurl placeholderImage:placeholderimg];
	/*NSLog(imageurl);
	UIImage *docimage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageurl]]];*/
	//[cell.DocPic setImage:docimage];
	
	
	
	cell.UserQuestion.text = UserName ;
	cell.UserName.text = quest.QuestionText ;
	cell.DoctorName.text = Doctorname;
	if ([quest.AnswerText isEqualToString:@""]) {
		[cell.likeinfo setHidden:YES];
		[cell.likebtn setHidden:YES] ; 
	}
	
	if(quest.AnswerText.length == 0)
		cell.DoctorAnswer.text = @"لم يتم الاجابة بعد" ;
	else
		cell.DoctorAnswer.text  = quest.AnswerText ;
	[cell.DoctorAnswer setTextAlignment:NSTextAlignmentRight];
	
	//cell.DoctorAnswer.numberOfLines = 0 ;
	 // @"this is test this is test inthis is test ininthis is test inthis is test inthis is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ...this is test in uilabel ..." ; //quest.AnswerText ;
	
	cell.Numberoflikes.text = [NSString stringWithFormat:@"%d" ,quest.numberoflikes] ;
	
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	/*cell.DoctorAnswer.numberOfLines = 0 ;
	[cell.DoctorAnswer sizeToFit];*/
	//cell.DoctorAnswer.adjustsFontSizeToFitWidth = true ;
	
	return cell ;
	
}

-(void)CheckdetailsofDoctor:(User*)Doctor {
	DoctorDetailsViewController *docdetails = [[DoctorDetailsViewController alloc]init] ;
	[docdetails setDoctor:Doctor];
	
	[self.navigationController pushViewController:docdetails animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	SimpleTableCell *cell = (SimpleTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	/*float height = cell.UserName.frame.size.height + cell.UserQuestion.frame.size.height + cell.DoctorName.frame.size.height + cell.DoctorAnswer.frame.size.height +50 ;
	
	CGRect viewframe = cell.ContainingView.frame ;
	viewframe.size.height = height + 300 ;
	cell.ContainingView.frame = viewframe ;*/
	
	float pourcent = 1.4 ;
	
	float height1 = [self heightoflabel:cell.UserName]*pourcent;
	float height2 = [self heightoflabel:cell.UserQuestion]*pourcent;
	float height3 = [self heightoflabel:cell.DoctorName]*pourcent;
	float height4 = [self heightoflabel:cell.DoctorAnswer]*pourcent;
	//float height5  = [self heightoflabel:cell.]
	
	float height = height1 + height2 + height3 + height4 + 40 ;
	
	
	return height ;
	
}


-(float )heightoflabel:(UILabel*)yourLabel {
	CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
	
	CGSize expectedLabelSize = [yourLabel.text sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];
	
	float height = expectedLabelSize.height ;
	
	return  height ;
	//adjust the label the the new height.
	/*CGRect newFrame = yourLabel.frame;
	newFrame.size.height = expectedLabelSize.height;
	yourLabel.frame = newFrame;*/
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (enabled) {
		Question *quest = [Questions objectAtIndex:indexPath.row];
		DoctorAnswerViewController *docans = [[DoctorAnswerViewController alloc]init] ;
		[docans setMyquestion:quest];
		[self.navigationController pushViewController:docans animated:YES]; 
	}
}

-(void)showhud {
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hidehud {
	[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(BOOL)likedquestion:(int)questionid {
	User *user = [RunningUser getSingleton_instance].user ;
	BOOL found = NO ;
	for (NSNumber *i in user.likedquestionsids) {
		if ([i intValue] == questionid)
			found = YES ;
	}
	return found ;
}

-(void)popback {
	[self.navigationController popViewControllerAnimated:YES];
}

-(void)refreshuser {
	User *user = [RunningUser getSingleton_instance].user ;
	
	if (user) {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		//[defaults setObject:nil forKey:@"myUserName"];
		//[defaults setObject:nil forKey:@"myPassword"];
		NSString *username = [defaults objectForKey:@"myUserName"];
		NSString *password = [defaults objectForKey:@"myPassword"];
		
		
		UserEngine *userengine = [[UserEngine alloc]init] ;
		
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		
		[userengine requestLoginUser:username Withletter:password onSuccess:^(NSMutableArray *DiseasesArray) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			[self loaduser];
			[tableView reloadData];
			NSLog(@"Login success") ;
		} onError:^(NSError *error) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			NSLog(@"Login Failed") ;
		}];
	}
	
}

-(void)loaduser {
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"MyUser"];
	User *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	[RunningUser getSingleton_instance].user = object ;
	
}


@end
