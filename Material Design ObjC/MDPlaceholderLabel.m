//
//  MDPlaceholderLabel.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/24/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDPlaceholderLabel.h"

@implementation MDPlaceholderLabel

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = FALSE;
        self.layer.shadowColor = [UIColor clearColor].CGColor;
        self.layer.shadowOpacity = 0.0;
        self.textAlignment = NSTextAlignmentLeft;
        self.font = [UIFont fontWithName:@"Roboto-Bold" size:20.0];
    }
    return self;
}

-(void)setup:(NSString *)withText withTextColor:(UIColor *)withTextColor {
    [super setup:withText withTextColor:withTextColor];
}

@end
