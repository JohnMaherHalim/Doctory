//
//  QuestionsOptionsViewController.h
//  Doctory
//
//  Created by John Maher on 5/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsOptionsViewController : UIViewController

@property (nonatomic , retain) IBOutlet UIButton *logout ;
@property (nonatomic , retain) IBOutlet UIButton *myquestions ;
@property (nonatomic , retain) IBOutlet UIButton *answerorask ; 

-(IBAction)checkallquestions:(id)sender;
-(IBAction)AskAQuestion:(id)sender;
-(IBAction)checkmyquestions:(id)sender;
-(IBAction)Logout:(id)sender;

@end
