//
//  UserEngine.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "User.h"

@interface UserEngine : MKNetworkEngine


-(void)SaveUser:(User*)user ; 

- (void) requestLoginUser:(NSString*)UserName Withletter:(NSString*)Password onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock;


-(void) requestcreateuse:(NSMutableDictionary*)user onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			onError:(void (^)(NSError* error))onErrorBlock;

-(void) registerDevice:(NSMutableDictionary*)user onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock;

@end
