//
//  ViewController.m
//  DMLoadingViewDemo
//
//  Created by 李二狗 on 2017/7/18.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "DMLoadingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DMLoadingView showNoNetWorkWithSuperView:self.view pressedBlock:^(UIButton *button) {
        NSLog(@"hello");
        [DMLoadingView showLoadingWithSuperView:self.view];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
