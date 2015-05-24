//
//  MedicinesViewController.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MedicinesViewController.h"
#import "Medicine.h"
#import "MedicineEngine.h"
#import "MBProgressHUD.h"
#import "MedicineDetailsViewController.h"

@interface MedicinesViewController ()

@end

@implementation MedicinesViewController

@synthesize  tableView , Medicines ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"الادوية";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[tableView setBackgroundColor:[UIColor clearColor]];
	UIImageView *imgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"medicine_bg.png"]];
	[tableView setBackgroundView:imgview ];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [Medicines count];
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
	
	//cell.textLabel.text = [diseases objectAtIndex:indexPath.row];
	Medicine *dis = [Medicines objectAtIndex:indexPath.row];
	//cell.textLabel.text = dis.ArabicName ;
	
	UILabel *letter = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, cell.frame.size.width - 30, cell.frame.size.height)];
	[cell addSubview:letter];
	[letter setTextAlignment:NSTextAlignmentRight];
	NSString *str = [NSString stringWithFormat:@"%@ %@",dis.EnglishName , dis.ArabicName];
	[letter setText:str];
	[letter setBackgroundColor:[UIColor clearColor]];
	[cell addSubview:letter];
	
	
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	[cell setBackgroundColor:[UIColor clearColor]];
	
	return cell ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	/*NSString *letter = [diseaseletters objectAtIndex:indexPath.row];
	 DiseaseEngine *diseng = [[DiseaseEngine alloc]init];
	 [diseng requestDiseases:0 Withletter:letter onSuccess:^(NSMutableArray *DiseasesArray) {
	 NSLog(@"success");
	 DiseaseArrayViewController *disarr = [[DiseaseArrayViewController alloc]init];
	 [disarr setDiseases:DiseasesArray];
	 [self.navigationController pushViewController:disarr animated:YES];
	 } onError:^(NSError *error) {
	 NSLog(@"error") ;
	 }];*/
	Medicine *justname = [Medicines objectAtIndex:indexPath.row];
	MedicineEngine *diseng = [[MedicineEngine alloc]init] ;
	
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	
	[diseng requestMedicineDetails:justname.MedicineId onSuccess:^(Medicine *DiseasesArray) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		MedicineDetailsViewController *details = [[MedicineDetailsViewController alloc]init] ;
		[details setMymedicine:DiseasesArray] ;
		[self.navigationController pushViewController:details animated:YES];
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
	}];
	
	/*[diseng requestDiseaseDetails:justname.MedicineId onSuccess:^(Disease *DiseasesArray) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		if (fromsymptoms) {
			DiseaseDoubtViewController *diseasedetails = [[DiseaseDoubtViewController alloc]init];
			[diseasedetails setDis:DiseasesArray];
			[self.navigationController pushViewController:diseasedetails animated:YES];
		}
		else {
			DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
			[diseasedetails setDisease:DiseasesArray];
			[self.navigationController pushViewController:diseasedetails animated:YES];
		}
		
		//  dis = DiseasesArray ;
		
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		
	}];*/
	//Disease *dis = [diseases objectAtIndex:indexPath.row];
	
	
	
}


@end
