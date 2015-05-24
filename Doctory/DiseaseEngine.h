//
//  DiseaseEngine.h
//  Doctory
//
//  Created by John Maher on 2/26/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "Disease.h"

@interface DiseaseEngine : MKNetworkEngine


- (void) requestDiseases:(int)isSexualhealth Withletter:(NSString*)letter onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock;


- (void) requestDiseaseDetails:(int)DiseaseID onSuccess:(void (^)(Disease* DiseasesArray)) onSuccessBlock
				 onError:(void (^)(NSError* error))onErrorBlock;


-(void)requestDiseases:(NSMutableArray*)SymptomsIds onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock ;


-(void)SearchForDiseaseWithletter:(NSString*)letter onSuccess:(void (^)(NSMutableArray* DiseasesArray)) onSuccessBlock
			   onError:(void (^)(NSError* error))onErrorBlock ;

@end
