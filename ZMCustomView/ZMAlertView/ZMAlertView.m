//
//  ZMAlertView.m
//  ZMCustomView
//
//  Created by ddapp on 17/2/25.
//  Copyright © 2017年 Hzming. All rights reserved.
//


/**屏幕高度*/
#define KVIEW_H [UIScreen mainScreen].bounds.size.height

/**屏幕宽度*/
#define KVIEW_W [UIScreen mainScreen].bounds.size.width

#import "ZMAlertView.h"


@interface ZMAlertView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) IBOutlet UIView *backView;


@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *leftTitle;

@property (nonatomic, strong) NSString *rightTitle;

@end


@implementation ZMAlertView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
}



+ (void)alertControllerAboveIn:(UIViewController *)controller title:(NSString *)title leftTitle:(NSString *)leftTitle leftEvent:(ZMAlertViewLeftEvent)leftEvent rightTitle:(NSString *)rightTitle rightEvent:(ZMAlertViewRightEvent)rightEvent
{
    ZMAlertView *alert = [[NSBundle mainBundle]loadNibNamed:@"ZMAlertView" owner:nil options:nil][0];
    
    alert.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);

    alert.title = title;
    alert.leftTitle = leftTitle;
    alert.rightTitle = rightTitle;
    
    alert.left = leftEvent;
    alert.right = rightEvent;
    
    [controller.view addSubview:alert];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    
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


- (IBAction)leftClick:(UIButton *)sender {
    
    if (self.left) {
        self.left();
    }
    [self removeFromSuperview];
    
}

- (IBAction)rightClick:(UIButton *)sender {
    if (self.right) {
        self.right();
    }
    [self removeFromSuperview];
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _titleLabel.text = title;
}


- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    
    [_leftButton setTitle:leftTitle forState:UIControlStateNormal];
}


- (void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
    
    [_rightButton setTitle:rightTitle forState:UIControlStateNormal];
    
}


@end
