//
//  SignedUserQuestionViewController.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface SignedUserQuestionViewController : UIViewController

@property (nonatomic , retain) User *myuser ;
@property (nonatomic , retain) IBOutlet UILabel *HelloText ;
@property (nonatomic , retain) IBOutlet UITextView *YourQuestion ;
@property int specID ;


-(IBAction)UserAsk:(id)sender;

@end
