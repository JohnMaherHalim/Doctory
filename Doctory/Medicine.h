//
//  Medicine.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medicine : NSObject

@property (nonatomic , retain) NSString *ArabicName ;
@property (nonatomic , retain) NSString *Description ;
@property (nonatomic , retain) NSString *EnglishName ;
@property (nonatomic , retain) NSString *Introduction ;
@property int MedicineId ;
@property (nonatomic , retain) NSString *OtherNames ;
@property (nonatomic , retain) NSString *Precautions ;
@property (nonatomic , retain) NSString *SideEffects ; 


-(id)initWithJsonDict:(NSDictionary*)jsonDict ;

@end
