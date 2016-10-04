//
//  MDTextField.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/24/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDTextField.h"

@implementation MDTextField

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
        
        textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        textField.textColor = [UIColor blackColor];
        textField.font = [UIFont fontWithName:@"Roboto-Bold" size:20.0];
        textField.enabled = NO;
        textField.delegate = self;
        [self addSubview:textField];
        
        tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        tapView.layer.masksToBounds = YES;
        tapView.userInteractionEnabled = YES;
        [self addSubview:tapView];
    }
    return self;
}

-(void)setup:(UIColor*)withBackgroundColor withPlaceholder:(NSString*)withPlaceholder withTextColor:(UIColor*)withTextColor {
    self.backgroundColor = withBackgroundColor;
    placeholderLabel = [[MDPlaceholderLabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [placeholderLabel setup:withPlaceholder withTextColor:[[UIColor grayColor] colorWithAlphaComponent:0.75]];
    [self addSubview:placeholderLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!isShowingTap) {
        isShowingTap = YES;
        textField.enabled = YES;
        if (!textField.isFirstResponder) {
            [textField becomeFirstResponder];
        }
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:self];
        
        double duration = 0.75;
        UIView *tapShadowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height/2, self.frame.size.height/2)];
        tapShadowView.center = location;
        tapShadowView.backgroundColor = [UIColor blackColor];
        tapShadowView.alpha = 0.3;
        tapShadowView.layer.masksToBounds = YES;
        tapShadowView.layer.cornerRadius = tapShadowView.frame.size.width/2;
        [tapView addSubview:tapShadowView];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            [UIView animateWithDuration:duration animations:^{
                tapShadowView.alpha = 0;
            } completion:^(BOOL finished) {
                isShowingTap = NO;
                [tapShadowView removeFromSuperview];
            }];
        }];
        CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        transformAnim.duration = duration;
        transformAnim.fromValue = @0.1;
        transformAnim.toValue = @((self.frame.size.width/tapShadowView.frame.size.width)*2.25);
        transformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transformAnim.fillMode = kCAFillModeForwards;
        transformAnim.removedOnCompletion = NO;
        [tapShadowView.layer addAnimation:transformAnim forKey:@"transform.scale"];
        [CATransaction commit];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newStr = textField.text;
    if (string.length == 1) {
        newStr = [NSString stringWithFormat:@"%@%@", newStr, string];
    } else {
        newStr = [newStr substringToIndex:newStr.length-1];
    }
    if (newStr.length == 1 && string.length == 1) {
        [UIView animateWithDuration:0.5 animations:^{
            self.layer.masksToBounds = NO;
            placeholderLabel.transform = CGAffineTransformMakeScale(0.6, 0.6);
            placeholderLabel.frame = CGRectMake(0, -placeholderLabel.frame.size.height/2, placeholderLabel.frame.size.width, placeholderLabel.frame.size.height);
        }];
    } else if (newStr.length == 0) {
        self.layer.masksToBounds = YES;
        [UIView animateWithDuration:0.5 animations:^{
            placeholderLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
            placeholderLabel.frame = CGRectMake(0, 0, placeholderLabel.frame.size.width, placeholderLabel.frame.size.height);
        }];
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    textField.enabled = NO;
    return YES;
}

@end
