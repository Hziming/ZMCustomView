//
//  TimeModel.m
//  zmddm
//
//  Created by ddapp on 16/9/2.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import "TimeModel.h"
#import "NSDate+YYAdd.h"
@implementation TimeModel


- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    
    if (self) {
        _title = title;
        _selected = NO;
        _subTitls = [NSMutableArray array];
    }
    
    return self;
}



+ (NSArray *)getData{
    
    NSDate *today = [NSDate date];
    
    NSInteger todayHour = today.hour;
    
    NSMutableArray *models = [NSMutableArray array];

    if (todayHour < 16) {  //如果还未到 16：00   显示今天的内容
        
        NSString *title1 = [NSString stringWithFormat:@"今天(%@)",[self weekDay:today]];
        TimeModel *model1 = [[TimeModel alloc] initWithTitle:title1];
        model1.date = today;
        model1.selected = YES;
        NSInteger i = todayHour % 2 == 0 ? (todayHour + 2) : (todayHour + 3);
        for (NSInteger j = i; j  <= 18; j += 2) {
            [model1.subTitls addObject:[NSString stringWithFormat:@"%02ld:00-%02ld:00", j, j + 2]];
        }

        [models addObject:model1];


        NSArray *arr = @[@"明天", @"后天"];
        for (NSInteger i = 0; i < arr.count; i ++) {
            NSString *title = [NSString stringWithFormat:@"%@(%@)",arr[i], [self weekDay:[today dateByAddingDays:i + 1]]];
            TimeModel *model = [[TimeModel alloc] initWithTitle:title];
            model.date = [today dateByAddingDays:i];
            model.selected = i == 0;
            for (NSInteger j = 8; j  <= 18; j += 2) {
                [model.subTitls addObject:[NSString stringWithFormat:@"%02ld:00-%02ld:00", j, j + 2]];
            }
            [models addObject:model];
        }
        
        
    } else {
    
        NSArray *arr = @[@"明天", @"后天", @"大后天"];
        for (NSInteger i = 0; i < arr.count; i ++) {
            NSString *title = [NSString stringWithFormat:@"%@(%@)",arr[i], [self weekDay:[today dateByAddingDays:i + 1]]];
            TimeModel *model = [[TimeModel alloc] initWithTitle:title];
            model.date = [today dateByAddingDays:i];
            model.selected = i == 0;
            for (NSInteger j = 8; j  <= 18; j += 2) {
                [model.subTitls addObject:[NSString stringWithFormat:@"%02ld:00-%02ld:00", j, j + 2]];
            }
            [models addObject:model];
            
        }
    }
    return models;

}


+ (NSString *)weekDay:(NSDate *)date{

    switch (date.weekday) {
        case 1:
            return @"周日";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;

        default:
            return nil;
            break;
    }
    
}



@end
