//
//  FirstAidViewController.h
//  Doctory
//
//  Created by John Maher on 3/7/15.
//  Copyright (c) 2015 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstAidViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>

@property (retain) NSMutableArray *FirstAids ;
@property (retain) IBOutlet UITableView *tableView ; 

@end
