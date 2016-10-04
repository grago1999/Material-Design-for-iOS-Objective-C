//
//  ViewController.m
//  Material Design ObjC
//
//  Created by Gianluca Rago on 1/23/16.
//  Copyright © 2016 Ragoware LLC. All rights reserved.
//

#import "ViewController.h"
#import "MDView.h"
#import "MDLabel.h"
#import "MDTextField.h"
#import "MDNavBar.h"
#import "MDNavButton.h"
#import "MDNavLabel.h"
#import "MDScrollView.h"
#import "MDButton.h"
#import "MDRoundButton.h"
#import "MDSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    mainColor = [UIColor colorWithRed:83.0/255.0 green:109.0/255.0 blue:254.0/255.0 alpha:1.0];
    
    MDScrollView *mdScrollView = [[MDScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [self.view addSubview:mdScrollView];
    
    MDNavBar *navBar = [[MDNavBar alloc]initWithFrame:CGRectZero];
    [navBar setupWithBackgroundColor:mainColor];
    [self.view addSubview:navBar];
    
    CGFloat navBtnSize = navBar.frame.size.height/2;
    MDNavButton *navBtn = [[MDNavButton alloc]initWithFrame:CGRectMake(0, 0, navBtnSize, navBtnSize)];
    navBtn.center = CGPointMake(navBar.frame.size.height/2, navBar.frame.size.height/2);
    [navBtn setup:[UIColor clearColor] withText:@"" withTextColor:[UIColor clearColor]];
    [navBtn setImage:[UIImage imageNamed:@"nav.png"] forState:UIControlStateNormal];
    [navBar addSubview:navBtn];
    
    MDNavLabel *mdNavLabel = [[MDNavLabel alloc]initWithFrame:CGRectMake(navBtn.frame.origin.x+(1.5*navBtnSize), 0, screenWidth/2, screenHeight/10)];
    [mdNavLabel setup:@"Home" withTextColor:[UIColor whiteColor]];
    [navBar addSubview:mdNavLabel];
    
    MDView *mdView = [[MDView alloc]initWithFrame:CGRectMake(0, (screenHeight/20)+navBar.frame.size.height, screenWidth, screenHeight/2.5)];
    [mdScrollView addSubview:mdView];
    
    CGFloat distInView = mdView.frame.size.height/8;
    
    MDLabel *mdLabel = [[MDLabel alloc]initWithFrame:CGRectMake(0, distInView/2, screenWidth, screenHeight/16)];
    [mdLabel setup:@"Form" withTextColor:[UIColor blackColor]];
    [mdView addSubview:mdLabel];
    
    MDTextField *mdTextField = [[MDTextField alloc]initWithFrame:CGRectMake(0, mdLabel.frame.origin.y+mdLabel.frame.size.height+distInView, screenWidth/2, screenHeight/12)];
    mdTextField.center = CGPointMake(screenWidth/2, mdTextField.center.y);
    [mdTextField setup:[UIColor whiteColor] withPlaceholder:@"Enter Something" withTextColor:[UIColor blackColor]];
    [mdView addSubview:mdTextField];
    
    MDButton *mdRaisedBtn = [[MDButton alloc]initWithFrame:CGRectMake(0, mdTextField.frame.origin.y+mdTextField.frame.size.height+distInView, screenWidth/2, screenHeight/14)];
    mdRaisedBtn.center = CGPointMake(screenWidth/2, mdRaisedBtn.center.y);
    [mdRaisedBtn setup:mainColor withText:@"Tap me!" withTextColor:[UIColor whiteColor]];
    [mdView addSubview:mdRaisedBtn];
    
    MDSwitch *mdSwitch = [[MDSwitch alloc]initWithFrame:CGRectMake(0, mdView.frame.origin.y+mdView.frame.size.height+(screenHeight/20), 0, 0)];
    mdSwitch.center = CGPointMake(screenWidth/2, mdSwitch.center.y);
    [mdSwitch setup:mainColor shouldBeOn:NO];
    [mdScrollView addSubview:mdSwitch];
    
    CGFloat distFromEdge = screenWidth/16;
    CGFloat createBtnSize = screenWidth/7;
    MDRoundButton *createBtn = [[MDRoundButton alloc]initWithFrame:CGRectMake(screenWidth-createBtnSize-distFromEdge, screenHeight-createBtnSize-distFromEdge, createBtnSize, createBtnSize)];
    [createBtn setup:mainColor withText:@"+" withTextColor:[UIColor whiteColor]];
    [self.view addSubview:createBtn];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
