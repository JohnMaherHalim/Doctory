//
//  MedicineDetailsViewController.h
//  Doctory
//
//  Created by John Maher on 5/2/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Medicine.h"

@interface MedicineDetailsViewController : UIViewController

@property (nonatomic , retain) IBOutlet UIScrollView *scrollView  ;
@property (nonatomic , retain) Medicine *mymedicine ; 

@end
