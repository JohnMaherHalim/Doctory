//
//  DiseaseDetailsViewController.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Disease.h"

@interface DiseaseDetailsViewController : UIViewController

@property (nonatomic , retain) IBOutlet UIScrollView *scrollView ;

@property (nonatomic , retain) UIView *contentView ;

@property (nonatomic , retain) UITextView *Reasonstext ;
@property (nonatomic , retain) UITextView *Complicationstext ;
@property (nonatomic , retain) UITextView *Treatmenttext ; 

@property (nonatomic , retain) Disease *disease ; 

@end
