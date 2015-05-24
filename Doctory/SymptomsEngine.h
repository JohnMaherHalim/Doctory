//
//  SymptomsEngine.h
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface SymptomsEngine : MKNetworkEngine

- (void) requestSymptomsByOrganID:(int)OrganID onSuccess:(void (^)(NSMutableArray* SymptomsArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock;

@end
