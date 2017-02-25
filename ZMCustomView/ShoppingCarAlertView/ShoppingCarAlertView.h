//
//  ShoppingCarAlertView.h
//  zmddm
//
//  Created by ddapp on 16/8/3.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ShoppingCarLeftEvent)();
typedef void (^ShoppingCarRightEvent)();


@interface ShoppingCarAlertView : UIView


@property (nonatomic, copy) ShoppingCarLeftEvent left;

@property (nonatomic, copy) ShoppingCarRightEvent right;

+ (void)alertControllerAboveIn:(UIViewController *)controller leftEvent:(ShoppingCarLeftEvent)leftEvent rightEvent:(ShoppingCarRightEvent)rightEvent;


@end

