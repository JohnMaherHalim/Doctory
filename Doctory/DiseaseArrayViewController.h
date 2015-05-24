//
//  DiseaseArrayViewController.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Disease.h"

@interface DiseaseArrayViewController : UIViewController <UITableViewDelegate , UITableViewDataSource,UIAlertViewDelegate>

@property (nonatomic , retain) NSMutableArray *diseases ;
@property (nonatomic , retain) IBOutlet UITableView *tableView ;
@property BOOL fromsymptoms ;
@property (nonatomic , retain) NSString *mylang ;
@property (nonatomic , retain) Disease *domdis ;

@end
