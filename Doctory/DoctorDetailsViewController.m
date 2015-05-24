//
//  DoctorDetailsViewController.m
//  Doctory
//
//  Created by John Maher on 7/16/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DoctorDetailsViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface DoctorDetailsViewController ()

@end

@implementation DoctorDetailsViewController

/*@property (retain) User *Doctor ;
@property (retain) IBOutlet UIView *contentView ;
@property (retain) IBOutlet UIScrollView *scrollview ;
@property (retain) IBOutlet UILabel *Doctorname ;
@property (retain) IBOutlet UILabel *DoctorDescription ;
@property (retain) IBOutlet UILabel *GeneralInfo ;
@property (retain) IBOutlet UILabel *SpecialityLabel ;
@property (retain) IBOutlet UILabel *SpecialityValue ;
@property (retain) IBOutlet UILabel *JobLabel ;
@property (retain) IBOutlet UILabel *JobValue ;
@property (retain) IBOutlet UILabel *UserNameLabel ;
@property (retain) IBOutlet UILabel *UserNameValue ;
@property (retain) IBOutlet UILabel *ContactUs ;
@property (retain) IBOutlet UILabel *EmailLabel ;
@property (retain) IBOutlet UILabel *EmailValue ;*/


@synthesize Doctor , ContactUs ,contentView , scrollview , DoctorDescription , Doctorname , GeneralInfo , SpecialityLabel , SpecialityValue , JobLabel , JobValue , UserNameLabel , UserNameValue , EmailLabel , EmailValue , SubView, DocProfilePic ;

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
	
	NSString *imageurlstring = [NSString stringWithFormat:@"http://ws.doctory.info/DoctorsImages/%d.png",Doctor.UserId];
	NSURL *imageurl = [NSURL URLWithString:imageurlstring];
	UIImage *placeholderimg = [UIImage imageNamed:@"DocPlaceHolder.jpg"];
	[DocProfilePic sd_setImageWithURL:imageurl placeholderImage:placeholderimg];
	
	
	CGFloat red = 62.0/255.0 ;
	CGFloat green = 57.0/255.0;
	CGFloat blue = 57.0/255.0 ;
	
	[SubView setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0f]];
	
	CGFloat fontfirstbgcolor = 59.0/255.0 ;
	CGFloat fontsecondbgcolor = 127.0/255.0 ;
	CGFloat fontthirdcolor = 236.0/255.0 ;
	
	
	
	[GeneralInfo setTextColor:[UIColor colorWithRed:fontfirstbgcolor green:fontsecondbgcolor blue:fontthirdcolor alpha:1.0f]];
	[ContactUs setTextColor:[UIColor colorWithRed:fontfirstbgcolor green:fontsecondbgcolor blue:fontthirdcolor alpha:1.0f]];
	
	
	Doctorname.text = Doctor.Name ;
	DoctorDescription.text = Doctor.Title ;
	[Doctorname setTextColor:[UIColor whiteColor]];
	[DoctorDescription setTextColor:[UIColor whiteColor]]; 
	SpecialityValue.text = Doctor.SpecialityName ;
	JobValue.text = Doctor.Work ;
	UserNameValue.text = Doctor.UserName ;
	EmailValue.text = Doctor.Email ;
	
	[self accordingtolabeladjustlabel:SpecialityValue];
	[self accordingtolabeladjustlabel:JobValue];
	[self accordingtolabeladjustlabel:UserNameValue];
	[self accordingtolabeladjustlabel:EmailValue] ;
	
	int jobY = SpecialityValue.frame.origin.y + SpecialityValue.frame.size.height + 5 ;
	CGRect joblabelframe = JobLabel.frame ;
	CGRect jobvalueframe = JobValue.frame ;
	joblabelframe.origin.y = jobY ;
	jobvalueframe.origin.y = jobY ;
	[JobLabel setFrame:joblabelframe];
	[JobValue setFrame:jobvalueframe];
	
	int userY = JobValue.frame.origin.y + JobValue.frame.size.height + 5 ;
	CGRect userlabelframe = UserNameLabel.frame ;
	CGRect useralueframe = UserNameValue.frame ;
	userlabelframe.origin.y = userY ;
	useralueframe.origin.y = userY ;
	[UserNameLabel setFrame:userlabelframe];
	[UserNameLabel setFrame:useralueframe];
	
	int ContactY = UserNameValue.frame.origin.y + UserNameValue.frame.size.height + 20 ;
	CGRect Contactframe = ContactUs.frame ;
	Contactframe.origin.y = ContactY ;
	[ContactUs setFrame:Contactframe];
	
	int EmailY = ContactUs.frame.origin.y + ContactUs.frame.size.height + 5 ;
	CGRect EmailLabelFrame = EmailLabel.frame ;
	CGRect EmailValueFrame = EmailValue.frame ;
	EmailLabelFrame.origin.y = EmailY ;
	EmailValueFrame.origin.y = EmailY ;
	[EmailLabel setFrame:EmailLabelFrame];
	[EmailValue setFrame:EmailValueFrame];
	
	CGRect contentframe = contentView.frame ;
	contentframe.size.height = GeneralInfo.frame.size.height + SpecialityValue.frame.size.height + JobValue.frame.size.height + UserNameValue.frame.size.height + ContactUs.frame.size.height + EmailValue.frame.size.height + 50 ;
	[contentView setFrame:contentframe];
	[contentView setBackgroundColor:[UIColor clearColor]];
	scrollview.contentSize = CGSizeMake(contentView.frame.size.width, contentView.frame.size.height);
	[scrollview addSubview:contentView] ; 
	
    // Do any additional setup after loading the view from its nib.
}

-(void)accordingtolabeladjustlabel:(UILabel*)yourLabel {
	CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
	
	CGSize expectedLabelSize = [yourLabel.text sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];
	
	//adjust the label the the new height.
	CGRect newFrame = yourLabel.frame;
	newFrame.size.height = expectedLabelSize.height;
	yourLabel.frame = newFrame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
