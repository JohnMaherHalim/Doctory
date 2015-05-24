//
//  UserDataViewController.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "UserDataViewController.h"
#import "UserEngine.h"

@interface UserDataViewController ()

@end

@implementation UserDataViewController

@synthesize Username , Password , Firstname , LastName , Sex , Age , Email;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SignUp:(id)sender {
	NSMutableDictionary *user = [[NSMutableDictionary alloc]init] ;
	[user setObject:Username.text forKey:@"Username"];
	[user setObject:Password.text forKey:@"Password"];
	[user setObject:Firstname.text forKey:@"FirstName"];
	[user setObject:LastName.text forKey:@"LastName"];
	[user setObject:Email.text forKey:@"Email"];
	[user setObject:@"1" forKey:@"UserTypeId"];
	[user setObject:Age.text forKey:@"Age"];
	if (Sex.selectedSegmentIndex == 0)
		[user setObject:@"m" forKey:@"Sex"];
	else
		[user setObject:@"f" forKey:@"Sex"] ;
	
	
	NSMutableDictionary *container = [[NSMutableDictionary alloc]init];
	[container setObject:user forKey:@"user"];
	
	UserEngine *userengine = [[UserEngine alloc]init] ;
	[userengine requestcreateuse:container onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"Success Creation");
	} onError:^(NSError *error) {
		NSLog(@"Creation Failed") ; 
	}];
	
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Iterate through your subviews, or some other custom array of views
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
}

@end
