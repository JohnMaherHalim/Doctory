//
//  FirstAidTableViewCell.m
//  Doctory
//
//  Created by John Maher on 3/8/15.
//  Copyright (c) 2015 John Maher. All rights reserved.
//

#import "FirstAidTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FirstAidTableViewCell

@synthesize FirstAidName ;

-(void)drawRect:(CGRect)rect {
	FirstAidName.layer.cornerRadius = 5.0 ;
	FirstAidName.clipsToBounds = YES; 
}

- (void)awakeFromNib {
	
	
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
