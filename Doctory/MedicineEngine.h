//
//  MedicineEngine.h
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "Medicine.h"

@interface MedicineEngine : MKNetworkEngine

- (void) requestMedicines:(NSString*)letter onSuccess:(void (^)(NSMutableArray* MedicinesArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock;

- (void) requestMedicineDetails:(int)MedicineID onSuccess:(void (^)(Medicine* DiseasesArray)) onSuccessBlock
						onError:(void (^)(NSError* error))onErrorBlock;

@end
