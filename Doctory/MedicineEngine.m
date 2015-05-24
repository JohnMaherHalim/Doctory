//
//  MedicineEngine.m
//  Doctory
//
//  Created by John Maher on 3/1/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MedicineEngine.h"


@implementation MedicineEngine

- (void) requestMedicines:(NSString*)letter onSuccess:(void (^)(NSMutableArray* MedicinesArray)) onSuccessBlock
				  onError:(void (^)(NSError* error))onErrorBlock {
	
	
	NSMutableArray *medicines = [[NSMutableArray alloc]init];
	letter = [letter stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	int ascii = [letter characterAtIndex:0];
	NSLog(@"%@",letter) ;
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/SearchForMedecine?key=%@",letter];
	
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
					Medicine *mydisease = [[Medicine alloc]initWithJsonDict:dict];
					[medicines addObject:mydisease];
                }
                
                onSuccessBlock(medicines);
				//                [self saveCategoriesJSONArrayIntoCache:jsonObject];
            }
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];

	
}

- (void) requestMedicineDetails:(int)MedicineID onSuccess:(void (^)(Medicine* DiseasesArray)) onSuccessBlock
						onError:(void (^)(NSError* error))onErrorBlock {
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetMedicineById?medicineId=%d",MedicineID];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
			/*   if ([jsonObject isKindOfClass:[NSArray class]]) {
			 //   [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 
			 // NSMutableArray* arrayOfCategories = [NSMutableArray new];
			 for (NSDictionary* dict in jsonObject) {
			 //Disease *mydis =
			 //	Symptom *mysymptom = [[Symptom alloc]initWithJsonDict:dict];
			 //	[ResultantSymptoms addObject:mysymptom];
			 }
			 
			 onSuccessBlock(ResultantSymptoms);
			 //                [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 }*/
			
			Medicine *mydis = [[Medicine alloc]initWithJsonDict:jsonObject];
			onSuccessBlock(mydis);
			
			
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];

}

@end
