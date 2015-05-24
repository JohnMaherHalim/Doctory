//
//  SpecialitiesCont.m
//  Doctory
//
//  Created by John Maher on 2/25/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SpecialitiesCont.h"
#import "Specialitiesengine.h"

@interface SpecialitiesCont ()

@end

@implementation SpecialitiesCont

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
	
	
	/*[userEngine requestSignUpUser:email.text userPassword:password.text onSuccess:^(int userId) {
		NSLog(@"Success and user id = %d",userId);
		[hud hide:YES];
		User* user = [[User alloc] init];
		user.User_id = userId;
		[[UserPresenceManager getSingleton_instance]updateLoggedUser:user];
		NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
		if (standardUserDefaults) {
			[standardUserDefaults setInteger:userId forKey:@"MyUser"];
			[standardUserDefaults synchronize];
			//  [standardUserDefaults setObject:order_hash forKey:@"LastOrderHash"];
			//  [standardUserDefaults setInteger:orderID forKey:@"LastOrderID"];
			//  [standardUserDefaults setInteger:newLoyaltyPoints forKey:@"UpdatedLP"];
			//  [self.navigationController popToRootViewControllerAnimated:YES];
		}
		[user release];
		[self signUpUser_success];
		//ProfileViewController* profileVC = [[ProfileViewController alloc]init];
		//[self.navigationController pushViewController:profileVC animated:YES];
		//[profileVC release];
	} onError:^(NSError *error) {
		NSLog(@"Error = %@",error);
		[hud hide:YES];
		
		[self signUpUser_error:error];
	}];*/
	
	
	Specialitiesengine *specengine = [[Specialitiesengine alloc]init];
	[specengine requestSpecialities:^(NSMutableArray *myspec) {
		NSLog(@"Success");
	}
	 error:^(NSError *error) {
		 NSLog(@"ana batny hebar");
	 }];
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
