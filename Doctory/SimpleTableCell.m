//
//  SimpleTableCell.m
//  Doctory
//
//  Created by John Maher on 3/13/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SimpleTableCell.h"
#import "QuestionsEngine.h"
#import "MBProgressHUD.h"
#import "RunningUser.h"
#import "DoctorDetailsViewController.h"
#import "AllQuestionsViewController.h"


@implementation SimpleTableCell

@synthesize UserName , UserQuestion , DoctorAnswer , DoctorName , ContainingView , height , UserAge , UserSex , Numberoflikes , likebtn , likes , ReportBtn , myquestion , userID , delegate  , likeinfo , infoinfo , CheckDoctorBtn , DocPic ;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect {
	[self accordingtolabeladjustlabel:UserName];
	[self accordingtolabeladjustlabel:UserQuestion];
	[self accordingtolabeladjustlabel:DoctorName];
	[self accordingtolabeladjustlabel:DoctorAnswer];
	
	float myheight = UserName.frame.size.height + UserQuestion.frame.size.height + DoctorName.frame.size.height + DoctorAnswer.frame.size.height  + 70 ;
	UIView *myview = [[UIView alloc]initWithFrame:CGRectMake(10, 5, 300 , myheight)];
	[myview setBackgroundColor:[UIColor whiteColor]];
	//[self addSubview:myview];
	//[self sendSubviewToBack:myview];
	
	CGFloat firstbgcolor = 62.0/255.0 ;
	CGFloat secondbgcolor = 57.0/255.0 ;
	CGFloat thirdcolor = 57.0/255.0 ;
	
	UIColor *myprimarycolor = [UIColor colorWithRed:firstbgcolor green:secondbgcolor blue:thirdcolor alpha:1];
	
	[UserName setTextAlignment:NSTextAlignmentRight];
	[UserName setTextColor:[UIColor whiteColor]];
	[UserName setBackgroundColor:myprimarycolor];
	
	CGRect questionrect = UserQuestion.frame ;
	questionrect.origin.y = UserName.frame.origin.y + UserName.frame.size.height ;
	UserQuestion.frame = questionrect ;
	
	[UserQuestion setTextColor:[UIColor whiteColor]];
	[UserQuestion setBackgroundColor:myprimarycolor];
	
	
	CGFloat fontfirstbgcolor = 59.0/255.0 ;
	CGFloat fontsecondbgcolor = 127.0/255.0 ;
	CGFloat fontthirdcolor = 236.0/255.0 ;
	
	UIColor *myfontcolor = [UIColor colorWithRed:fontfirstbgcolor green:fontsecondbgcolor blue:fontthirdcolor alpha:1];
	
	
	CGRect doctornamerect = DoctorName.frame ;
	doctornamerect.origin.y = questionrect.origin.y + questionrect.size.height ;
	DoctorName.frame = doctornamerect ;
	
	[DoctorName setTextAlignment:NSTextAlignmentRight];
	
	
	CGRect doctoranswer = DoctorAnswer.frame ;
	doctoranswer.origin.y = doctornamerect.origin.y + doctornamerect.size.height ;
	DoctorAnswer.frame = doctoranswer ;
	[DoctorAnswer setTextColor:myfontcolor];
	
	CGRect likeframe = likebtn.frame ;
	likeframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	likebtn.frame = likeframe ;

	
	CGRect numberoflikesframe = Numberoflikes.frame ;
	numberoflikesframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	Numberoflikes.frame = numberoflikesframe ;
	
	
	CGRect likesframe = likes.frame ;
	likesframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	likes.frame = likesframe ;
	
	CGRect Reportframe = ReportBtn.frame ;
	Reportframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	ReportBtn.frame = Reportframe ;
	
	CGRect checkbuttonframe = CheckDoctorBtn.frame ;
	checkbuttonframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	CheckDoctorBtn.frame = checkbuttonframe ;
	
	CGRect likeimgframe = likeinfo.frame ;
	likeimgframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	likeinfo.frame = likeimgframe ;
	
	CGRect infoframe = infoinfo.frame ;
	infoframe.origin.y = doctoranswer.origin.y + doctoranswer.size.height ;
	infoinfo.frame = infoframe ;
	
	CGRect docimgframe = DocPic.frame;
	docimgframe.origin.y = DoctorName.frame.origin.y + 5 ;
	DocPic.frame = docimgframe ;
	
	/*float myheight = UserName.frame.size.height + UserQuestion.frame.size.height + DoctorName.frame.size.height + DoctorAnswer.frame.size.height + 70 ;
	
	CGRect recta = ContainingView.frame ;
	recta.size.height = myheight ;
	ContainingView.frame = recta ;*/
	
	//[self accordingtolabeladjustlabel:DoctorAnswer];
	//NSLog(@"height : %d" , height) ;
	/*height = myheight ; */
	
}


-(void)accordingtolabeladjustlabel:(UILabel*)yourLabel {
	CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
	
	CGSize expectedLabelSize = [yourLabel.text sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];
	
	//adjust the label the the new height.
	CGRect newFrame = yourLabel.frame;
	newFrame.size.height = expectedLabelSize.height * 1.4;
	yourLabel.frame = newFrame;
}

