//
//  AppDelegate.m
//  Doctory
//
//  Created by John Maher on 2/25/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "AppDelegate.h"
#import "SpecialitiesCont.h"
#import "User.h"
#import "RunningUser.h"
#import "MainMenuViewController.h"
#import "UserEngine.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
	[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
	
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
	 (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
	
	
	
	//[[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setBackgroundColor:[UIColor whiteColor]];
	[[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0, -18.0)];
	/* [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:@"searchbar.png"]forState:UIControlStateNormal];*/
	[[UISearchBar appearance]setSearchBarStyle:UISearchBarIconClear];
	
	//SpecialitiesCont *myspeccont = [[SpecialitiesCont alloc]init];
	[self loaduser] ;
	MainMenuViewController *main = [[MainMenuViewController alloc]init];
	UINavigationController *mainnav = [[UINavigationController alloc]initWithRootViewController:main];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self.window setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_5.png"]]];
	[self.window setRootViewController:mainnav];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)loaduser {
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"MyUser"];
	User *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	[RunningUser getSingleton_instance].user = object ;
	
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	
	NSString* newStr = [NSString stringWithUTF8String:[deviceToken bytes]];
	
	NSString *devicetokenstr = [NSString stringWithFormat:@"%@",deviceToken];
	NSString *devicetokenstrnospace = [devicetokenstr stringByReplacingOccurrencesOfString:@" " withString:@""];
	NSString *devicetokenstrnoleft = [devicetokenstrnospace stringByReplacingOccurrencesOfString:@"<" withString:@""];
	NSString *finaldevicetokenstr = [devicetokenstrnoleft stringByReplacingOccurrencesOfString:@">" withString:@""];
	
	NSLog(devicetokenstr);
	NSLog(finaldevicetokenstr);
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	//[defaults setInteger:user.UserId forKey:@"RegisterDeviceUserID"];
	//[defaults setBool:false forKey:@"RegisterDeviceState"];
	int user = [defaults integerForKey:@"RegisterDeviceUserID"];
	BOOL state = [defaults boolForKey:@"RegisterDeviceState"];
	
	NSMutableDictionary *registerpush = [[NSMutableDictionary alloc]init] ;
	NSString *userstr = [NSString stringWithFormat:@"%d",user];
	NSString *statestr = [[NSString alloc]init] ;
	if (state == true)
		statestr = @"true" ;
	else
		statestr = @"false" ;
	[registerpush setObject:statestr forKey:@"IsRegistering"];
	[registerpush setObject:userstr forKey:@"UserId"];
	[registerpush setObject:finaldevicetokenstr forKey:@"RegistrationId"];
	[registerpush setObject:@"iphone" forKey:@"DeviceType"];
	
	NSMutableDictionary *registerfinalpush = [[NSMutableDictionary alloc]init] ;
	[registerfinalpush setObject:registerpush forKey:@"regData"];
	
	UserEngine *usereng = [[UserEngine alloc]init] ;
	[usereng registerDevice:registerfinalpush onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"registrationdevice success") ;
	} onError:^(NSError *error) {
		NSLog(@"registrationdevice failure") ;
	}];
	
	
	NSLog(@"My token is: %@", deviceToken);
	NSLog(@"My token string is : %@",newStr);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
			openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
		 annotation:(id)annotation {
	
	BOOL urlWasHandled = [FBAppCall handleOpenURL:url
								sourceApplication:sourceApplication
								  fallbackHandler:^(FBAppCall *call) {
									  NSLog(@"Unhandled deep link: %@", url);
									  // Here goes the code to handle the links
									  // Use the links to show a relevant view of your app to the user
								  }];
	
	return urlWasHandled;
}

@end
