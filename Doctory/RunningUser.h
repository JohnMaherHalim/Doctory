//
//  RunningUser.h
//  Doctory
//
//  Created by John Maher on 3/18/14.
//  Copyright (c) 2014 John Maher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface RunningUser : NSObject


@property (nonatomic , retain) User *user ;

+(RunningUser*)getSingleton_instance;

@end
