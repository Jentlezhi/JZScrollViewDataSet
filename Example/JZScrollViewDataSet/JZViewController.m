//
//  JZDateSetViewController.m
//  JZScrollViewDataSet_Example
//
//  Created by Jentle-Zhi on 2023/11/20.
//  Copyright © 2023 Jentle. All rights reserved.
//

#import "JZViewController.h"
#import "JZDateSetViewController.h"

@interface JZViewController ()

@end

@implementation JZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [UILabel new];
    label.text = @"点击屏幕跳转";
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    JZDateSetViewController *dataSetVC = [JZDateSetViewController new];
    [self.navigationController pushViewController:dataSetVC animated:YES];
}

@end
