//
//  Disease.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disease : NSObject

@property (nonatomic , retain) NSString *Complications ;
@property int DiseaseID ;
@property (nonatomic , retain) NSString *Name ;
@property (nonatomic , retain) NSString *NameAr ;
@property (nonatomic , retain) NSString *Reasons ;
@property (nonatomic , retain) NSString *Treatement ;
@property (nonatomic , retain) NSString *Diagnoses ;
@property (nonatomic , retain) NSString *DiseaseSymptoms ;
@property (nonatomic , retain) NSString *Introduction ;
@property BOOL IsAlert ;
@property (nonatomic , retain) NSString *Prognosis ;

@property int SpecialityID ;
@property (nonatomic , retain) NSString *prediagnosis ; 

-(id)initWithJsonDict:(NSDictionary*)jsonDict ;
-(id)init ; 

@end
