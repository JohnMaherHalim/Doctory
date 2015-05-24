//
//  SearchforDiseaseViewController.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchforDiseaseViewController : UIViewController <UITableViewDataSource , UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic , retain) IBOutlet UITableView *tableView ;
@property (nonatomic ,retain) IBOutlet UISearchBar *searchy ; 
@property (nonatomic , retain) NSMutableArray *diseaseletters ;
@property int Sexualhealth ;
@property (nonatomic , retain) NSString *lang ; 

@property BOOL searchformedicine ; 

@end
