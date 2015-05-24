//
//  SymptomsperOrgan.h
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SymptomsperOrgan : UIViewController <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , retain) IBOutlet UITableView *tableView ;
@property (nonatomic , retain) NSMutableArray *Symptoms ;

@property (nonatomic , retain) NSMutableArray *mySymptoms ;

-(IBAction)requestdiseases:(id)sender;

@end