-(IBAction)like:(id)sender {
	
	if ([likebtn.titleLabel.text isEqualToString:@"Like"])
		[likebtn setTitle:@"Unlike" forState:UIControlStateNormal];
	else
		[likebtn setTitle:@"Like" forState:UIControlStateNormal];
	
	QuestionsEngine *questengine = [[QuestionsEngine alloc]init] ;
	
	NSString *questionIDstring = [NSString stringWithFormat:@"%d",myquestion.QuestionId];
	NSString *useridstring = [NSString stringWithFormat:@"%d",userID];
	
	
	NSMutableDictionary *content = [[NSMutableDictionary alloc]init ] ;
	[content setObject:useridstring forKey:@"UserId"];
	[content setObject:questionIDstring forKey:@"QuestionId"];
	
	User *user = [RunningUser getSingleton_instance].user ;
	int numlikes = [Numberoflikes.text intValue];
	
	if ([likebtn.titleLabel.text isEqualToString:@"Like"]) {
		[content setObject:@"true" forKey:@"Like"];
		NSMutableArray *likedmutable = [user.likedquestionsids mutableCopy];
		[likedmutable addObject: [NSNumber numberWithInt:myquestion.QuestionId]];
		[user setLikedquestionsids:likedmutable];
		[self SaveUser:user];
		numlikes++ ;
		[Numberoflikes setText:[NSString stringWithFormat:@"%d",numlikes]];
		//[user.likedquestionsids addObject:[NSNumber numberWithInt:myquestion.QuestionId]];
	}
	else {
		[content setObject:@"false" forKey:@"Like"];
		NSMutableArray *likedmutable = [user.likedquestionsids mutableCopy];
		for (int i = 0 ; i < likedmutable.count ; i++) {
			NSNumber *num = [likedmutable objectAtIndex:i];
			if (myquestion.QuestionId == num.intValue) {
				[likedmutable removeObjectAtIndex:i];
				break;
			}
		}
		[user setLikedquestionsids:likedmutable];
		[self SaveUser:user];
		numlikes-- ;
		[Numberoflikes setText:[NSString stringWithFormat:@"%d",numlikes]];
		/*for (int i = 0 ; i < user.likedquestionsids.count ; i++) {
			NSNumber *num = [user.likedquestionsids objectAtIndex:i];
			if (myquestion.QuestionId == num.intValue)
				[user.likedquestionsids removeObjectAtIndex:i];
		}*/
	}
	
	NSMutableDictionary *likedata = [[NSMutableDictionary alloc]init] ;
	[likedata setObject:content forKey:@"likeData"];
	
	//[delegate showhud];
	[questengine LikeQuestion:likedata onSuccess:^(NSMutableArray *QuestionsArray) {
	//	[delegate hidehud] ;
		NSLog(@"Like Success") ;
		CGRect likeframe = likebtn.frame ;
		likeframe.origin.y = DoctorAnswer.frame.origin.y + DoctorAnswer.frame.size.height ;
		likebtn.frame = likeframe ;
	} onError:^(NSError *error) {
	//	[delegate hidehud];
		NSLog(@"Like Failed") ;
		UIAlertView *msg = [[UIAlertView alloc]initWithTitle:nil message:@"Sorry , there's a problem connecting with server" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[msg show] ;
	}];
	
	
	
	//NSLog(@"Like") ;
}

-(IBAction)report:(id)sender {
	
	UIAlertView *msg = [[UIAlertView alloc]initWithTitle:@"مسح السؤال؟" message:@"هل انت متأكد انك تريد مسح هذا السؤال؟" delegate:self cancelButtonTitle:@"متأكد، إمسح السؤال" otherButtonTitles:@"إغلاق", nil];
	[msg show];
	
}


-(void)deletequestion {
	QuestionsEngine *questengine = [[QuestionsEngine alloc]init] ;
	
	NSString *questionIDstring = [NSString stringWithFormat:@"%d",myquestion.QuestionId];
	
	NSMutableDictionary *content = [[NSMutableDictionary alloc]init ] ;
	[content setObject:questionIDstring forKey:@"questionId"];
	//[delegate showhud];
	[questengine ReportQuestion:content onSuccess:^(NSMutableArray *QuestionsArray) {
		//	[delegate hidehud] ;
		NSLog(@"Report Success") ;
	} onError:^(NSError *error) {
		//	[delegate hidehud];
		NSLog(@"Report Failed") ;
		UIAlertView *msg = [[UIAlertView alloc]initWithTitle:nil message:@"Sorry , there's a problem connecting with server" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[msg show] ;
	}];
	
	
	
	NSLog(@"Report") ;
}

-(void)SaveUser:(User*)user {
	NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"MyUser"];
    [defaults synchronize];
}

-(IBAction)GoToDoctorPage:(id)sender {
	[delegate CheckdetailsofDoctor:myquestion.ActingDoctor];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		[self deletequestion];
		[delegate popback];
	}
}



@end
