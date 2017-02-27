//
//  ViewController.m
//  ZMCustomView
//
//  Created by ddapp on 17/2/25.
//  Copyright © 2017年 Hzming. All rights reserved.
//



#import "ViewController.h"

#import "ShoppingCarAlertView.h"
#import "SelectTimeAlertView.h"
#import "ZMAlertView.h"
#import "ZMPhotoView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)requestData{
    
    //请求数据，  获取本地数据 等等。。。
    //然后刷新数据。
    
}


- (void)addLoginAndRegistView
{
    [LoginAndRegistView alertControllerAboveIn:self];
}


#pragma mark - LoginAndRegistViewDelegate
- (void)loginSuccess
{
    [self requestData];
}




- (IBAction)ShoppingCarAlertViewClcik:(UIButton *)sender {
    
    
    __weak typeof(self)weakself = self;
    
    [ShoppingCarAlertView alertControllerAboveIn:self leftEvent:^{
        weakself.testLabel.text = @"查看购物车";
    } rightEvent:^{
        weakself.testLabel.text = @"再去逛逛";
    }];
}



- (IBAction)SelectTimeAlertViewClick:(UIButton *)sender {
    
    __weak typeof(self)weakself = self;

    //后台是根据  refId 来计算邮费的 就随意写一个。。
    [SelectTimeAlertView alertControllerAboveIn:self refId:2 returnTimeEvent:^(NSString *time, CGFloat urgentAmount, NSDictionary *dic) {
        
        NSLog(@"\n 时间 - %@ \n 邮费 - %f \n 参数 - %@", time, urgentAmount, dic);
        weakself.testLabel.text = [NSString stringWithFormat:@"时间 - %@ \n 邮费 - %.2f元  ", time, urgentAmount];

    }];
}

- (IBAction)shouAlertViewClick:(UIButton *)sender {
    
    __weak typeof(self)weakself = self;

    [ZMAlertView alertControllerAboveIn:self title:@"确定要删除此商品吗？" leftTitle:@"取消" leftEvent:^{
        
        weakself.testLabel.text = @"取消";

    } rightTitle:@"确定" rightEvent:^{
        weakself.testLabel.text = @"确定";

    }];
    
}


- (IBAction)touchPhoto:(UITapGestureRecognizer *)sender {
    
    //用对象方法 实现也行~~~~~
    [[ZMPhotoView shareInstance] alertControllerAboveIn:self imageView:(UIImageView *)sender.view];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
