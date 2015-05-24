//
//  User.h
//  Doctory
//
//  Created by John Maher on 3/11/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property int Age ;
@property (nonatomic , retain) NSString *Email ;
@property (nonatomic , retain) NSString *FirstName ;
@property (nonatomic , retain) NSString *LastName ;
@property (nonatomic , retain) NSString *Sex ;
@property int SpecialityId ;
@property int UserId ;
@property int UserType ;
@property (nonatomic , retain) NSString *UserName ;
@property (nonatomic , retain) NSMutableArray *likedquestionsids ;
@property (nonatomic , retain) NSString *Title ; 

@property (nonatomic , retain) NSString *Work ;
@property (nonatomic , retain) NSString *SpecialityName ;

@property (nonatomic , retain) NSString *firstname ;
@property (nonatomic , retain) NSString *lastname ;
@property (nonatomic , retain) NSString *Name ; 

-(id)initWithJsonDict:(NSDictionary*)jsonDict;

@end
