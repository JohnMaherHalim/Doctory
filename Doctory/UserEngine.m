//
//  UserEngine.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "UserEngine.h"


@implementation UserEngine

- (void) requestLoginUser:(NSString*)UserName Withletter:(NSString*)Password onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
				  onError:(void (^)(NSError* error))onErrorBlock {
	
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init] ;
	
	
	
	NSMutableDictionary *userlogin = [[NSMutableDictionary alloc]init] ;
	[userlogin setObject:UserName forKey:@"Username"];
	[userlogin setObject:Password forKey:@"Password"];
	
	
	
	NSMutableDictionary *myuser = [[NSMutableDictionary alloc]init] ;
	[myuser setObject:userlogin forKey:@"user"];
	
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/LogIn/"];
	
	MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:myuser httpMethod:@"POST"];
	
	[op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			
			
			NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
			[defaults setObject:UserName forKey:@"myUserName"];
			[defaults setObject:Password forKey:@"myPassword"];
			[defaults synchronize];
			
			User *user = [[User alloc]initWithJsonDict:jsonObject];
			
			if (user.UserType != 0) {
				/*NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
				[prefs setObject:user forKey:@"MyUser"];
				[prefs synchronize];*/
				[self SaveUser:user];
				NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
				[defaults setInteger:user.UserId forKey:@"RegisterDeviceUserID"];
				[defaults setBool:true forKey:@"RegisterDeviceState"];
				[defaults synchronize];
				
				
				[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
				 (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
				
			} else {
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Wrong username or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
				[alert show];
			}
			
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


-(void) requestcreateuse:(NSMutableDictionary*)user onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock {
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/CreateNewuser/"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:user httpMethod:@"POST"];
	
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

-(void) registerDevice:(NSMutableDictionary*)user onSuccess:(void (^)(NSMutableArray* QuestionsArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock {
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/RegisterDevice/"];
	
	NSLog(@"%@",enginepath);
    
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:user httpMethod:@"POST"];
	
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

-(void)SaveUser:(User*)user {
	NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"MyUser"];
    [defaults synchronize];
}

@end
