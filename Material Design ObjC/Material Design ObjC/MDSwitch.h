//
//  MDSwitch.h
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDView.h"

@interface MDSwitch : UIButton

{
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    MDView *switchView;
    UIView *barView;
    UIColor *onColor;
    BOOL isOn;
    BOOL isAnimating;
}

-(void)setup:(UIColor *)withColor shouldBeOn:(BOOL)shouldBeOn;

@end
