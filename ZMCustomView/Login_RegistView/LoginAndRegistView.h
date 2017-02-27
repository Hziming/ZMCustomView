//
//  LoginAndRegistView.h
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//



#import <UIKit/UIKit.h>

@protocol LoginAndRegistViewDelegate <NSObject>

@optional
- (void)loginSuccess;

@end


@interface LoginAndRegistView : UIView

@property (nonatomic, weak) id<LoginAndRegistViewDelegate> delegate;

+ (void)alertControllerAboveIn:(UIViewController<LoginAndRegistViewDelegate> *)controlle;

@end
