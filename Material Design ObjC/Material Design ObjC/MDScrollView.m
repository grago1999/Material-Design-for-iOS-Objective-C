//
//  MDScrollView.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDScrollView.h"

@implementation MDScrollView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.shadowRadius].CGPath;
    }
    return self;
}

@end
