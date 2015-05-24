//
//  Question.h
//  Doctory
//
//  Created by John Maher on 3/11/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Question : NSObject

@property (nonatomic , retain) User * ActingDoctor ;
@property int ActingDoctorId ;
@property (nonatomic , retain) NSString *AnswerText ;
@property BOOL isAnswered ;
@property BOOL isReported ;
@property int QuestionId ;
@property (nonatomic , retain) NSString *QuestionText ;
@property int SpecialityId ;
@property (nonatomic , retain) User *Patient ;
@property (nonatomic , retain) NSString *Age ;
@property (nonatomic , retain) NSString *Sex ;
@property int numberoflikes ; 


-(id)initWithJsonDict:(NSDictionary*)jsonDict;

@end
