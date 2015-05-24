//
//  UserDataViewController.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDataViewController : UIViewController


@property (nonatomic , retain) IBOutlet UITextField *Username ;
@property (nonatomic , retain) IBOutlet UITextField *Password;
@property (nonatomic , retain) IBOutlet UITextField *Firstname ;
@property (nonatomic , retain) IBOutlet UITextField *LastName ;
@property (nonatomic , retain) IBOutlet UITextField *Email ;
@property (nonatomic , retain) IBOutlet UITextField *Age; 
@property (nonatomic , retain) IBOutlet UISegmentedControl *Sex ;

-(IBAction)SignUp:(id)sender;

@end
