//
//  LoginViewController.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic , retain) NSString *specname ;
@property int specID ;
@property (nonatomic , retain) NSMutableArray *Specialities ; 

@property (nonatomic , retain) IBOutlet UITextField *username ;
@property (nonatomic , retain) IBOutlet UITextField *password ;

-(IBAction)AskAsAnonymous:(id)sender;
-(IBAction)Login:(id)sender;
-(IBAction)CreateAccount:(id)sender;

@end
