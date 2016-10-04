//
//  MDNavButton.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDNavButton.h"

@implementation MDNavButton

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.shadowOpacity = 0.0;
    }
    return self;
}

-(void)setup:(UIColor *)withBackgroundColor withText:(NSString *)withText withTextColor:(UIColor *)withTextColor {
    [super setup:withBackgroundColor withText:withText withTextColor:withTextColor];
}

@end
