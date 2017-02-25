//
//  ShoppingCarAlertView.m
//  zmddm
//
//  Created by ddapp on 16/8/3.
//  Copyright © 2016年 Hzming. All rights reserved.
//
/**屏幕高度*/
#define KVIEW_H [UIScreen mainScreen].bounds.size.height

/**屏幕宽度*/
#define KVIEW_W [UIScreen mainScreen].bounds.size.width

#import "ShoppingCarAlertView.h"

@interface ShoppingCarAlertView()

@property (weak, nonatomic) IBOutlet UIView *backView;

@end


@implementation ShoppingCarAlertView

+ (void)alertControllerAboveIn:(UIViewController *)controller leftEvent:(ShoppingCarLeftEvent)leftEvent rightEvent:(ShoppingCarRightEvent)rightEvent
{
    
    ShoppingCarAlertView *alert = [[NSBundle mainBundle]loadNibNamed:@"ShoppingCarAlertView" owner:nil options:nil][0];
    
    alert.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);

    alert.left = leftEvent;
    alert.right = rightEvent;
    
    [controller.view addSubview:alert];
    
    //原始大小
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);

    //缩放
    alert.backView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    alert.backView.alpha = 0;
    
    /**
     *  usingSpringWithDamping：0-1 数值越小，弹簧振动效果越明显
     *  initialSpringVelocity ：数值越大，一开始移动速度越快
     */
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        alert.backView.transform = transform;
        alert.backView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}


- (void)awakeFromNib
{
//    //给视图添加阴影
//    [[self.backView layer] setShadowOffset:CGSizeMake(0, -6)]; // 阴影的范围
//    [[self.backView layer] setShadowRadius:2];                // 阴影扩散的范围控制
//    [[self.backView layer] setShadowOpacity:0.9];               // 阴影透明度
//    [[self.backView layer] setShadowColor:[UIColor grayColor].CGColor]; // 阴影的
    [super awakeFromNib];
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
}


- (IBAction)seeShoppingCarClick:(UIButton *)sender {
    
    if (self.left) {
        self.left();
    }
    [self removeFromSuperview];

}

- (IBAction)toGoAroundClick:(UIButton *)sender {

    if (self.right) {
        self.right();
    }
    [self removeFromSuperview];

}

- (IBAction)hiddenSelf:(UITapGestureRecognizer *)sender {
    
    [self removeFromSuperview];
}


- (IBAction)closeSelf:(UIButton *)sender {
    
    [self removeFromSuperview];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
