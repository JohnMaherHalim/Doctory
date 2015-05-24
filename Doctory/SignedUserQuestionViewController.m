//
//  SignedUserQuestionViewController.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SignedUserQuestionViewController.h"
#import "QuestionsEngine.h"
#import "SpecialitiesViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SignedUserQuestionViewController ()

@end

@implementation SignedUserQuestionViewController

@synthesize myuser , HelloText , YourQuestion , specID ;

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
	
	self.navigationItem.hidesBackButton = YES;
	//set custom image to button if needed
	//UIImage *backButtonImage = [UIImage imageNamed:@"back"];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"عودة" forState:UIControlStateNormal];
	//[button setImage:backButtonImage forState:UIControlStateNormal];
	CGRect myframe = CGRectMake(0, 0, 100, 100);
	button.frame = CGRectMake(0, 0, myframe.size.width, myframe.size.height);
	[button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myframe.size.width, myframe.size.height)];
	backButtonView.userInteractionEnabled = YES ; 
	[backButtonView addSubview:button];
	
	//UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
	UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] init];
	[customBarItem setTitle:@"عودة"];
	[customBarItem setTarget:self];
	[customBarItem setAction:@selector(back)];
	self.navigationItem.leftBarButtonItem = customBarItem;
	
	NSString *str = [NSString stringWithFormat:@" %@ مرحباً" , myuser.UserName];
	[HelloText setTextAlignment:NSTextAlignmentRight]; 
	[HelloText setText:str] ;
	
	YourQuestion.layer.cornerRadius = 15 ;
	YourQuestion.clipsToBounds = YES ;
    // Do any additional setup after loading the view from its nib.
}

-(void)back {
	/*UIViewController *prevVC = [self.navigationController.viewControllers objectAtIndex:<n>];
	[self.navigationController popToViewController:prevVC animated:YES];*/
	
	for (UIViewController *view in self.navigationController.viewControllers)  {
		if ([view isKindOfClass:[SpecialitiesViewController class]])
			[self.navigationController popToViewController:view animated:YES];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)UserAsk:(id)sender {
	NSMutableDictionary *question =  [[NSMutableDictionary alloc]init] ;
	
	//NSLog(@"Question text : %@ and Age : %@" , QuestionText.text ,Age.text);
	
	[question setObject:YourQuestion.text  forKey:@"QuestionText"];
	
	NSString *agestr = [NSString stringWithFormat:@"%d" , myuser.Age];
	[question setObject:agestr forKey:@"Age"];
	[question setObject:myuser.Sex forKey:@"Sex"];
	
	NSString *userid = [NSString stringWithFormat:@"%d",myuser.UserId];
	[question setObject:userid forKey:@"UserId"];
	
	/*[question setObject:Age.text forKey:@"Age" ];
	 if (MaleFemale.selectedSegmentIndex == 0)
	 [question setObject:@"m" forKey:@"Sex"];
	 else
	 [question setObject:@"f" forKey:@"Sex"] ;*/
	
	
	NSString *SpecIDStr = [NSString stringWithFormat:@"%d",specID];
	[question setObject:SpecIDStr forKey:@"SpecialityId"];
	
	NSMutableDictionary *Containingquestion = [[NSMutableDictionary alloc]init] ;
	[Containingquestion setObject:question forKey:@"question" ];
	
	QuestionsEngine *quesEngine = [[QuestionsEngine alloc]init] ;
	[quesEngine AskQuestion:Containingquestion onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"Success") ;
		[self.navigationController popViewControllerAnimated:YES];
	/*	for (UIViewController *view in self.navigationController.viewControllers)  {
			
			
			NSLog(@"Success") ;
			if ([view isKindOfClass:[SpecialitiesViewController class]])
				[self.navigationController popToViewController:view animated:YES];
		}*/
	} onError:^(NSError *error) {
		NSLog(@"failed");
	}];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Iterate through your subviews, or some other custom array of views
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
}


@end
