//
//  DoctorDataViewController.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDataViewController : UIViewController <UIPickerViewDataSource , UIPickerViewDelegate,UIActionSheetDelegate>

@property (nonatomic , retain) IBOutlet UITextField *Username ;
@property (nonatomic , retain) IBOutlet UITextField *Password;
@property (nonatomic , retain) IBOutlet UITextField *Firstname ;
@property (nonatomic , retain) IBOutlet UITextField *LastName ;
@property (nonatomic , retain) IBOutlet UITextField *Email ;
@property (nonatomic , retain) IBOutlet UITextField *Work;
@property (nonatomic , retain) IBOutlet UIPickerView *AvailableSpecialities ;
@property (nonatomic , retain) IBOutlet UIButton *choosebtn ; 


@property int specialityid ; 
@property (nonatomic , retain) NSMutableArray *Specialities ;



-(IBAction)SignUp:(id)sender;
-(IBAction)ShowSpecialities:(id)sender;


@end
