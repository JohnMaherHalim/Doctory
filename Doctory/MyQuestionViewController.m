//
//  MyQuestionViewController.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MyQuestionViewController.h"
#import "Question.h"
#import "QuestionsEngine.h"

@interface MyQuestionViewController ()

@end

@implementation MyQuestionViewController

@synthesize myspec , specID , specname , MaleFemale , Age , QuestionText ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"سؤالك" ;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[myspec setText:specname]; 
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Iterate through your subviews, or some other custom array of views
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
}

-(IBAction)Submit:(id)sender {
	NSMutableDictionary *question =  [[NSMutableDictionary alloc]init] ;
	
	NSLog(@"Question text : %@ and Age : %@" , QuestionText.text ,Age.text);
	
	[question setObject:QuestionText.text  forKey:@"QuestionText"];
	[question setObject:Age.text forKey:@"Age" ];
	if (MaleFemale.selectedSegmentIndex == 0)
		[question setObject:@"m" forKey:@"Sex"];
	else
		[question setObject:@"f" forKey:@"Sex"] ;
	NSString *SpecIDStr = [NSString stringWithFormat:@"%d",specID];
	[question setObject:@"2" forKey:@"SpecialityId"];
	
	NSMutableDictionary *Containingquestion = [[NSMutableDictionary alloc]init] ;
	[Containingquestion setObject:question forKey:@"question" ];
	
	QuestionsEngine *quesEngine = [[QuestionsEngine alloc]init] ;
	[quesEngine AskQuestion:Containingquestion onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"Success") ;
	} onError:^(NSError *error) {
		NSLog(@"failed");
	}];
	
}

@end
