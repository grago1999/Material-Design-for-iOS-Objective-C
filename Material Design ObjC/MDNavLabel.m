//
//  MDNavLabel.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/24/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "MDNavLabel.h"

@implementation MDNavLabel

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

@end
