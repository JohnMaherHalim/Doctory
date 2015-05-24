//
//  ChooseOrganViewController.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "ChooseOrganViewController.h"
#import "Organ.h"
#import "SymptomsEngine.h"
#import "SymptomsperOrgan.h"
#import "MBProgressHUD.h"

@interface ChooseOrganViewController ()

@end

@implementation ChooseOrganViewController

@synthesize tableView , Organs;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		Organs = [[NSMutableArray alloc]init];
		self.title = @"اختر عضو" ;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	Organ *eyes = [[Organ alloc]init];
	eyes.OrganID = 0 ;
	eyes.OrganName = @"العيون";
	
	Organ *head = [[Organ alloc]init];
	head.OrganID = 1 ;
	head.OrganName = @"الرأس";
	Organ *hand = [[Organ alloc]init];
	hand.OrganName = @"اليد" ;
	hand.OrganID = 2 ;
	Organ *foot = [[Organ alloc]init];
	foot.OrganName = @"القدم" ;
	foot.OrganID = 3 ;
	Organ *Chest = [[Organ alloc]init] ;
	Chest.OrganID = 4 ;
	Chest.OrganName = @"الصدر" ;
	Organ *Batn = [[Organ alloc]init] ;
	Batn.OrganID = 5 ;
	Batn.OrganName = @"البطن" ;
	Organ *hood = [[Organ alloc]init] ;
	hood.OrganID = 6 ;
	hood.OrganName = @"الحوض" ;
	Organ *Zahr = [[Organ alloc]init] ;
	Zahr.OrganID = 7 ;
	Zahr.OrganName = @"الظهر" ;
	Organ *baack = [[Organ alloc]init] ;
	baack.OrganID = 8 ;
	baack.OrganName = @"المؤخرة" ;
	
	[Organs addObject:eyes];
	[Organs addObject:head];
	[Organs addObject:hand];
	[Organs addObject:foot];
	[Organs addObject:Chest];
	[Organs addObject:Batn];
	[Organs addObject:hood];
	[Organs addObject:Zahr];
	[Organs addObject:baack]; 
	
	
	[tableView setBackgroundColor:[UIColor clearColor]];
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [Organs count];
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
	
	
	Organ *organ = [Organs objectAtIndex:indexPath.row];
	//cell.textLabel.text = organ.OrganName ;
	
	UILabel *letter = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, cell.frame.size.width - 30, cell.frame.size.height)];
	[cell addSubview:letter];
	[letter setText:organ.OrganName];
	[letter setBackgroundColor:[UIColor clearColor]];
	
	[cell setBackgroundColor:[UIColor clearColor]];
	[cell.contentView setBackgroundColor:[UIColor clearColor]];
	[letter setTextAlignment:NSTextAlignmentRight];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	
	/*UITableViewCell *cell = nil;
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
	
	return cell ;*/
	//cell.textLabel.text = [diseaseletters objectAtIndex:indexPath.row];
	
	return cell ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
/*	NSString *letter = [diseaseletters objectAtIndex:indexPath.row];
	DiseaseEngine *diseng = [[DiseaseEngine alloc]init];
	[diseng requestDiseases:Sexualhealth Withletter:letter onSuccess:^(NSMutableArray *DiseasesArray) {
		NSLog(@"success");
		DiseaseArrayViewController *disarr = [[DiseaseArrayViewController alloc]init];
		[disarr setDiseases:DiseasesArray];
		[self.navigationController pushViewController:disarr animated:YES];
	} onError:^(NSError *error) {
		NSLog(@"error") ;
	}];
	*/
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	Organ *organ = [Organs objectAtIndex:indexPath.row];
	SymptomsEngine *symengine = [[SymptomsEngine alloc]init];
	[symengine requestSymptomsByOrganID:organ.OrganID onSuccess:^(NSMutableArray *SymptomsArray) {
		NSLog(@"succes") ;
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		SymptomsperOrgan *symperorg = [[SymptomsperOrgan alloc]init];
		[symperorg setSymptoms:SymptomsArray] ;
		[self.navigationController pushViewController:symperorg animated:YES];
		
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		NSLog(@"failure");
	}];
	
	
}

@end
