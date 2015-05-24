//
//  FADetailsViewController.h
//  Doctory
//
//  Created by John Maher on 3/8/15.
//  Copyright (c) 2015 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstAid.h"

@interface FADetailsViewController : UIViewController

@property (retain) FirstAid *myFA ;
@property (retain) IBOutlet UITextView *FAdesc ; 

@end
