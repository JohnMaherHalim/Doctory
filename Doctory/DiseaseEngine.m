//
//  DiseaseEngine.m
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "DiseaseEngine.h"
#import "Disease.h"

@implementation DiseaseEngine


-(void)requestDiseases:(NSMutableArray*)SymptomsIds onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock {
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	[ResultantSymptoms addObject:@"hi"];
	NSMutableArray *diseases = [[NSMutableArray alloc]init];
	
	NSData *jsondat = [NSJSONSerialization dataWithJSONObject:SymptomsIds options:0 error:nil];
	NSError* error;
	NSDictionary* json = [NSJSONSerialization
						  JSONObjectWithData:jsondat
						  
						  options:kNilOptions
						  error:&error];
	
	//NSArray *arraytrial = [[NSArray alloc]initwi:1,2,3, nil];
	NSDictionary *trial = [SymptomsIds mutableCopy];
	//http://ws.doctory.info
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetDiseaseBySymptomsIds"];
	
	NSLog(@"%@",enginepath);
    
	NSMutableArray *idobjects = [[NSMutableArray alloc]init];
	
	for (NSNumber *num in SymptomsIds) {
		NSMutableDictionary *dic = [[NSMutableDictionary alloc]init] ;
		[dic setObject:num forKey:@"SymptomId"];
		[idobjects addObject:dic ];
	}
	
	NSMutableDictionary *bigdic = [[NSMutableDictionary alloc]init];
	[bigdic setObject:idobjects forKey:@"symptoms"];
	
    MKNetworkOperation *op = [[MKNetworkOperation alloc]initWithURLString:enginepath params:bigdic httpMethod:@"POST"];
	
	
	
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
		//       completedOperation
		//        onSuccessBlock([NSMutableArray new]);
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
			if ([jsonObject isKindOfClass:[NSArray class]]) {
				for (NSDictionary* dict in jsonObject) {
					Disease *mydisease = [[Disease alloc]initWithJsonDict:dict];
					[diseases addObject:mydisease];
                }
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
			onSuccessBlock(diseases);
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];
}

- (void) requestDiseaseDetails:(int)DiseaseID onSuccess:(void (^)(Disease* DiseasesArray)) onSuccessBlock
					   onError:(void (^)(NSError* error))onErrorBlock {
	
	NSMutableArray *ResultantSymptoms = [[NSMutableArray alloc]init];
	
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetDiseaseById?DiseaseId=%d",DiseaseID];
	
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
			
			Disease *mydis = [[Disease alloc]initWithJsonDict:jsonObject];
			onSuccessBlock(mydis);
			
			
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];

	
}

- (void) requestDiseases:(int)isSexualhealth Withletter:(NSString*)letter onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
					   onError:(void (^)(NSError* error))onErrorBlock
{
	
	
	NSMutableArray *diseases = [[NSMutableArray alloc]init];
    
    //http://728c3a727a0547269443dbb85735885f.cloudapp.net
	//  NSString *enginepath = [NSString stringWithFormat:@"%@/categories",[PathString getSingleton_instance].mypath];
	
	//specialities = [[NSMutableArray alloc]init];
	
	//letter = @"ا" ;
	/*NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
	[dict setObject:@"ا" forKey:@"alef" ];
	
	letter = [dict objectForKey:@"alef"];
	//letter = [self stringToHex:letter];*/
	
	NSString *a ;
	
	if (isSexualhealth == 0)
		a = @"false" ;
	else
		a= @"true" ;
	
	
	letter = [letter stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	int ascii = [letter characterAtIndex:0];
	NSLog(@"%@",letter) ;
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/GetDiseasesByLetter?letter=%@&isSexualHealth=%@",letter,a];
	
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
					Disease *mydisease = [[Disease alloc]initWithJsonDict:dict];
					[diseases addObject:mydisease];
                }
                
                onSuccessBlock(diseases);
				//                [self saveCategoriesJSONArrayIntoCache:jsonObject];
            }
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];
    
}


-(void)SearchForDiseaseWithletter:(NSString*)letter onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
						  onError:(void (^)(NSError* error))onErrorBlock {
	NSMutableArray *diseases = [[NSMutableArray alloc]init];
    
    //http://728c3a727a0547269443dbb85735885f.cloudapp.net
	//  NSString *enginepath = [NSString stringWithFormat:@"%@/categories",[PathString getSingleton_instance].mypath];
	
	//specialities = [[NSMutableArray alloc]init];
	
	//letter = @"ا" ;
	/*NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
	 [dict setObject:@"ا" forKey:@"alef" ];
	 
	 letter = [dict objectForKey:@"alef"];
	 //letter = [self stringToHex:letter];*/
	
	letter = [letter stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	int ascii = [letter characterAtIndex:0];
	NSLog(@"%@",letter) ;
	NSString *enginepath = [NSString stringWithFormat:@"http://ws.doctory.info/DService.svc/SearchForDisease?key=%@",letter];
	
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
					Disease *mydisease = [[Disease alloc]initWithJsonDict:dict];
					[diseases addObject:mydisease];
                }
                
                onSuccessBlock(diseases);
				//                [self saveCategoriesJSONArrayIntoCache:jsonObject];
            }
        }];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
		//        NSLog(@"Error: %@",error);
        onErrorBlock(error);
    }];
    
    [self enqueueOperation:op ];

}


-(NSString *)getUniCode:(NSString *)aString
{
    NSString *theStringToReturn  = nil;
	
	
    NSMutableString *theEncodedString = [NSMutableString stringWithString:@""];
	
    for (NSInteger theCharIndex=0; theCharIndex< [aString length]; theCharIndex++) {
		
        [theEncodedString appendFormat: @"%04x", [aString characterAtIndex: theCharIndex]];
		
    }
	
    theStringToReturn = [NSString stringWithString:theEncodedString];
	
    return theStringToReturn;
}

-(NSString *) stringToHex:(NSString *)str
{
    NSUInteger len = [str length];
    unichar *chars = malloc(len * sizeof(unichar));
    [str getCharacters:chars];
	
    NSMutableString *hexString = [[NSMutableString alloc] init];
	
    for(NSUInteger i = 0; i < len; i++ )
    {
        // [hexString [NSString stringWithFormat:@"%02x", chars[i]]]; /*previous input*/
        [hexString appendFormat:@"%02x", chars[i]]; /*EDITED PER COMMENT BELOW*/
    }
    free(chars);
	
    return hexString ;
}

@end
