//
//  Symptom.m
//  Doctory
//
//  Created by John Maher on 2/25/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "Symptom.h"

@implementation Symptom

@synthesize SymptomID , SymptomName , OrganID  , SymptomIsAlert;

-(id)initWithJsonDict:(NSDictionary*)jsonDict {
	self = [super init];
	
	if (self) {
		[self loadfromDic:jsonDict];
	}
	
	return  self ;
}


-(void)loadfromDic:(NSDictionary*)jsonDict {
	self.SymptomID = [[jsonDict objectForKey:@"SymptomId"]intValue];
	self.OrganID = [[jsonDict objectForKey:@"OrganId"]intValue];
	self.SymptomName = [jsonDict objectForKey:@"SymptomName"];
	self.SymptomIsAlert = [[jsonDict objectForKey:@"IsAlert"]boolValue];
}


@end
