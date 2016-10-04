//
//  MDNavBar.h
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDView.h"

@interface MDNavBar : MDView

{
    UIView *statusBarView;
    
    CGFloat screenWidth;
    CGFloat screenHeight;
}

-(void)setupWithBackgroundColor:(UIColor *)color;

@end
