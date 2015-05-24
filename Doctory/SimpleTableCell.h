//
//  SimpleTableCell.h
//  Doctory
//
//  Created by John Maher on 3/13/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "SDWebImage/UIImageView+WebCache.h"



@interface SimpleTableCell : UITableViewCell <UIAlertViewDelegate>

@property (nonatomic , retain) IBOutlet UILabel *UserName ;
@property (nonatomic , retain) IBOutlet UILabel *UserQuestion ;
@property (nonatomic , retain) IBOutlet UILabel *DoctorName ;
@property (nonatomic , retain) IBOutlet UILabel *UserAge ;
@property (nonatomic , retain) IBOutlet UILabel *UserSex ; ;
@property (nonatomic , retain) IBOutlet UILabel *Numberoflikes ;

@property (nonatomic , retain) IBOutlet UILabel *DoctorAnswer ;
@property (nonatomic , retain) IBOutlet UIView *ContainingView ;
@property float height ;
@property (nonatomic , retain) IBOutlet UIButton *likebtn ;
@property (nonatomic , retain) IBOutlet UIButton *ReportBtn ; 

@property (nonatomic , retain) IBOutlet UILabel *likes ;
@property (nonatomic , retain) Question *myquestion ;
@property  int userID ;
@property (nonatomic , retain) id delegate ;

@property (nonatomic , retain) IBOutlet UIImageView *likeinfo ;
@property (nonatomic , retain) IBOutlet UIImageView *infoinfo ;
@property (nonatomic , retain) IBOutlet UIButton *CheckDoctorBtn ;

@property (nonatomic , retain) IBOutlet UIImageView *DocPic ;

-(IBAction)like:(id)sender;
-(IBAction)report:(id)sender;
-(IBAction)GoToDoctorPage:(id)sender;

@end
