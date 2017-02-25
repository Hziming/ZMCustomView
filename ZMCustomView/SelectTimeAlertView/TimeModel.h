//
//  TimeModel.h
//  zmddm
//
//  Created by ddapp on 16/9/2.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import <Foundation/Foundation.h>





@interface TimeModel : NSObject


@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSMutableArray *subTitls;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, assign, getter=isSelected) BOOL selected;

- (instancetype)initWithTitle:(NSString *)title;

+ (NSArray *)getData;

@end
