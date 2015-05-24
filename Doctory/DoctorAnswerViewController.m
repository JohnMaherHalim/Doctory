//
//  DoctorAnswerViewController.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DoctorAnswerViewController.h"
#import "QuestionsEngine.h"
#import "RunningUser.h"

@interface DoctorAnswerViewController ()

@end

@implementation DoctorAnswerViewController

@synthesize myquestion , questiontext , Answertext  ;

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
	
	questiontext.text = myquestion.QuestionText ; 
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Answerthequestion:(id)sender {
	
	User *user = [RunningUser getSingleton_instance].user ;
	
	NSMutableDictionary *ans = [[NSMutableDictionary alloc]init] ;
	NSString *questid = [NSString stringWithFormat:@"%d" , myquestion.QuestionId];
	[ans setObject:questid forKey:@"QuestionId"];
	[ans setObject:Answertext.text forKey:@"AnswerText"];
	NSString *userid = [NSString stringWithFormat:@"%d",user.UserId];
	[ans setObject:userid forKey:@"ActingDoctorId"];
	NSMutableDictionary *containans = [[NSMutableDictionary alloc]init] ;
	[containans setObject:ans forKey:@"question"] ;
	
	QuestionsEngine *questengine = [[QuestionsEngine alloc]init] ;
	
	[questengine AnswerQuestion:containans onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"Answered");
	} onError:^(NSError *error) {
		NSLog(@"Not answered yet") ; 
	}];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Iterate through your subviews, or some other custom array of views
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
}

@end
