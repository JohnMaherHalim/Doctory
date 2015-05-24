//
//  DiseaseDoubtViewController.m
//  Doctory
//
//  Created by John Maher on 4/8/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DiseaseDoubtViewController.h"
#import "DiseaseDetailsViewController.h"

@interface DiseaseDoubtViewController ()

@end

@implementation DiseaseDoubtViewController

@synthesize dis , desc ; 

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
	[desc setText:dis.prediagnosis];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)gotodetails:(id)sender {
	DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
	[diseasedetails setDisease:dis];
	[self.navigationController pushViewController:diseasedetails animated:YES];
}

@end
