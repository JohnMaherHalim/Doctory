//
//  SymptomsEngine.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "SymptomsEngine.h"
#import "Symptom.h"

@implementation SymptomsEngine


- (void) requestSymptomsByOrganID:(int)OrganID onSuccess:(void (^)(NSMutableArray* SymptomsArray)) onSuccessBlock
						  onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetSymptomsByOrganId?organId=%d",OrganID];
	//NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetSymptomsByOrganId?organId=%d",OrganID];
	
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
					Symptom *mysymptom = [[Symptom alloc]initWithJsonDict:dict];
					[ResultantSymptoms addObject:mysymptom];
                }
                
                onSuccessBlock(ResultantSymptoms);
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
