//
//  DiseaseArrayViewController.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DiseaseArrayViewController.h"
#import "Disease.h"
#import "DiseaseDetailsViewController.h"
#import "DiseaseDoubtViewController.h"
#import "DiseaseEngine.h"
#import "MBProgressHUD.h"
#import "DiseaseNameCell.h"

@interface DiseaseArrayViewController ()

@end

@implementation DiseaseArrayViewController

@synthesize diseases ;
@synthesize fromsymptoms ;
@synthesize mylang ;
@synthesize tableView;
@synthesize domdis ; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"الامراض" ; 
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[tableView setBackgroundColor:[UIColor clearColor]];
	UIImageView *imgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"disease_bg.png"]];
	[tableView setBackgroundView:imgview];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [diseases count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//UITableViewCell *cell = nil;
	NSString *identif = [NSString stringWithFormat:@"%d-%d",indexPath.section , indexPath.row];
   /* cell = [tableView dequeueReusableCellWithIdentifier:identif];
	
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identif];
    }*/
	
	
	DiseaseNameCell *cell = (DiseaseNameCell *)[tableView dequeueReusableCellWithIdentifier:identif];
	if (cell == nil)
	{
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DiseaseNameCell" owner:self options:nil];
		cell = [nib objectAtIndex:0];
	}
	
	//cell.textLabel.text = [diseases objectAtIndex:indexPath.row];
	Disease *dis = [diseases objectAtIndex:indexPath.row];
	/*if ([mylang isEqualToString:@"ar"])
	cell.textLabel.text = dis.NameAr ;
	else
		cell.textLabel.text = dis.Name ;*/
	
	
	/*UILabel *letter = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, cell.frame.size.width - 30, cell.frame.size.height)];
	[cell addSubview:letter];
	[letter setTextAlignment:NSTextAlignmentRight];
	NSString *str = [NSString stringWithFormat:@"%@ %@",dis.Name , dis.NameAr];
	[letter setText:str];
	[letter setBackgroundColor:[UIColor clearColor]];
	[cell addSubview:letter];*/
	
	
	[cell.DiseaseArabicName setText:dis.NameAr];
	[cell.DiseaseEnglishName setText:dis.Name];
	
	
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
	Disease *justname = [diseases objectAtIndex:indexPath.row];
	DiseaseEngine *diseng = [[DiseaseEngine alloc]init] ;
	
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[diseng requestDiseaseDetails:justname.DiseaseID onSuccess:^(Disease *DiseasesArray) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
		if (fromsymptoms) {
			
			
			
			if (DiseasesArray.IsAlert) {
				[self setDomdis:DiseasesArray];
				UIAlertView *msg = [[UIAlertView alloc]initWithTitle:nil message:@"هذا المرض غاية في الخطورة و إن كان لديك هذا المرض فلابد ان تعرض نفسك على طبيب في اقرب فرصة" delegate:self cancelButtonTitle:@"اغلق ، سأعرض نفسي على طبيب" otherButtonTitles:@"استكمل ، اريد المعرفة عن المرض", nil];
				[msg show];
			}else {
				
				[self gotodisease:DiseasesArray];
				
			/*	DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
				[diseasedetails setDisease:DiseasesArray];
				[self.navigationController pushViewController:diseasedetails animated:YES];*/
			
			/*	DiseaseDoubtViewController *diseasedetails = [[DiseaseDoubtViewController alloc]init];
				[diseasedetails setDis:DiseasesArray];
				[self.navigationController pushViewController:diseasedetails animated:YES];*/
			}
		}
		else {
			DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
			[diseasedetails setDisease:DiseasesArray];
			[self.navigationController pushViewController:diseasedetails animated:YES];
		}
		
		//  dis = DiseasesArray ;
		
	} onError:^(NSError *error) {
		[MBProgressHUD hideAllHUDsForView:self.view animated:YES];

	}];
	//Disease *dis = [diseases objectAtIndex:indexPath.row];
	
	
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 1) {
		[self gotodisease:domdis];
	/*DiseaseDoubtViewController *diseasedetails = [[DiseaseDoubtViewController alloc]init];
	[diseasedetails setDis:domdis];
	[self.navigationController pushViewController:diseasedetails animated:YES];*/
	}
}

-(void)gotodisease:(Disease*)mydis {
	DiseaseDetailsViewController *diseasedetails = [[DiseaseDetailsViewController alloc]init];
	[diseasedetails setDisease:mydis];
	[self.navigationController pushViewController:diseasedetails animated:YES];
	
	/*	DiseaseDoubtViewController *diseasedetails = [[DiseaseDoubtViewController alloc]init];
	 [diseasedetails setDis:DiseasesArray];
	 [self.navigationController pushViewController:diseasedetails animated:YES];*/
}

@end
