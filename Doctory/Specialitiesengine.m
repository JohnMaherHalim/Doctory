//
//  Specialitiesengine.m
//  Doctory
//
//  Created by John Maher on 2/25/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "Specialitiesengine.h"

@implementation Specialitiesengine

@synthesize specialities ;

- (void) requestSpecialities:(void (^)(NSMutableArray* categoriesArray)) onSuccessBlock
					 error:(void (^)(NSError* error))onErrorBlock
{
    
    //http://728c3a727a0547269443dbb85735885f.cloudapp.net
  //  NSString *enginepath = [NSString stringWithFormat:@"%@/categories",[PathString getSingleton_instance].mypath];
	
	specialities = [[NSMutableArray alloc]init];
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:@"http://ws.doctory.info/DService.svc/GetAllSpecialities/" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
            if ([jsonObject isKindOfClass:[NSArray class]]) {
             //   [self saveCategoriesJSONArrayIntoCache:jsonObject];
				
               // NSMutableArray* arrayOfCategories = [NSMutableArray new];
                for (NSDictionary* dict in jsonObject) {
					NSString *name = [dict objectForKey:@"Name"];
					[specialities addObject:name];
                /*    Category* category = [[Category alloc]initWithJsonDict:dict];
                    [arrayOfCategories addObject:category];
                    [category release];*/
                }
                
                onSuccessBlock(specialities);
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
