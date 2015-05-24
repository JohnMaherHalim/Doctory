//
//  Question.m
//  Doctory
//
//  Created by John Maher on 3/11/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize ActingDoctor , ActingDoctorId , AnswerText , isAnswered , isReported , QuestionId , QuestionText , SpecialityId , Patient , numberoflikes ;

-(id)initWithJsonDict:(NSDictionary*)jsonDict {
	self = [super init];
	
	if (self) {
		[self loadfromDic:jsonDict];
	}
	
	return  self ;
}

-(void)loadfromDic:(NSDictionary*)jsonDict {
	
	self.ActingDoctor = [[User alloc]initWithJsonDict:[jsonDict objectForKey:@"ActingDoctor"]];
	self.ActingDoctorId = [[jsonDict objectForKey:@"ActingDoctorId"]intValue];
	if (![[jsonDict objectForKey:@"AnswerText"]isKindOfClass:[NSNull class]])
	self.AnswerText = [jsonDict objectForKey:@"AnswerText"];
	else
		self.AnswerText = @"" ; 
	self.isAnswered = [[jsonDict objectForKey:@"IsAnswered"]boolValue];
	self.isReported = [[jsonDict objectForKey:@"IsReported"]boolValue];
	self.QuestionId = [[jsonDict objectForKey:@"QuestionId"]integerValue];
	self.QuestionText = [jsonDict objectForKey:@"QuestionText"];
	self.SpecialityId = [[jsonDict objectForKey:@"SpecialityId"]integerValue];
	self.Patient = [[User alloc]initWithJsonDict:[jsonDict objectForKey:@"User"]];
	self.numberoflikes = [[jsonDict objectForKey:@"LikesCount"]intValue];
	
}


@end
