//
//  MDLabel.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/24/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDLabel.h"

@implementation MDLabel

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)setup:(NSString*)withText withTextColor:(UIColor*)withTextColor {
    self.text = withText;
    self.textColor = withTextColor;
    self.font = [UIFont fontWithName:@"Roboto-Bold" size:20.0];
}

@end
