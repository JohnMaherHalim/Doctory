//
//  SpecialitiesViewController.h
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialitiesViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , retain) IBOutlet UITableView *tableView ;
@property (nonatomic , retain) NSMutableArray *Specialities ;
@property BOOL askorshow ; 

@end
