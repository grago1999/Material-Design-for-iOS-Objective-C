//
//  MDSwitch.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDSwitch.h"

@implementation MDSwitch

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        screenWidth = [UIScreen mainScreen].bounds.size.width;
        screenHeight = [UIScreen mainScreen].bounds.size.height;
        
        onColor = [UIColor clearColor];
        CGFloat width = screenWidth/5;
        CGFloat height = width/1.4;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat barViewWidth = screenWidth/12;
        CGFloat barViewHeight = barViewWidth/2.5;
        
        barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, barViewWidth, barViewHeight)];
        barView.center = CGPointMake(width/2, height/2);
        barView.layer.cornerRadius = barView.frame.size.height/2;
        barView.backgroundColor = onColor;
        barView.userInteractionEnabled = NO;
        [self addSubview:barView];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        btn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(switchState) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.zPosition = 2;
        [self addSubview:btn];
    }
    return self;
}

-(void)setup:(UIColor *)withColor shouldBeOn:(BOOL)shouldBeOn {
    onColor = withColor;
    
    switchView = [[MDView alloc]initWithFrame:CGRectMake(0, 0, barView.frame.size.height*1.5, barView.frame.size.height*1.5)];
    switchView.layer.cornerRadius = switchView.frame.size.width/2;
    switchView.layer.zPosition = -1;
    switchView.userInteractionEnabled = NO;
    if (isOn) {
        switchView.center = CGPointMake(barView.frame.origin.x, self.frame.size.height/2);
        switchView.backgroundColor = onColor;
        barView.backgroundColor = [onColor colorWithAlphaComponent:0.8];
    } else {
        switchView.center = CGPointMake(barView.frame.size.width, self.frame.size.height/2);
        switchView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.85];
        barView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.7];
    }
    [self addSubview:switchView];
}

-(void)switchState {
    if (!isAnimating) {
        isAnimating = YES;
        isOn = !isOn;
        [UIView animateWithDuration:0.5 animations:^{
            if (isOn) {
                switchView.center = CGPointMake(barView.frame.origin.x+barView.frame.size.width, self.frame.size.height/2);
                switchView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.85];
                barView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.7];
            } else {
                switchView.center = CGPointMake(barView.frame.origin.x, self.frame.size.height/2);
                switchView.backgroundColor = onColor;
                barView.backgroundColor = [onColor colorWithAlphaComponent:0.8];
            }
        } completion:^(BOOL finished) {
            isAnimating = NO;
        }];
    }
}

@end
