//
//  QuestionsEngine.m
//  Doctory
//
//  Created by John Maher on 3/12/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "QuestionsEngine.h"

#import "Question.h"

@implementation QuestionsEngine

- (void) requestQuestionsBySpecialityID:(int)SpecialityID onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
								onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetQuestionsBySpeciality?specialityId=%d",SpecialityID];
	
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
					Question *myquestion = [[Question alloc]initWithJsonDict:dict];
					[ResultantSymptoms addObject:myquestion];
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

- (void) requestQuestionsByUserID:(int)UserID onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
						  onError:(void (^)(NSError* error))onErrorBlock {
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetQuestionsByUserId?userId=%d",UserID];
	
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
					Question *myquestion = [[Question alloc]initWithJsonDict:dict];
					[ResultantSymptoms addObject:myquestion];
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


-(void) AskQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/AskQuestion"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:question httpMethod:@"POST"];
	
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
           /* if ([jsonObject isKindOfClass:[NSArray class]]) {
				//   [self saveCategoriesJSONArrayIntoCache:jsonObject];
				
				// NSMutableArray* arrayOfCategories = [NSMutableArray new];
                for (NSDictionary* dict in jsonObject) {
					Question *myquestion = [[Question alloc]initWithJsonDict:dict];
					[ResultantSymptoms addObject:myquestion];
                }
                
                onSuccessBlock(ResultantSymptoms);
				//                [self saveCategoriesJSONArrayIntoCache:jsonObject];
            }*/
			
			onSuccessBlock(ResultantSymptoms);
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];
	
	
}

-(void) AnswerQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/AnswerQuestion/"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:question httpMethod:@"POST"];
	
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
			/* if ([jsonObject isKindOfClass:[NSArray class]]) {
			 //   [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 
			 // NSMutableArray* arrayOfCategories = [NSMutableArray new];
			 for (NSDictionary* dict in jsonObject) {
			 Question *myquestion = [[Question alloc]initWithJsonDict:dict];
			 [ResultantSymptoms addObject:myquestion];
			 }
			 
			 onSuccessBlock(ResultantSymptoms);
			 //                [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 }*/
			
			onSuccessBlock(ResultantSymptoms);
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];
}

-(void) LikeQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			 onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/LikeQuestion/"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:question httpMethod:@"POST"];
	
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
			/* if ([jsonObject isKindOfClass:[NSArray class]]) {
			 //   [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 
			 // NSMutableArray* arrayOfCategories = [NSMutableArray new];
			 for (NSDictionary* dict in jsonObject) {
			 Question *myquestion = [[Question alloc]initWithJsonDict:dict];
			 [ResultantSymptoms addObject:myquestion];
			 }
			 
			 onSuccessBlock(ResultantSymptoms);
			 //                [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 }*/
			
			onSuccessBlock(ResultantSymptoms);
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];
	
}


-(void) ReportQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/DeleteQuestion/"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:question httpMethod:@"POST"];
	
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			//            NSLog(@"%@",jsonObject);
			/* if ([jsonObject isKindOfClass:[NSArray class]]) {
			 //   [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 
			 // NSMutableArray* arrayOfCategories = [NSMutableArray new];
			 for (NSDictionary* dict in jsonObject) {
			 Question *myquestion = [[Question alloc]initWithJsonDict:dict];
			 [ResultantSymptoms addObject:myquestion];
			 }
			 
			 onSuccessBlock(ResultantSymptoms);
			 //                [self saveCategoriesJSONArrayIntoCache:jsonObject];
			 }*/
			
			onSuccessBlock(ResultantSymptoms);
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];
	
}

@end
