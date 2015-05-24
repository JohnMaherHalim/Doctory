//
//  Medicine.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "Medicine.h"

@implementation Medicine

@synthesize ArabicName , Description , EnglishName , Introduction , MedicineId , OtherNames , Precautions , SideEffects ;

-(id)initWithJsonDict:(NSDictionary*)jsonDict {
	self = [super init];
	
	if (self) {
		[self loadfromDic:jsonDict];
	}
	
	return  self ;
}


-(void)loadfromDic:(NSDictionary*)jsonDict {
	
	self.ArabicName = [jsonDict objectForKey:@"NameAr"];
	self.Description = [jsonDict objectForKey:@"Description"];
	self.EnglishName = [jsonDict objectForKey:@"Name"];
	self.Introduction = [jsonDict objectForKey:@"Introduction"];
	self.MedicineId = [[jsonDict objectForKey:@"MedecineId"]intValue];
	self.OtherNames = [jsonDict objectForKey:@"OtherNames"];
	self.Precautions = [jsonDict objectForKey:@"Precautions"];
	self.SideEffects = [jsonDict objectForKey:@"SideEffects"];
	
}


@end
