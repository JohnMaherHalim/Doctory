//
//  SearchforDiseaseViewController.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SearchforDiseaseViewController.h"
#import "DiseaseEngine.h"
#import "DiseaseArrayViewController.h"
#import "MBProgressHUD.h"
#import "MedicineEngine.h"
#import "MedicinesViewController.h"
#import "DiseaseEngine.h"

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

@interface SearchforDiseaseViewController ()

@end

@implementation SearchforDiseaseViewController

@synthesize diseaseletters , Sexualhealth , searchformedicine , lang , searchy , tableView ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"A-Z" ;
		float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
		if (systemVersion >= 7.0) {
			self.navigationController.navigationBar.translucent = NO;
			self.edgesForExtendedLayout = UIRectEdgeNone;
		}
		diseaseletters = [[NSMutableArray alloc]init];
		
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	/*if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)])
		[self setAutomaticallyAdjustsScrollViewInsets:NO];*/
	//[self setEdgesForExtendedLayout:<#(UIRectEdge)#>]
	
	//self.automaticallyAdjustsScrollViewInsets = NO ;
	float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (systemVersion >= 7.0) {
		self.navigationController.navigationBar.translucent = NO;
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	/*CGRect tableframe = tableView.frame ;
	tableframe.origin.y = searchy.frame.origin.y  ;
	tableView.frame = tableframe ;*/
	
	searchy.delegate = self; 
	NSString *aroreng = [[NSString alloc]init] ;
	if ([lang isEqualToString:@"ar"])
		aroreng = @"ا-ي" ;
	else
		aroreng = @"A-Z";
	
	UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:aroreng image:nil tag:0];
	self.tabBarItem = theItem;
	
	[tableView setBackgroundColor:[UIColor clearColor]];
	
	
	if ([lang isEqualToString:@"ar"]) {
	[diseaseletters addObject:@"ا"];
	[diseaseletters addObject:@"ب"];
	[diseaseletters addObject:@"ت"];
		[diseaseletters addObject:@"ث"];
		[diseaseletters addObject:@"ج"];
		[diseaseletters addObject:@"ح"];
		[diseaseletters addObject:@"خ"];
		[diseaseletters addObject:@"د"];
		[diseaseletters addObject:@"ذ"];
		[diseaseletters addObject:@"ر"];
		[diseaseletters addObject:@"ز"];
		[diseaseletters addObject:@"س"];
		[diseaseletters addObject:@"ش"];
		[diseaseletters addObject:@"ص"];
		[diseaseletters addObject:@"ض"];
		[diseaseletters addObject:@"ط"];
		[diseaseletters addObject:@"ظ"];
		[diseaseletters addObject:@"ع"];
		[diseaseletters addObject:@"غ"];
		[diseaseletters addObject:@"ف"];
		[diseaseletters addObject:@"ق"];
		[diseaseletters addObject:@"ك"];
		[diseaseletters addObject:@"ل"];
		[diseaseletters addObject:@"م"];
		[diseaseletters addObject:@"ن"];
		[diseaseletters addObject:@"ه"];
		[diseaseletters addObject:@"و"];
		[diseaseletters addObject:@"ي"];
	} else {
		//abcdefghijklmnopqrstuvwxyz
		[diseaseletters addObject:@"A"];
		[diseaseletters addObject:@"B"];
		[diseaseletters addObject:@"C"];
		[diseaseletters addObject:@"D"];
		[diseaseletters addObject:@"E"];
		[diseaseletters addObject:@"F"];
		[diseaseletters addObject:@"G"];
		[diseaseletters addObject:@"H"];
		[diseaseletters addObject:@"I"];
		[diseaseletters addObject:@"J"];
		[diseaseletters addObject:@"K"];
		[diseaseletters addObject:@"L"];
		[diseaseletters addObject:@"M"];
		[diseaseletters addObject:@"N"];
		[diseaseletters addObject:@"O"];
		[diseaseletters addObject:@"P"];
		[diseaseletters addObject:@"Q"];
		[diseaseletters addObject:@"R"];
		[diseaseletters addObject:@"S"];
		[diseaseletters addObject:@"T"];
		[diseaseletters addObject:@"U"];
		[diseaseletters addObject:@"V"];
		[diseaseletters addObject:@"W"];
		[diseaseletters addObject:@"X"];
		[diseaseletters addObject:@"Y"];
		[diseaseletters addObject:@"Z"];
	}
	
	
	
	
	
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
	NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                       target:self
                                                     selector:@selector(dropBrick)
                                                     userInfo:nil
													  repeats:NO];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [diseaseletters count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
	NSString *identif = [NSString stringWithFormat:@"%d-%d",indexPath.section , indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:identif];
	
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identif];
    }
	
	//cell.textLabel.text = [diseaseletters objectAtIndex:indexPath.row];
	
	UILabel *letter = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, cell.frame.size.width - 30, cell.frame.size.height)];
	[cell addSubview:letter];
	[letter setText:[diseaseletters objectAtIndex:indexPath.row]];
	[letter setBackgroundColor:[UIColor clearColor]];
	if ([lang isEqualToString:@"ar"])
		[letter setTextAlignment:NSTextAlignmentRight];
	else
		[letter setTextAlignment:NSTextAlignmentLeft];
	
	
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	[cell setBackgroundColor:[UIColor clearColor]];
	
	return cell ;
	
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (searchformedicine == NO) {
	NSString *letter = [diseaseletters objectAtIndex:indexPath.row];
	DiseaseEngine *diseng = [[DiseaseEngine alloc]init];
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[diseng requestDiseases:Sexualhealth Withletter:letter onSuccess:^(NSMutableArray *DiseasesArray) {
		NSLog(@"success");
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		DiseaseArrayViewController *disarr = [[DiseaseArrayViewController alloc]init];
		[disarr setMylang:lang];
		[disarr setDiseases:DiseasesArray];
		[self.navigationController pushViewController:disarr animated:YES];
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		NSLog(@"error") ;
	}];
	} else {
		NSString *letter = [diseaseletters objectAtIndex:indexPath.row];
		MedicineEngine *diseng = [[MedicineEngine alloc]init];
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[diseng requestMedicines:letter onSuccess:^(NSMutableArray *DiseasesArray) {
			NSLog(@"success");
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			MedicinesViewController *disarr = [[MedicinesViewController alloc]init];
			[disarr setMedicines:DiseasesArray];
			[self.navigationController pushViewController:disarr animated:YES];
		} onError:^(NSError *error) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			NSLog(@"error") ;
		}];
	}
	
	NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                       target:self
                                                     selector:@selector(dropBrick)
                                                     userInfo:nil
													  repeats:NO];
	
	
}

