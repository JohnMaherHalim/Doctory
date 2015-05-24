//
//  AllQuestionsViewController.h
//  Doctory
//
//  Created by John Maher on 3/12/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"


@interface AllQuestionsViewController : UIViewController <UITableViewDataSource , UITableViewDelegate> 

@property (nonatomic , retain) IBOutlet UITableView *tableView ;
@property (nonatomic , retain) NSMutableArray *Questions ;
@property BOOL enabled ;

-(void)CheckdetailsofDoctor:(User*)Doctor;
-(void)popback ; 

@end
