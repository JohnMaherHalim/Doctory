//
//  Speciality.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "Speciality.h"

@implementation Speciality

@synthesize NameAr , Name , SpecialityId ;


-(id)initWithJsonDict:(NSDictionary*)jsonDict {
	self = [super init];
	
	if (self) {
		[self loadfromDic:jsonDict];
	}
	
	return  self ;
}


-(void)loadfromDic:(NSDictionary*)jsonDict {
	
	self.Name = [jsonDict objectForKey:@"Name"];
	self.NameAr = [jsonDict objectForKey:@"NameAr"];
	self.SpecialityId = [[jsonDict objectForKey:@"SpecialityId"]intValue];
	
}


@end
