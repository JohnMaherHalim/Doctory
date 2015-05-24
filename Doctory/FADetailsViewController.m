//
//  FADetailsViewController.m
//  Doctory
//
//  Created by John Maher on 3/8/15.
//  Copyright (c) 2015 John Maher. All rights reserved.
//

#import "FADetailsViewController.h"

@interface FADetailsViewController ()

@end

@implementation FADetailsViewController

@synthesize FAdesc , myFA ;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	self.title = myFA.FirstAid_Name ;
	[FAdesc setText:myFA.FirstAid_detail];
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated {
	//[FAdesc setContentOffset:CGPointZero animated:YES];
	[FAdesc scrollRangeToVisible:NSMakeRange(0, 0)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
