//
//  SelectTimeAlertView.m
//  zmddm
//
//  Created by ddapp on 16/8/13.
//  Copyright © 2016年 Hzming. All rights reserved.
//

/**屏幕高度*/
#define KVIEW_H [UIScreen mainScreen].bounds.size.height

/**屏幕宽度*/
#define KVIEW_W [UIScreen mainScreen].bounds.size.width

#import "SelectTimeAlertView.h"
#import "UIView+CornerRadius.h"
@interface SelectTimeAlertView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) TimeModel *model;

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;

@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property (weak, nonatomic) IBOutlet UIView *backView;


@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SelectTimeAlertView


+ (void)alertControllerAboveIn:(UIViewController *)controller refId:(NSInteger)refId returnTimeEvent:(ReturnTime)returnTimeEvent;
{
    SelectTimeAlertView *alert = [[NSBundle mainBundle]loadNibNamed:@"SelectTimeAlertView" owner:nil options:nil][0];
    alert.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);
    
    alert.refId = refId;
    
    alert.returnTime = returnTimeEvent;
    
    [alert requestData];
    
    [controller.view addSubview:alert];
    
    CGAffineTransform translates = CGAffineTransformTranslate(CGAffineTransformIdentity/*当前的状态*/, 0, 0);
    
    alert.backView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity,0,alert.backView.height);
    
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        alert.backView.transform = translates;
        
    } completion:^(BOOL finished) {
        
    }];

}



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;

    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
}


- (void)requestData{

    self.dataSource = [TimeModel getData];
    
    self.model = [[TimeModel getData] firstObject];
    
    [self.leftTableView reloadData];
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];

    
    [self.rightTableView reloadData];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([tableView isEqual:self.leftTableView]) {
        return self.dataSource.count;
    } else if ([tableView isEqual:self.rightTableView]){
    
        return self.model.subTitls.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if ([tableView isEqual:self.leftTableView]) {
    
        TimeModel *model = self.dataSource[indexPath.row];
        NSLog(@"%@", model.isSelected ? @"YES" : @"NO");

        UITableViewCell *left = [self.leftTableView dequeueReusableCellWithIdentifier:@"left"];
        
        if (!left) {
            left = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"left"];
        }
        
        left.highlighted = model.isSelected;
        
        left.textLabel.text = model.title;
        
        return left;
    } else
//        if ([tableView isEqual:self.rightTableView])
        {
    
        UITableViewCell *right = [self.rightTableView dequeueReusableCellWithIdentifier:@"right"];
        
        if (!right) {
            right = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"right"];
        }
        
        right.textLabel.text = self.model.subTitls[indexPath.row];
        
        return right;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.leftTableView]) {
        
        for (TimeModel *model in _dataSource) {
            model.selected = NO;
        }
        
        self.model = _dataSource[indexPath.row];
        self.model.selected = YES;
        
        [self.rightTableView reloadData];
        [self.rightTableView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    } else if ([tableView isEqual:self.rightTableView]){
        
        NSDictionary *paramet = [self setupParameterWithIndexPath:indexPath];
        
#warning 向后台请求实际邮费~~  后台接口保密   就随便写了个 5.8
//        [[NetworkHelper shareInstance] Get:K_Account_UrgentCount parameter:paramet inView:self success:^(id responseObject) {
        
//
            NSString *timeStr = [NSString stringWithFormat:@"%@%@", self.model.title, self.model.subTitls[indexPath.row]];
//
            if (self.returnTime) {
                
//[responseObject[@"urgentAmount"] floatValue]
                self.returnTime(timeStr, 5.8f/*后台返回来的邮费*/, paramet);
            }
//
            [self removeFromSuperview];
//        } failure:^(NSError *error) {
//            
//        }];

    }
}


//设置请求参数
- (NSDictionary *)setupParameterWithIndexPath:(NSIndexPath *)indexPath
{
    static NSDateFormatter *formatter;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *strDate = [formatter stringFromDate:self.model.date];
    
    NSString *hour = [self.model.subTitls[indexPath.row] substringWithRange:NSMakeRange(0, 2)];
    
    NSDictionary *dic = @{@"areaIds":@(_refId),
                          @"date":strDate,
                          @"hour":hour};
    
    return dic;
}


- (IBAction)cancel:(UIButton *)sender {
    
    [self removeFromSuperview];

}

@end
