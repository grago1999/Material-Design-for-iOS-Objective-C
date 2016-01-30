//
//  MDRoundButton.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDRoundButton.h"

@implementation MDRoundButton

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = self.frame.size.width/2;
        self.layer.shadowRadius = self.frame.size.width/2;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.shadowRadius].CGPath;
        tapView.layer.cornerRadius = self.layer.cornerRadius;
    }
    return self;
}

-(void)setup:(UIColor *)withBackgroundColor withText:(NSString *)withText withTextColor:(UIColor *)withTextColor {
    [super setup:withBackgroundColor withText:withText withTextColor:withTextColor];
}

@end
