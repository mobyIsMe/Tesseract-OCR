//
//  ResultViewController.m
//  Template Framework Project
//
//  Created by HD on 16/6/17.
//  Copyright © 2016年 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import "ResultViewController.h"

@implementation ResultViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"识别结果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 定义导航栏右边按钮
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"返回主页面" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    
    
    UILabel *label = [[UILabel alloc] init];
    label.text = self.resultString;
    label.frame = CGRectMake(0, 100, self.view.frame.size.width, 60);
    label.textColor = [UIColor purpleColor];
    label.textAlignment = NSTextAlignmentCenter;
    // 多行显示需要设置下面两个属性
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:label];
}


- (void)back:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
