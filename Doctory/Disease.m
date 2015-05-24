//
//  Disease.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "Disease.h"

@implementation Disease

@synthesize Complications , DiseaseID , Name , NameAr , Reasons , Treatement , SpecialityID , prediagnosis , Diagnoses , DiseaseSymptoms , IsAlert , Introduction , Prognosis ;
-(id)initWithJsonDict:(NSDictionary*)jsonDict {
	self = [super init];
	
	if (self) {
		[self loadfromDic:jsonDict];
	}
	
	return  self ;
}

-(id)init {
	self = [super init];
	
	return self ; 
}


-(void)loadfromDic:(NSDictionary*)jsonDict {
	
	self.Complications = [jsonDict objectForKey:@"Complications"];
	self.DiseaseID = [[jsonDict objectForKey:@"DiseaseId"]intValue];
	self.Name = [jsonDict objectForKey:@"Name"];
	self.NameAr = [jsonDict objectForKey:@"NameAr"];
	self.SpecialityID = [[jsonDict objectForKey:@"SpecialityId"]intValue];
	self.Reasons = [jsonDict objectForKey:@"Reasons"];
	self.Treatement = [jsonDict objectForKey:@"Treatment"];
	self.prediagnosis = [jsonDict objectForKey:@"PreDiagnosis"] ;
	self.Diagnoses = [jsonDict objectForKey:@"Diagnoses"];
	self.DiseaseSymptoms = [jsonDict objectForKey:@"DiseaseSymptoms"];
	self.Introduction = [jsonDict objectForKey:@"Introduction"];
	self.IsAlert = [[jsonDict objectForKey:@"IsAlert"]boolValue];
	self.Prognosis = [jsonDict objectForKey:@"Prognosis"];
	
}

@end
