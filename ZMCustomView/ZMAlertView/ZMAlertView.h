//
//  ZMAlertView.h
//  ZMCustomView
//
//  Created by ddapp on 17/2/25.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZMAlertViewLeftEvent)();
typedef void (^ZMAlertViewRightEvent)();

@interface ZMAlertView : UIView


@property (nonatomic, copy) ZMAlertViewLeftEvent left;

@property (nonatomic, copy) ZMAlertViewRightEvent right;


/**
 *  IdentityAuthenticationAlertView
 *
 *  @param controller 要显示在哪个控制器上
 *  @param title      标题
 *  @param leftTitle  左边按钮文字
 *  @param rightTitle 右边按钮文字
 *  @param leftEvent  左边按钮执行的Block
 *  @param rightEvent 右边按钮执行的Block
 */
+ (void)alertControllerAboveIn:(UIViewController *)controller title:(NSString *)title leftTitle:(NSString *)leftTitle leftEvent:(ZMAlertViewLeftEvent)leftEvent rightTitle:(NSString *)rightTitle rightEvent:(ZMAlertViewRightEvent)rightEvent;



@end
