//
//  RunningUser.m
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import "RunningUser.h"

static RunningUser *singelton_instance ;

@implementation RunningUser

@synthesize user ;

+(RunningUser*)getSingleton_instance {
    if (singelton_instance == nil) {
        singelton_instance = [[RunningUser alloc]init];
    }
    
    return singelton_instance ;
}




@end
