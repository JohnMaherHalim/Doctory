//
//  MyQuestionViewController.h
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyQuestionViewController : UIViewController

@property (nonatomic , retain) IBOutlet UILabel *myspec ;
@property (nonatomic , retain) NSString *specname ;
@property int specID ;

@property (nonatomic , retain) IBOutlet UISegmentedControl *MaleFemale ;
@property (nonatomic , retain) IBOutlet UITextField *Age ;
@property (nonatomic , retain) IBOutlet UITextView *QuestionText ;


-(IBAction)Submit:(id)sender;

@end
