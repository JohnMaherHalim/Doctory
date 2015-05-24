//
//  DoctorDataViewController.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DoctorDataViewController.h"
#import "Speciality.h"
#import "UserEngine.h"

@interface DoctorDataViewController ()

@end

@implementation DoctorDataViewController

@synthesize Specialities , AvailableSpecialities , Username , Password , Firstname , LastName , Work , Email , specialityid , choosebtn ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor clearColor]];
	CGRect pickerframe = AvailableSpecialities.frame ;
	pickerframe.size.height = 20 ;
	[AvailableSpecialities setFrame:pickerframe];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [Specialities count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
   /* NSString * title = nil;
    switch(row) {
		case 0:
			title = @"a";
			break;
		case 1:
			title = @"b";
			break;
		case 2:
			title = @"c";
			break;
    }*/
	
	Speciality *spec = [Specialities objectAtIndex:row] ;
	
    return spec.NameAr;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Iterate through your subviews, or some other custom array of views
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
}

-(IBAction)SignUp:(id)sender {
	NSMutableDictionary *user = [[NSMutableDictionary alloc]init] ;
	[user setObject:Username.text forKey:@"Username"];
	[user setObject:Password.text forKey:@"Password"];
	[user setObject:Firstname.text forKey:@"FirstName"];
	[user setObject:LastName.text forKey:@"LastName"];
	[user setObject:Email.text forKey:@"Email"];
	[user setObject:@"2" forKey:@"UserTypeId"];
	[user setObject:Work.text forKey:@"Work"];
	/*if (Sex.selectedSegmentIndex == 0)
		[user setObject:@"m" forKey:@"Sex"];
	else
		[user setObject:@"f" forKey:@"Sex"] ;*/
	int row = [AvailableSpecialities selectedRowInComponent:0];
	Speciality *spec = [Specialities objectAtIndex:row];
	NSString *specidstr = [NSString stringWithFormat:@"%d",specialityid];
	[user setObject:specidstr forKey:@"SpecialityId"];
	
	NSMutableDictionary *container = [[NSMutableDictionary alloc]init];
	[container setObject:user forKey:@"user"];
	
	UserEngine *userengine = [[UserEngine alloc]init] ;
	[userengine requestcreateuse:container onSuccess:^(NSMutableArray *QuestionsArray) {
		NSLog(@"Success Creation");
	} onError:^(NSError *error) {
		NSLog(@"Creation Failed") ;
	}];
	
}

-(IBAction)ShowSpecialities:(id)sender {
	UIActionSheet * as=[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel",@"Cancel") destructiveButtonTitle:nil otherButtonTitles:nil];
	
	for (Speciality *spec in Specialities) {
		[as addButtonWithTitle:spec.NameAr];
	}
	
	[as showInView:self.view] ; 
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex != 0) {
	Speciality *spec = [Specialities objectAtIndex:buttonIndex-1] ;
	specialityid = spec.SpecialityId ;
	[choosebtn setTitle:spec.NameAr forState:UIControlStateNormal];
	}
}


@end
