//
//  MDView.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/24/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDView.h"

@implementation MDView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.shadowRadius];
        self.layer.shadowPath = path.CGPath;
    }
    return self;
}

@end
