//
//  OSLabel.m
//  Doctory
//
//  Created by John Maher on 3/7/15.
//  Copyright (c) 2015 John Maher. All rights reserved.
//

#import "OSLabel.h"

@implementation OSLabel

- (id)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
		self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
	}
	return self;
}

- (void)drawTextInRect:(CGRect)rect {
	[super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end
