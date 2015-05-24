//
//  SpecialityEngine.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SpecialityEngine.h"
#import "Speciality.h"

@implementation SpecialityEngine

- (void) requestSpecialities:(void (^)(NSMutableArray* SymptomsArray)) onSuccessBlock
					 onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *Specialities = [[NSMutableArray alloc]init];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetAllSpecialities"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
            if ([jsonObject isKindOfClass:[NSArray class]]) {
				//   [self saveCategoriesJSONArrayIntoCache:jsonObject];
				
				// NSMutableArray* arrayOfCategories = [NSMutableArray new];
                for (NSDictionary* dict in jsonObject) {
					Speciality *mysymptom = [[Speciality alloc]initWithJsonDict:dict];
					[Specialities addObject:mysymptom];
                }
                
                onSuccessBlock(Specialities);
				//                [self saveCategoriesJSONArrayIntoCache:jsonObject];
            }
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];

	
}

@end
