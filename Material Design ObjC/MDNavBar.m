//
//  MDNavBar.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDNavBar.h"

@implementation MDNavBar

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        screenWidth = [UIScreen mainScreen].bounds.size.width;
        screenHeight = [UIScreen mainScreen].bounds.size.height;
        
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        self.frame = CGRectMake(0, statusBarHeight, screenWidth, (screenHeight/10));
        
        statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, -statusBarHeight, screenWidth, statusBarHeight)];
        [self addSubview:statusBarView];
    }
    return self;
}

-(void)setupWithBackgroundColor:(UIColor *)color {
    self.backgroundColor = color;
    statusBarView.backgroundColor = [color colorWithAlphaComponent:0.8];
}

@end
