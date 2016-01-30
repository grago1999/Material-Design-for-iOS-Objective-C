//
//  MDButton.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDButton.h"

@implementation MDButton

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = self.layer.cornerRadius;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.shadowRadius].CGPath;
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        tapView.layer.masksToBounds = YES;
        tapView.userInteractionEnabled = NO;
        [self addSubview:tapView];
        
    }
    return self;
}

-(void)setup:(UIColor *)withBackgroundColor withText:(NSString *)withText withTextColor:(UIColor *)withTextColor {
    self.backgroundColor = withBackgroundColor;
    [self setTitle:withText forState:UIControlStateNormal];
    [self setTitleColor:withTextColor forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont fontWithName:@"Roboto-Medium" size:20.0]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!isShowingTap) {
        isShowingTap = YES;
        
        double duration = 0.75;
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:self];
        
        UIView *tapShadowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height/2, self.frame.size.height/2)];
        tapShadowView.center = location;
        tapShadowView.backgroundColor = [UIColor blackColor];
        tapShadowView.alpha = 0.3;
        tapShadowView.layer.masksToBounds = YES;
        tapShadowView.layer.cornerRadius = tapShadowView.frame.size.width/2;
        [tapView addSubview:tapShadowView];
        
        CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        transformAnim.duration = duration;
        transformAnim.fromValue = @0.1;
        transformAnim.toValue = @((self.frame.size.width/tapShadowView.frame.size.width)*2.25);
        transformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transformAnim.fillMode = kCAFillModeForwards;
        transformAnim.removedOnCompletion = NO;
        [tapShadowView.layer addAnimation:transformAnim forKey:@"transform.scale"];
        [CATransaction begin];
        
        double delay = (duration*0.75)*NSEC_PER_SEC;
        double dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay);
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.2 animations:^{
                tapShadowView.alpha = 0;
            } completion:^(BOOL finished) {
                isShowingTap = NO;
                [tapShadowView removeFromSuperview];
            }];
        });
    }
}

@end
