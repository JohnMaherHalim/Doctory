//
//  Symptom.h
//  Doctory
//
//  Created by John Maher on 2/25/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Symptom : NSObject

@property int SymptomID ;
@property (nonatomic , retain) NSString *SymptomName ;
@property int OrganID ;
@property BOOL SymptomIsAlert ;
@property BOOL isSelected ; 

-(id)initWithJsonDict:(NSDictionary*)jsonDict ; 

@end
