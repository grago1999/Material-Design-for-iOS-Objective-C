//
//  MDTextField.h
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/24/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDPlaceholderLabel.h"

@interface MDTextField : UIView <UITextFieldDelegate>

{
    UITextField *textField;
    MDPlaceholderLabel *placeholderLabel;
    
    UIView *tapView;
    BOOL isShowingTap;
}

-(void)setup:(UIColor*)withBackgroundColor withPlaceholder:(NSString*)withPlaceholder withTextColor:(UIColor*)withTextColor;

@end