- (CGFloat)heightForTableView
{
	/*if (!IS_IPHONE5) {
		if ([lang isEqualToString:@"ar"] )
    		return [diseaseletters count] * 44 - 3 * 44 ;
		else
			return [diseaseletters count] * 44 - 4 * 44 ;
	} else {
		if ([lang isEqualToString:@"ar"] )
    		return [diseaseletters count] * 44 - 1 * 44 ;
		else
			return [diseaseletters count] * 44 - 2 * 44 ;
	}*/
	
	
	if (!IS_IPHONE5) {
		if ([lang isEqualToString:@"ar"] )
    		return 7 * 44 ;
		else
			return  7 * 44 ;
	} else {
		if ([lang isEqualToString:@"ar"] )
    		return 9 * 44 ;
		else
			return 9 * 44 ;
	}
	
}
-(void)dropBrick {
	CGRect tableViewFrame = self.tableView.frame;
    tableViewFrame.size.height = [self heightForTableView];
	/*if (![lang isEqualToString:@"ar"] )
		tableViewFrame.origin.y = 100 ;*/
    self.tableView.frame = tableViewFrame;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	if (!searchformedicine) {
	
	DiseaseEngine *diseng = [[DiseaseEngine alloc]init] ;
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[diseng SearchForDiseaseWithletter:searchy.text onSuccess:^(NSMutableArray *DiseasesArray) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		DiseaseArrayViewController *disarr = [[DiseaseArrayViewController alloc]init];
		[disarr setMylang:lang];
		[disarr setDiseases:DiseasesArray];
		[self.navigationController pushViewController:disarr animated:YES];
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
	}];
	} else {
		MedicineEngine *diseng = [[MedicineEngine alloc]init];
		[MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[diseng requestMedicines:searchy.text onSuccess:^(NSMutableArray *DiseasesArray) {
			NSLog(@"success");
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			MedicinesViewController *disarr = [[MedicinesViewController alloc]init];
			[disarr setMedicines:DiseasesArray];
			[self.navigationController pushViewController:disarr animated:YES];
		} onError:^(NSError *error) {
			[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
			NSLog(@"error") ;
		}];
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [searchy resignFirstResponder];
}


@end
