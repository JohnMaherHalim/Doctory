//
//  MainMenuViewController.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , retain) IBOutlet UITableView *tableView ;

@property (nonatomic , retain) NSMutableArray *mainitems ; 


-(IBAction)myencyclopedia:(id)sender;
-(IBAction)checker:(id)sender;
-(IBAction)mymedicines:(id)sender;
-(IBAction)mysexualhealth:(id)sender;
-(IBAction)AllQuestions:(id)sender;
-(IBAction)Ask:(id)sender ;
-(IBAction)GoToAids:(id)sender;

-(IBAction)ShareOnFb:(id)sender;

@end
