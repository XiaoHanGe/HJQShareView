//
//  ViewController.m
//  TestForShareView
//
//  Created by 韩俊强 on 16/5/5.
//  Copyright © 2016年 韩俊强. All rights reserved.
//

#import "ViewController.h"
#import "HJQShareView.h"
@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) HJQShareView *activityView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"点我" forState:UIControlStateNormal];
    [self.button sizeToFit];
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view setNeedsUpdateConstraints];
    
}
- (void)updateViewConstraints
{
    [super updateViewConstraints];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.view addConstraint:constraint];
    
}

- (void)addButtonClicked:(UIButton *)button
{
    ButtonView *bv = [[ButtonView alloc]initWithText:@"新浪微博" image:[UIImage imageNamed:@"share_platform_sina"] handler:^(ButtonView *buttonView){
        NSLog(@"点击新增的新浪微博");
    }];
    [self.activityView addButtonView:bv];
}

- (void)buttonClicked:(UIButton *)button
{
    if (!self.activityView) {
        self.activityView = [[HJQShareView alloc]initWithTitle:@"分享到" referView:self.view];
        
        //横屏会变成一行6个, 竖屏无法一行同时显示6个, 会自动使用默认一行4个的设置.
        self.activityView.numberOfButtonPerLine = 6;
        
        ButtonView *bv = [[ButtonView alloc]initWithText:@"微信好友" image:[UIImage imageNamed:@"share_platform_wechat"] handler:^(ButtonView *buttonView){
            NSLog(@"点击微信好友");
        }];
        [self.activityView addButtonView:bv];
        
        bv = [[ButtonView alloc]initWithText:@"朋友圈" image:[UIImage imageNamed:@"share_platform_wechattimeline"] handler:^(ButtonView *buttonView){
            NSLog(@"点击微信朋友圈");
        }];
        [self.activityView addButtonView:bv];
        
        bv = [[ButtonView alloc]initWithText:@"qq好友" image:[UIImage imageNamed:@"share_platform_qqfriends"] handler:^(ButtonView *buttonView){
            NSLog(@"点击qq好友");
        }];
        [self.activityView addButtonView:bv];
        
        bv = [[ButtonView alloc]initWithText:@"qq空间" image:[UIImage imageNamed:@"share_platform_qqspace"] handler:^(ButtonView *buttonView){
            NSLog(@"点击QQ空间");
        }];
        [self.activityView addButtonView:bv];
        
        bv = [[ButtonView alloc]initWithText:@"微博" image:[UIImage imageNamed:@"share_platform_sina"] handler:^(ButtonView *buttonView){
            NSLog(@"点击新浪微博");
        }];
        [self.activityView addButtonView:bv];
        
        bv = [[ButtonView alloc]initWithText:@"采购圈" image:[UIImage imageNamed:@"share_platform_purchasingcicle"] handler:^(ButtonView *buttonView){
            NSLog(@"点击采购圈");
        }];
        [self.activityView addButtonView:bv];
        
    }
    
    [self.activityView show];
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
