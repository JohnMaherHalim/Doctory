//
//  DiseaseDoubtViewController.h
//  Doctory
//
//  Created by John Maher on 4/8/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Disease.h"

@interface DiseaseDoubtViewController : UIViewController

@property (nonatomic , retain) IBOutlet UILabel *desc ;
@property (nonatomic , retain) Disease *dis ; 

-(IBAction)gotodetails:(id)sender;

@end
