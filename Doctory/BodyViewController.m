//
//  BodyViewController.m
//  Doctory
//
//  Created by John Maher on 5/8/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "BodyViewController.h"
#import "SymptomsEngine.h"
#import "SymptomsperOrgan.h"
#import "MBProgressHUD.h"

@interface BodyViewController ()

@end

@implementation BodyViewController

@synthesize isFront , choosetool , bodytoshow ;

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
	[choosetool setSelectedSegmentIndex:0];
	
	UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"اختر من الجسم" image:nil tag:0];
	self.tabBarItem = theItem;
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)switchviews:(id)sender {
	if (choosetool.selectedSegmentIndex == 0)
		[bodytoshow setImage:[UIImage imageNamed:@"body_front.png"]];
	else
		[bodytoshow setImage:[UIImage imageNamed:@"body_back.png"]];
	
	
}

-(IBAction)headpart:(id)sender {
	[self getsymptomsbyorgan:1] ;

}

-(IBAction)handpart:(id)sender {
	[self getsymptomsbyorgan:2];
}

-(IBAction)foodpart:(id)sender {
	[self getsymptomsbyorgan:3];
}

-(IBAction)chestorback:(id)sender {
	if (choosetool.selectedSegmentIndex == 0) {
		[self getsymptomsbyorgan:4];
	} else {
		[self getsymptomsbyorgan:7];
		
	}
	
	
}

-(IBAction)batnorback:(id)sender {
	if (choosetool.selectedSegmentIndex == 0) {
		[self getsymptomsbyorgan:5];
	} else {
		[self getsymptomsbyorgan:7];
	}
}

-(IBAction)hoodorbaack:(id)sender {
	if (choosetool.selectedSegmentIndex == 0) {
		[self getsymptomsbyorgan:6];
	} else {
		[self getsymptomsbyorgan:8];
	}
}


-(void) getsymptomsbyorgan:(int)organid {
	SymptomsEngine *symengine = [[SymptomsEngine alloc]init];
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[symengine requestSymptomsByOrganID:organid onSuccess:^(NSMutableArray *SymptomsArray) {
		NSLog(@"succes") ;
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		SymptomsperOrgan *symperorg = [[SymptomsperOrgan alloc]init];
		[symperorg setSymptoms:SymptomsArray] ;
		[self.navigationController pushViewController:symperorg animated:YES];
		
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		NSLog(@"failure");
	}];
	
}

@end
