//
//  DoctorDetailsViewController.h
//  Doctory
//
//  Created by John Maher on 7/16/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface DoctorDetailsViewController : UIViewController

@property (retain) User *Doctor ;
@property (retain) IBOutlet UIImageView *DocProfilePic ; 
@property (retain) IBOutlet UIView *contentView ;
@property (retain) IBOutlet UIScrollView *scrollview ;
@property (retain) IBOutlet UILabel *Doctorname ;
@property (retain) IBOutlet UILabel *DoctorDescription ;
@property (retain) IBOutlet UILabel *GeneralInfo ;
@property (retain) IBOutlet UILabel *SpecialityLabel ;
@property (retain) IBOutlet UILabel *SpecialityValue ;
@property (retain) IBOutlet UILabel *JobLabel ;
@property (retain) IBOutlet UILabel *JobValue ;
@property (retain) IBOutlet UILabel *UserNameLabel ;
@property (retain) IBOutlet UILabel *UserNameValue ;
@property (retain) IBOutlet UILabel *ContactUs ;
@property (retain) IBOutlet UILabel *EmailLabel ;
@property (retain) IBOutlet UILabel *EmailValue ;
@property (retain) IBOutlet UIView *SubView ; 

@end
