//
//  ViewController.h
//  ZMCustomView
//
//  Created by ddapp on 17/2/25.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginAndRegistView.h"

//假如 ViewController 是父类
@interface ViewController : UIViewController<LoginAndRegistViewDelegate>

- (void)requestData;

- (void)addLoginAndRegistView;

- (void)loginSuccess;


@end

