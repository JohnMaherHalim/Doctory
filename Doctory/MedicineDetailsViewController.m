//
//  MedicineDetailsViewController.m
//  Doctory
//
//  Created by John Maher on 5/2/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MedicineDetailsViewController.h"

@interface MedicineDetailsViewController ()

@end

@implementation MedicineDetailsViewController

@synthesize mymedicine , scrollView ; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)accordingtolabeladjustlabel:(UILabel*)yourLabel {
	CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
	
	CGSize expectedLabelSize = [yourLabel.text sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];
	
	//adjust the label the the new height.
	CGRect newFrame = yourLabel.frame;
	newFrame.size.height = expectedLabelSize.height;
	yourLabel.frame = newFrame;
}

- (void)viewDidLoad
{
	
	
    [super viewDidLoad];
	
	float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (systemVersion >= 7.0) {
		self.navigationController.navigationBar.translucent = NO;
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	
	UIView *contentview = [[UIView alloc]initWithFrame:CGRectMake(0,20, self.view.frame.size.width, self.view.frame.size.height)];
	
	UILabel *ComplicationsTitle = [[UILabel alloc]initWithFrame:CGRectMake(10,10, self.view.frame.size.width - 20, 0)];
	[ComplicationsTitle setText:@"Introduction :"];
	[ComplicationsTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:ComplicationsTitle];
	[contentview addSubview:ComplicationsTitle];
	
	UILabel *ComplicationsValue = [[UILabel alloc]initWithFrame:CGRectMake(10,ComplicationsTitle.frame.origin.y + ComplicationsTitle.frame.size.height, self.view.frame.size.width - 20, 0)];
	[ComplicationsValue setText:mymedicine.Introduction];
	[ComplicationsValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:ComplicationsValue];
	[contentview addSubview:ComplicationsValue];
	
	UILabel *DiagnosesTitle = [[UILabel alloc]initWithFrame:CGRectMake(10,ComplicationsValue.frame.origin.y + ComplicationsValue.frame.size.height, self.view.frame.size.width - 20, 0)];
	[DiagnosesTitle setText:@"Description :"];
	[DiagnosesTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:DiagnosesTitle];
	[contentview addSubview:DiagnosesTitle];
	
	UILabel *DiagnosesValue = [[UILabel alloc]initWithFrame:CGRectMake(10,DiagnosesTitle.frame.origin.y + DiagnosesTitle.frame.size.height, self.view.frame.size.width - 20, 0)];
	[DiagnosesValue setText:mymedicine.Description];
	[DiagnosesValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:DiagnosesValue];
	[contentview addSubview:DiagnosesValue];
	
	UILabel *SymptomsTitle = [[UILabel alloc]initWithFrame:CGRectMake(10,DiagnosesValue.frame.origin.y + DiagnosesValue.frame.size.height, self.view.frame.size.width - 20, 0)];
	[SymptomsTitle setText:@"Precautions : "];
	[SymptomsTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:SymptomsTitle];
	[contentview addSubview:SymptomsTitle];
	
	UILabel *SymptomsValue = [[UILabel alloc]initWithFrame:CGRectMake(10,SymptomsTitle.frame.origin.y + SymptomsTitle.frame.size.height, self.view.frame.size.width - 20, 0)];
	[SymptomsValue setText:mymedicine.Precautions];
	[SymptomsValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:SymptomsValue];
	[contentview addSubview:SymptomsValue];
	
	UILabel *IntroductionTitle = [[UILabel alloc]initWithFrame:CGRectMake(10,SymptomsValue.frame.origin.y + SymptomsValue.frame.size.height, self.view.frame.size.width - 20, 0)];
	[IntroductionTitle setText:@"Side Effects :"];
	[IntroductionTitle setNumberOfLines:0];
	[self accordingtolabeladjustlabel:IntroductionTitle];
	[contentview addSubview:IntroductionTitle];
	
	UILabel *IntroductionValue = [[UILabel alloc]initWithFrame:CGRectMake(10,IntroductionTitle.frame.origin.y + IntroductionTitle.frame.size.height, self.view.frame.size.width - 20, 0)];
	[IntroductionValue setText:mymedicine.SideEffects];
	[IntroductionValue setNumberOfLines:0];
	[self accordingtolabeladjustlabel:IntroductionValue];
	[contentview addSubview:IntroductionValue];
	
	/*UILabel *ReasonsTitle = [[UILabel alloc]initWithFrame:CGRectMake(10,IntroductionValue.frame.origin.y + IntroductionValue.frame.size.height, self.view.frame.size.width - 20, 0)];
	 [ReasonsTitle setText:@"Reasons"];
	 [ReasonsTitle setNumberOfLines:0];
	 [self accordingtolabeladjustlabel:ReasonsTitle];
	 [contentview addSubview:ReasonsTitle];
	 
	 UILabel *ReasonsValue = [[UILabel alloc]initWithFrame:CGRectMake(10,ReasonsTitle.frame.origin.y + ReasonsTitle.frame.size.height, self.view.frame.size.width - 20, 0)];
	 [ReasonsValue setText:disease.Reasons];
	 [ReasonsValue setNumberOfLines:0];
	 [self accordingtolabeladjustlabel:ReasonsValue];
	 [contentview addSubview:ReasonsValue];
	 
	 
	 UILabel *TreatementTitle = [[UILabel alloc]initWithFrame:CGRectMake(10,ReasonsValue.frame.origin.y + ReasonsValue.frame.size.height, self.view.frame.size.width - 20, 0)];
	 [TreatementTitle setText:@"Treatement"];
	 [TreatementTitle setNumberOfLines:0];
	 [self accordingtolabeladjustlabel:TreatementTitle];
	 [contentview addSubview:TreatementTitle];
	 
	 UILabel *TreatementValue = [[UILabel alloc]initWithFrame:CGRectMake(10,TreatementTitle.frame.origin.y + TreatementTitle.frame.size.height, self.view.frame.size.width - 20, 0)];
	 [TreatementValue setText:disease.Treatement];
	 [TreatementValue setNumberOfLines:0];
	 [self accordingtolabeladjustlabel:TreatementValue];
	 [contentview addSubview:TreatementValue];*/
	
	CGRect contentframe = contentview.frame ;
	contentframe.size.height = ComplicationsTitle.frame.size.height + ComplicationsValue.frame.size.height + DiagnosesTitle.frame.size.height + DiagnosesValue.frame.size.height + SymptomsTitle.frame.size.height + SymptomsValue.frame.size.height + IntroductionTitle.frame.size.height + IntroductionValue.frame.size.height ;
	//+ ReasonsTitle.frame.size.height + ReasonsValue.frame.size.height + TreatementTitle.frame.size.height + TreatementValue.frame.size.height  ;
	contentview.frame = contentframe ;
	
	[contentview setBackgroundColor:[UIColor clearColor]];
	
	for (UILabel *subview in contentview.subviews) {
		if ([subview isKindOfClass:[UILabel class]]) {
			[subview setBackgroundColor:[UIColor clearColor]];
			subview.textAlignment = NSTextAlignmentRight ;
		}
	}
	
	
	scrollView.contentSize = CGSizeMake(contentframe.size.width, contentframe.size.height);
	[scrollView addSubview:contentview];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
