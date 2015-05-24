//
//  QuestionsEngine.h
//  Doctory
//
//  Created by John Maher on 3/12/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface QuestionsEngine : MKNetworkEngine

- (void) requestQuestionsBySpecialityID:(int)SpecialityID onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
						  onError:(void (^)(NSError* error))onErrorBlock;


- (void) requestQuestionsByUserID:(int)UserID onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
								onError:(void (^)(NSError* error))onErrorBlock;


-(void) AskQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			onError:(void (^)(NSError* error))onErrorBlock;

-(void) AnswerQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			onError:(void (^)(NSError* error))onErrorBlock;

-(void) LikeQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock;

-(void) ReportQuestion:(NSMutableDictionary*)question onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock;

@end
