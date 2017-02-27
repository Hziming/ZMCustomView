//
//  UserInfoViewController.m
//  ZMCustomView
//
//  Created by ddapp on 17/2/27.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "UserInfoViewController.h"
#import "LoginAndRegistView.h"
@interface UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *isLoginBtn;
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)requestData
{
    _isLoginBtn.selected = !_isLoginBtn.isSelected;

    _label.text = _isLoginBtn.isSelected ? @"登录后显示的界面" : @"未登录显示的界面";
    //刷新tableview操作  刷新UI
}


- (IBAction)loginClick:(UIButton *)sender {
    //判断是否登录
    sender.isSelected ? [self requestData]: [self addLoginAndRegistView];
}

/*
 
如果有其他操作  重写父类实现的代理方法
- (void)loginSuccess{

 
    界面跳转之类的
}
 */



@end
