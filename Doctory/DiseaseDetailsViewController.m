//
//  DiseaseDetailsViewController.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DiseaseDetailsViewController.h"
#import "OSLabel.h"

@interface DiseaseDetailsViewController ()

@end

@implementation DiseaseDetailsViewController

@synthesize disease , Reasonstext , Treatmenttext , Complicationstext , scrollView , contentView ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = disease.NameAr ; 
        // Custom initialization
    }
    return self;
}

-(void)accordingtolabeladjustlabel:(UILabel*)yourLabel {
	CGSize maximumLabelSize = CGSizeMake(yourLabel.frame.size.width, FLT_MAX);
	
	CGSize expectedLabelSize = [yourLabel.text sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];
	
	//adjust the label the the new height.
	CGRect newFrame = yourLabel.frame;
	newFrame.size.height = expectedLabelSize.height*1.4;
	yourLabel.frame = newFrame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = disease.NameAr ;
	
	UIView *contentview = [[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
	
	UILabel *Arabicnametitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,20, 90, 0)];
	[Arabicnametitle setText:@"الاسم بالأنجليزية :"];
	[Arabicnametitle setNumberOfLines:0];
	[Arabicnametitle setTextAlignment:NSTextAlignmentRight];
	[self accordingtolabeladjustlabel:Arabicnametitle];
	[contentview addSubview:Arabicnametitle];
	
	OSLabel *Arabicnamevalue = [[OSLabel alloc]initWithFrame:CGRectMake(10,Arabicnametitle.frame.origin.y , self.view.frame.size.width - Arabicnametitle.frame.size.width - 20, 0)];
	[Arabicnamevalue setText:disease.Name];
	[Arabicnamevalue setTag:5];
	[Arabicnamevalue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:Arabicnamevalue];
	[contentview addSubview:Arabicnamevalue];
	
	UILabel *ComplicationsTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,Arabicnamevalue.frame.origin.y + Arabicnametitle.frame.size.height, 90, 0)];
	[ComplicationsTitle setText:@"مقدمة :"];
	[ComplicationsTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:ComplicationsTitle];
	[contentview addSubview:ComplicationsTitle];
	
	OSLabel *ComplicationsValue = [[OSLabel alloc]initWithFrame:CGRectMake(10,Arabicnamevalue.frame.origin.y + Arabicnametitle.frame.size.height, self.view.frame.size.width - ComplicationsTitle.frame.size.width - 20, 0)];
	[ComplicationsValue setText:disease.Introduction];
	[ComplicationsValue setTag:5];
	[ComplicationsValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:ComplicationsValue];
	[contentview addSubview:ComplicationsValue];
	
	UILabel *DiagnosesTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,ComplicationsValue.frame.origin.y + ComplicationsValue.frame.size.height, 90, 0)];
	[DiagnosesTitle setText:@"العلاج :"];
	[DiagnosesTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:DiagnosesTitle];
	[contentview addSubview:DiagnosesTitle];
	
	OSLabel *DiagnosesValue = [[OSLabel alloc]initWithFrame:CGRectMake(10,ComplicationsValue.frame.origin.y + ComplicationsValue.frame.size.height, self.view.frame.size.width - DiagnosesTitle.frame.size.width - 20, 0)];
	[DiagnosesValue setText:disease.Treatement];
	[DiagnosesValue setTag:5];
	[DiagnosesValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:DiagnosesValue];
	[contentview addSubview:DiagnosesValue];
	
	UILabel *SymptomsTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,DiagnosesValue.frame.origin.y + DiagnosesValue.frame.size.height, 90, 0)];
	[SymptomsTitle setText:@"الاسباب :"];
	[SymptomsTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:SymptomsTitle];
	[contentview addSubview:SymptomsTitle];
	
	OSLabel *SymptomsValue = [[OSLabel alloc]initWithFrame:CGRectMake(10,DiagnosesValue.frame.origin.y + DiagnosesValue.frame.size.height, self.view.frame.size.width - SymptomsTitle.frame.size.width - 20, 0)];
	[SymptomsValue setText:disease.Reasons];
	[SymptomsValue setTag:5];
	[SymptomsValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:SymptomsValue];
	[contentview addSubview:SymptomsValue];
	
	UILabel *IntroductionTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,SymptomsValue.frame.origin.y + SymptomsValue.frame.size.height, 90, 0)];
	[IntroductionTitle setText:@"التشخيص :"];
	[IntroductionTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:IntroductionTitle];
	[contentview addSubview:IntroductionTitle];
	
	OSLabel *IntroductionValue = [[OSLabel alloc]initWithFrame:CGRectMake(10,SymptomsValue.frame.origin.y + SymptomsValue.frame.size.height, self.view.frame.size.width - IntroductionTitle.frame.size.width - 20, 0)];
	[IntroductionValue setText:disease.Diagnoses];
	[IntroductionValue setTag:5];
	[IntroductionValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:IntroductionValue];
	[contentview addSubview:IntroductionValue];
	
	UILabel *ReasonsTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,IntroductionValue.frame.origin.y + IntroductionValue.frame.size.height, 90, 0)];
	[ReasonsTitle setText:@"المضاعفات :"];
	[ReasonsTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:ReasonsTitle];
	[contentview addSubview:ReasonsTitle];
	
	OSLabel *ReasonsValue = [[OSLabel alloc]initWithFrame:CGRectMake(10,IntroductionValue.frame.origin.y + IntroductionValue.frame.size.height, self.view.frame.size.width - ReasonsTitle.frame.size.width- 20, 0)];
	[ReasonsValue setText:disease.Complications];
	[ReasonsValue setTag:5];
	[ReasonsValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:ReasonsValue];
	[contentview addSubview:ReasonsValue];
	
	
	UILabel *TreatementTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 110,ReasonsValue.frame.origin.y + ReasonsValue.frame.size.height, 90, 0)];
	[TreatementTitle setText:@"الاعراض :"];
	[TreatementTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:TreatementTitle];
	[contentview addSubview:TreatementTitle];
	
	OSLabel *TreatementValue = [[OSLabel alloc]initWithFrame:CGRectMake(10,ReasonsValue.frame.origin.y + ReasonsValue.frame.size.height, self.view.frame.size.width - TreatementTitle.frame.size.width - 20, 0)];
	[TreatementValue setText:disease.DiseaseSymptoms];
	[TreatementValue setTag:5];
	[TreatementValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:TreatementValue];
	[contentview addSubview:TreatementValue];
	
	CGRect contentframe = contentview.frame ;
	contentframe.size.height = ComplicationsTitle.frame.size.height + ComplicationsValue.frame.size.height + DiagnosesTitle.frame.size.height + DiagnosesValue.frame.size.height + SymptomsTitle.frame.size.height + SymptomsValue.frame.size.height + IntroductionTitle.frame.size.height + IntroductionValue.frame.size.height + ReasonsTitle.frame.size.height + ReasonsValue.frame.size.height + TreatementTitle.frame.size.height + TreatementValue.frame.size.height  ;
	contentview.frame = contentframe ;
	
	[contentview setBackgroundColor:[UIColor clearColor]];
	
	
	for (UILabel *subview in contentview.subviews) {
		if ([subview isKindOfClass:[UILabel class]]) {
			if (subview.tag == 5) {
				[subview setBackgroundColor:[UIColor whiteColor]];
			}
			else {
				[subview setBackgroundColor:[UIColor clearColor]];
				CGFloat red = 37.0/255.0 ;
				CGFloat green = 79.0/255.0 ;
				CGFloat blue = 160.0/255.0;
				[subview setTextColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
			}
			subview.textAlignment = NSTextAlignmentRight ;
		}
	}
	
	
	scrollView.contentSize = CGSizeMake(contentframe.size.width, contentframe.size.height);
	[scrollView addSubview:contentview];
	
	
	/*NSString *reasonstring = [NSString stringWithFormat:@"Reasons : \n %@" , disease.Reasons ];
	NSString *complicationstring = [NSString stringWithFormat:@"Complications : \n %@",disease.Complications];
	NSString *treatmentstring = [NSString stringWithFormat:@"Treatment : \n %@" ,disease.Treatement];
	
	//[Reasonstext setFrame:CGRectMake(5, 10, 315 , 100)];
	Reasonstext = [[UITextView alloc]initWithFrame:CGRectMake(5, 10, 315 , 100)];
	[Reasonstext setText:reasonstring];
	Complicationstext = [[UITextView alloc]initWithFrame:CGRectMake(5, Reasonstext.frame.origin.y + Reasonstext.frame.size.height, 315, 100)];
	[Complicationstext setText:complicationstring];
	Treatmenttext = [[UITextView alloc]initWithFrame:CGRectMake(5, Complicationstext.frame.origin.y + Complicationstext.frame.size.height, 315, 100)];
	[Treatmenttext setText:treatmentstring];
	
	
	
	
	[scrollView addSubview:Reasonstext];
	[scrollView addSubview:Complicationstext];
	[scrollView addSubview:Treatmenttext];*/
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
