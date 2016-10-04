//
//  MDButton.h
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/29/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDButton : UIButton

{
    UIView *tapView;
    BOOL isShowingTap;
}

-(void)setup:(UIColor *)withBackgroundColor withText:(NSString *)withText withTextColor:(UIColor *)withTextColor;

@end
