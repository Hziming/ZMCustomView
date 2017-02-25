//
//  SelectTimeAlertView.h
//  zmddm
//
//  Created by ddapp on 16/8/13.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeModel.h"



typedef void (^ReturnTime)(NSString *time, CGFloat urgentAmount, NSDictionary *dic);


@interface SelectTimeAlertView : UIView


@property (nonatomic, copy) ReturnTime returnTime;

@property (nonatomic, assign) NSInteger refId;


+ (void)alertControllerAboveIn:(UIViewController *)controller refId:(NSInteger)refId returnTimeEvent:(ReturnTime)returnTimeEvent;

@end
