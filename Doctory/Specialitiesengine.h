//
//  Specialitiesengine.h
//  Doctory
//
//  Created by John Maher on 2/25/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface Specialitiesengine : MKNetworkEngine

@property (nonatomic , retain) NSMutableArray *specialities ; 

- (void) requestSpecialities :(void (^)(NSMutableArray* categoriesArray)) onSuccessBlock
                     error:(void (^)(NSError* error))onErrorBlock;

@end
