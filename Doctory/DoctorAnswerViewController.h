//
//  DoctorAnswerViewController.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface DoctorAnswerViewController : UIViewController

@property (nonatomic , retain) Question *myquestion ;
@property (nonatomic , retain) IBOutlet UILabel *questiontext ;
@property (nonatomic , retain) IBOutlet UITextView *Answertext ;

-(IBAction)Answerthequestion:(id)sender; 

@end
