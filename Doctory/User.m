//
//  User.m
//  Doctory
//
//  Created by John Maher on 3/11/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize Age , Email , FirstName , LastName , Sex , SpecialityId , UserId , UserType , UserName , likedquestionsids , Title, Work , SpecialityName , firstname , lastname ;

-(id)initWithJsonDict:(NSDictionary*)jsonDict {
	self = [super init];
	
	if (self) {
		[self loadfromDic:jsonDict];
	}
	
	return  self ;
}

-(void)loadfromDic:(NSDictionary*)jsonDict {
	
	self.Age = [[jsonDict objectForKey:@"Age"]integerValue];
	self.Email = [jsonDict objectForKey:@"Email"];
	self.FirstName = [jsonDict objectForKey:@"FirstName"];
	self.LastName = [jsonDict objectForKey:@"LastName"];
	self.likedquestionsids = [jsonDict objectForKey:@"LikedQuestionsId"];
	self.Sex = [jsonDict objectForKey:@"Sex"];
	self.SpecialityId = [[jsonDict objectForKey:@"SpecialityId"]integerValue];
	self.UserId = [[jsonDict objectForKey:@"UserId"]integerValue];
	self.UserType = [[jsonDict objectForKey:@"UserTypeId"]integerValue];
	if (![[jsonDict objectForKey:@"Username"] isKindOfClass:[NSNull class] ])
	self.UserName = [jsonDict objectForKey:@"Username"];
	else
		self.UserName = @"" ;
	
	self.Title = [jsonDict objectForKey:@"Title"];
	
	if (self.Title == (NSString*)[NSNull null])
		self.Title = @"" ;
	
	self.Work = [jsonDict objectForKey:@"Work"];
	if (self.Work == (NSString*)[NSNull null])
		self.Work = @"" ;
	
	self.SpecialityName = [jsonDict objectForKey:@"SpecialityName"];
	if (self.SpecialityName == (NSString*)[NSNull null])
		self.SpecialityName = @"" ;
	
	self.firstname = [jsonDict objectForKey:@"FirstName"];
	if (self.firstname == (NSString*)[NSNull null])
		self.firstname = @"" ;
	self.lastname = [jsonDict objectForKey:@"LastName"];
	if (self.lastname == (NSString*)[NSNull null])
		self.lastname = @"" ;
	
	self.Name = [NSString stringWithFormat:@"%@ %@",firstname ,lastname];
	
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeInteger:self.Age forKey:@"MyAge"];
    [encoder encodeObject:self.Email forKey:@"MyEmail"];
    [encoder encodeObject:self.FirstName forKey:@"MyFirstName"];
	[encoder encodeObject:self.LastName forKey:@"MyLastName"];
	[encoder encodeObject:self.likedquestionsids forKey:@"MyLikedQuestions"];
	[encoder encodeObject:self.Sex forKey:@"MySex"];
	[encoder encodeInteger:self.SpecialityId forKey:@"MySpecialityId"];
	[encoder encodeInteger:self.UserType forKey:@"MyUserTypeId"];
	[encoder encodeInteger:self.UserId forKey:@"MyUserId"];
	[encoder encodeObject:self.UserName forKey:@"MyUserName"];
	[encoder encodeObject:self.Title forKey:@"MyTitle"];
	[encoder encodeObject:self.Work forKey:@"MyWork"];
	[encoder encodeObject:self.SpecialityName forKey:@"MySpecialityName"];
	[encoder encodeObject:self.Name forKey:@"MyName"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.Age = [decoder decodeIntegerForKey:@"MyAge"];
        self.Email = [decoder decodeObjectForKey:@"MyEmail"];
		self.FirstName = [decoder decodeObjectForKey:@"MyFirstName"];
        self.LastName = [decoder decodeObjectForKey:@"MyLastName"];
		self.likedquestionsids = [decoder decodeObjectForKey:@"MyLikedQuestions"];
		self.Sex = [decoder decodeObjectForKey:@"MySex"];
		self.SpecialityId = [decoder decodeIntegerForKey:@"MySpecialityId"];
		self.UserType = [decoder decodeIntegerForKey:@"MyUserTypeId"];
		self.UserId = [decoder decodeIntegerForKey:@"MyUserId"];
		self.UserName = [decoder decodeObjectForKey:@"MyUserName"];
		self.Title = [decoder decodeObjectForKey:@"MyTitle"];
		self.Work = [decoder decodeObjectForKey:@"MyWork"];
		self.SpecialityName = [decoder decodeObjectForKey:@"MySpecialityName"];
		self.Name = [decoder decodeObjectForKey:@"MyName"]; 
    }
    return self;
}


@end
