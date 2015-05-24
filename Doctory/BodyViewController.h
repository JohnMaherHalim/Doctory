//
//  BodyViewController.h
//  Doctory
//
//  Created by John Maher on 5/8/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyViewController : UIViewController

@property (nonatomic , retain) IBOutlet UISegmentedControl *choosetool ;
@property BOOL isFront ;
@property (nonatomic , retain) IBOutlet UIImageView* bodytoshow ; 

-(IBAction)switchviews:(id)sender;

-(IBAction)headpart:(id)sender;
-(IBAction)handpart:(id)sender;
-(IBAction)foodpart:(id)sender;
-(IBAction)chestorback:(id)sender;
-(IBAction)batnorback:(id)sender;
-(IBAction)hoodorbaack:(id)sender;

@end
