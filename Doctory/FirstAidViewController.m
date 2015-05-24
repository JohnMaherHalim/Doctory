//
//  FirstAidViewController.m
//  Doctory
//
//  Created by John Maher on 3/7/15.
//  Copyright (c) 2015 John Maher. All rights reserved.
//

#import "FirstAidViewController.h"
#import "FirstAid.h"
#import "FirstAidTableViewCell.h"
#import "FADetailsViewController.h"

@interface FirstAidViewController ()

@end

@implementation FirstAidViewController

@synthesize FirstAids , tableView;




- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"الإسعافات الاولية" ; 
	
	[self.view setBackgroundColor:[UIColor clearColor]];
	[tableView setBackgroundColor:[UIColor clearColor]];
	
	FirstAids = [[NSMutableArray alloc]init]; 
	
	[self preparefirstaids];
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)preparefirstaids {
	
	NSString *str = @"FirstAids";
	NSString *engPath = [[NSBundle mainBundle] pathForResource:
						 str ofType:@"plist"];
	
	NSDictionary *thewholefile = [[NSDictionary alloc] initWithContentsOfFile:engPath] ;
	
	
	
	for (NSString* key in thewholefile) {
		NSDictionary *firstaiddic = [thewholefile objectForKey:key];
		
		FirstAid *firstAid = [[FirstAid alloc]init] ;
		
		[firstAid setFirstAid_Name:[firstaiddic objectForKey:@"Name"]];
		[firstAid setFirstAid_detail:[firstaiddic objectForKey:@"Details"]];
		
		[FirstAids addObject:firstAid];
		// do stuff
	}
	
	
	
	/*NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"FirstAids.plist"];
	NSDictionary *anns = [dict objectForKey:@"Root"];*/
	
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return  [FirstAids count ] ;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *identif = [NSString stringWithFormat:@"%d-%d",indexPath.section , indexPath.row];
	/* cell = [tableView dequeueReusableCellWithIdentifier:identif];
	 
	 if(!cell){
	 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identif];
	 }*/
	
	
	FirstAidTableViewCell *cell = (FirstAidTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identif];
	if (cell == nil)
	{
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FirstAidTableViewCell" owner:self options:nil];
		cell = [nib objectAtIndex:0];
	}
	
	FirstAid *firstaid = [FirstAids objectAtIndex:indexPath.row];
	
	[cell.FirstAidName setText:firstaid.FirstAid_Name];
	[cell.contentView setBackgroundColor:[UIColor clearColor]];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	[cell setBackgroundColor:[UIColor clearColor]];
	
	return  cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	FirstAid *firstaid = [FirstAids objectAtIndex:indexPath.row];
	
	FADetailsViewController *fa = [[FADetailsViewController alloc]init];
	[fa setMyFA:firstaid];
	
	[self.navigationController pushViewController:fa animated:YES]; 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
