//
//  Speciality.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Speciality : NSObject

@property (nonatomic , retain) NSString *Name ;
@property (nonatomic , retain) NSString *NameAr ;
@property int SpecialityId ;

-(id)initWithJsonDict:(NSDictionary*)jsonDict ;

@end
