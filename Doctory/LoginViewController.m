//
//  LoginViewController.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "LoginViewController.h"
#import "MyQuestionViewController.h"
#import "UserEngine.h"
#import "MBProgressHUD.h"
#import "UserDataViewController.h"
#import "DoctorDataViewController.h"
#import "SignedUserQuestionViewController.h"
#import "RunningUser.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize specID , specname , Specialities ;
@synthesize username , password ; 

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
	//[username setBackgroundColor:[UIColor clearColor]];
	//[password setBackgroundColor:[UIColor clearColor]];
	float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (systemVersion >= 7.0) {
		self.navigationController.navigationBar.translucent = NO;
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	[self.view setBackgroundColor:[UIColor clearColor]] ; 
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)AskAsAnonymous:(id)sender {
	MyQuestionViewController *myquest = [[MyQuestionViewController alloc]init];
	[myquest setSpecID:specID];
	[myquest setSpecname:specname];
	[self.navigationController pushViewController:myquest animated:YES];
}

-(IBAction)Login:(id)sender {
	UserEngine *userengine = [[UserEngine alloc]init] ;
	
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	
	[userengine requestLoginUser:username.text Withletter:password.text onSuccess:^(NSMutableArray *DiseasesArray) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		SignedUserQuestionViewController *signeduser = [[SignedUserQuestionViewController alloc]init];
		[self loaduser];
		User *user = [RunningUser getSingleton_instance].user ;
		[signeduser setMyuser:user];
		[signeduser setSpecID:specID];
		if (user.UserType!=2 && user != nil)
			[self.navigationController pushViewController:signeduser animated:YES];
		else if (user != nil)
			[self.navigationController popToRootViewControllerAnimated:YES];
		NSLog(@"Login success") ;
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES]; 
		NSLog(@"Login Failed") ;
	}];
	
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Iterate through your subviews, or some other custom array of views
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
}

-(IBAction)CreateAccount:(id)sender {
	/*UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:nil message:@"Sign Up as ... ?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"User" , @"Doctor", nil];
	[alertview show]; */
	
	UserDataViewController *createuser = [[UserDataViewController alloc]init] ;
	[self.navigationController pushViewController:createuser animated:YES ];
	
}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0 ){
		UserDataViewController *createuser = [[UserDataViewController alloc]init] ;
		[self.navigationController pushViewController:createuser animated:YES ];
		//cancel clicked ...do your action
    }else{
		DoctorDataViewController *createdoctor = [[DoctorDataViewController alloc]init] ;
		[createdoctor setSpecialities:Specialities]; 
		[self.navigationController pushViewController:createdoctor animated:YES] ;
		//reset clicked
    }
}

-(void)loaduser {
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"MyUser"];
	User *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	[RunningUser getSingleton_instance].user = object ;
	
}

@end
