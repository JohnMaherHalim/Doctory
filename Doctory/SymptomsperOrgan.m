//
//  SymptomsperOrgan.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SymptomsperOrgan.h"
#import "Symptom.h"
#import "DiseaseEngine.h"
#import "DiseaseArrayViewController.h"
#import "MBProgressHUD.h"

@interface SymptomsperOrgan ()

@end

@implementation SymptomsperOrgan

@synthesize Symptoms , tableView , mySymptoms ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"اختر الاعراض" ; 
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[tableView setBackgroundColor:[UIColor clearColor]];
	mySymptoms = [[NSMutableArray alloc]init] ; 
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [Symptoms count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
	
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"eventCell"];
    }
	
	//cell.textLabel.text = [diseases objectAtIndex:indexPath.row];
	Symptom *dis = [Symptoms objectAtIndex:indexPath.row];

	cell.textLabel.text = dis.SymptomName ;
	
	UIImageView *imgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check.jpeg"]];
	[imgview setFrame:CGRectMake(0, 0, 30, 30)];
	
	if (dis.isSelected)
		[cell setAccessoryView:imgview];
	else
		[cell setAccessoryView:nil];
	
	
	[cell setBackgroundColor:[UIColor clearColor]];
	
	return cell ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	Symptom *dis = [Symptoms objectAtIndex:indexPath.row];
	
	NSString *varstr = [NSString stringWithFormat:@" إذا كان لديك %@ يفضل ان تعرض نفسك على طبيب  ",dis.SymptomName];
	
	UIAlertView *msg = [[UIAlertView alloc]initWithTitle:@"تحذير" message:varstr delegate:nil cancelButtonTitle:@"إغلاق" otherButtonTitles: nil];
	
	if (dis.SymptomIsAlert && !dis.isSelected)
		[msg show];
	
	if (dis.isSelected)
		[dis setIsSelected:NO];
	else
		[dis setIsSelected:YES] ;
	
	
	[self refreshmysymptoms] ;
	
	[tableView reloadData] ;
	
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
	
	/*Symptom *dis = [Symptoms objectAtIndex:indexPath.row];
	DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
	[diseasedetails setDisease:dis];
	[self.navigationController pushViewController:diseasedetails animated:YES];*/
	
	
}


-(void)refreshmysymptoms {
	[mySymptoms removeAllObjects] ;
	
	for (Symptom *dis in Symptoms) {
		if (dis.isSelected)
			[mySymptoms addObject:dis];
	}
}

-(IBAction)requestdiseases:(id)sender {
	NSMutableArray *numbers = [[NSMutableArray alloc]init] ;
	
	for (Symptom *sym in mySymptoms) {
		[numbers addObject:[NSNumber numberWithInt:sym.SymptomID]];
	}
	
	DiseaseEngine *diseng = [[DiseaseEngine alloc]init] ;
	

	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[diseng requestDiseases:numbers onSuccess:^(NSMutableArray *DiseasesArray) {
		DiseaseArrayViewController *disview = [[DiseaseArrayViewController alloc]init];
		[disview setDiseases:DiseasesArray];
		[disview setFromsymptoms:YES];
		[MBProgressHUD hideHUDForView:self.view animated:YES];
		[self.navigationController pushViewController:disview animated:YES];
		NSLog(@"Success") ;
	} onError:^(NSError *error) {
		[MBProgressHUD hideHUDForView:self.view animated:YES];
		NSLog(@"Failure") ;
	}];
}

@end
