//
//  LoginAndRegistView.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

/**屏幕高度*/
#define KVIEW_H [UIScreen mainScreen].bounds.size.height

/**屏幕宽度*/
#define KVIEW_W [UIScreen mainScreen].bounds.size.width

#import "LoginAndRegistView.h"
#import "UIView+CornerRadius.h"

@interface LoginAndRegistView ()

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UIButton *selectedLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectedRegistBtn;

@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *codeNum;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UILabel *hintLab;  //红色提示文字
@property (weak, nonatomic) IBOutlet UIButton *LoginOrRegistBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendCodeBtn;


//忘记密码
@property (weak, nonatomic) IBOutlet UIView *forgetBackView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum1;
@property (weak, nonatomic) IBOutlet UITextField *codeNum1;
@property (weak, nonatomic) IBOutlet UITextField *password1;
@property (weak, nonatomic) IBOutlet UIButton *sendCodeBtn1;

@end

@implementation LoginAndRegistView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];

}


+ (void)alertControllerAboveIn:(UIViewController<LoginAndRegistViewDelegate> *)controller
{
    LoginAndRegistView *alert = [[NSBundle mainBundle] loadNibNamed:@"LoginAndRegistView" owner:nil options:nil][0];
    
    [alert selectedLogingClick:alert.selectedLoginBtn];
    
    [alert goBackLoginclick:nil];
    
    alert.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);

    alert.delegate = controller;
    
    CGAffineTransform translates = CGAffineTransformTranslate(CGAffineTransformIdentity/*当前的状态*/, 0, 0);
    
    alert.backView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity,0,alert.height);
    
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        alert.backView.transform = translates;

    } completion:^(BOOL finished) {
        
    }];
    
    [controller.view.window addSubview:alert];

}


- (IBAction)selectedLogingClick:(UIButton *)sender {
    
    _selectedLoginBtn.selected = _selectedRegistBtn.selected = NO;
    
    sender.selected = YES;
    
    _LoginOrRegistBtn.selected = _selectedLoginBtn.isSelected;
    
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backView.height = _selectedLoginBtn.isSelected ? 431 - 58 : 431;
        _forgetPasswordBtn.alpha = _selectedRegistBtn.isSelected ? 0 : 1;

    } completion:^(BOOL finished) {
    }];
}


#pragma mark - 发送验证码
- (IBAction)sendCodeClick:(UIButton *)sender {
    
    
//    NSDictionary *parame = @{@"mobile" : _forgetPasswordBtn.isSelected ? _phoneNum1.text : _phoneNum.text};
    
//    [[NetworkHelper shareInstance] Get:K_User_SendCode parameter:parame inView:self success:^(id responseObject) {
//        
//        [SVProgressHUD showSuccessWithStatus:@"发送成功"];
////        启动倒计时
        [self performSelector:@selector(reflashGetKeyBt:) withObject:[NSNumber numberWithInt:60] afterDelay:0];
//
//        
//    } failure:^(NSError *error) {
//        sender.enabled = YES;
//
//    }];
    
}

//倒数
- (void)reflashGetKeyBt:(NSNumber *)second {

    if ([second integerValue] == 0) {
        [_sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_sendCodeBtn1 setTitle:@"获取验证码" forState:UIControlStateNormal];

        _sendCodeBtn.enabled = _sendCodeBtn1.enabled = YES;

    } else {
        _sendCodeBtn.enabled = _sendCodeBtn1.enabled = NO;

        NSInteger i = [second integerValue];

        [_sendCodeBtn setTitle:[NSString stringWithFormat:@"%lds后重获", i] forState:UIControlStateNormal];
        [_sendCodeBtn1 setTitle:[NSString stringWithFormat:@"%lds后重获", i] forState:UIControlStateNormal];

        [self performSelector:@selector(reflashGetKeyBt:) withObject:[NSNumber numberWithInteger:i - 1] afterDelay:1];
    }
    
}

- (IBAction)loginOrRegistClick:(UIButton *)sender {
    
    sender.isSelected ? [self login] : [self regist];
    
}

- (void)login{
    
//    NSDictionary *parame = @{@"mobile" : _phoneNum.text,
//                             @"pwd" : _password.text};
//    [[NetworkHelper shareInstance] Get:K_User_Login parameter:parame inView:self success:^(id responseObject) {
//        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
//        //获取cookie
//        NSString *url = [NSString stringWithFormat:@"%@%@", KAPI_front, K_User_Login];
//        [UserInfoManager saveUserInfoWith:responseObject[@"user"] url:url];
//        
//        NSString *urlPath = [NSString stringWithFormat:@"%@%@",KAPI_LCP_Front, K_URL_getUserid];
//        
//        [AnalysisTool postLCPGourseDataSourceWithUrlString:urlPath parameters:nil succse:^(NSDictionary *dict) {
//            if ([dict[@"code"] integerValue] == 200) {
//                [K_USER_DEFAULTS setObject:dict[@"result"][@"uuid"] forKey:K_stockUserId];
//            }
            if ([self.delegate respondsToSelector:@selector(loginSuccess)]) {
                [self.delegate loginSuccess];
            }
            [self close:nil];
//        } failure:^(NSError *error) {
//        }];
//
//        
//        if (![[K_USER_DEFAULTS objectForKey:K_Id] isEqualToString:[K_USER_DEFAULTS objectForKey:K_Last_Id]]) {
//            [K_NotificationCenter postNotificationName:KNeedReloadData object:nil];
//        }
//        
//    } failure:^(NSError *error) {
//        
//    }];
    
}


- (void)regist{
    
//    NSDictionary *parame = @{@"mobile" : _phoneNum.text,
//                             @"pwd" : _password.text,
//                             @"pwd2" : _password.text,
//                             @"randCode" : _codeNum.text};
//    [[NetworkHelper shareInstance] Get:K_User_Regist parameter:parame inView:self success:^(id responseObject) {
//        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        [self login];
//
//
//    } failure:^(NSError *error) {
//        
//        
//    }];
    
}

#pragma mark -忘记密码
- (IBAction)forgetPasswordClick:(UIButton *)sender {
    _forgetPasswordBtn.selected = YES;
    
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        _forgetBackView.left = 0;
        
    } completion:^(BOOL finished) {
    }];

}

#pragma mark -返回登录页
- (IBAction)goBackLoginclick:(UIButton *)sender {
    
    _forgetPasswordBtn.selected = NO;

    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        _forgetBackView.left = _forgetBackView.width;
        
    } completion:^(BOOL finished) {
    }];
    
}

#pragma mark -完成（忘记密码）
- (IBAction)okClcik:(UIButton *)sender {
    
//    NSDictionary *parame = @{@"mobile" : _phoneNum1.text,
//                             @"pwd" : _password1.text,
//                             @"pwd2" : _password1.text,
//                             @"randCode" : _codeNum1.text};
//    [[NetworkHelper shareInstance] Get:K_User_PwdForgetChange parameter:parame inView:self success:^(id responseObject) {
//        
//        [SVProgressHUD showSuccessWithStatus:@"密码修改成功"];
        [self goBackLoginclick:nil];
        _phoneNum.text = _phoneNum1.text;
//
//    } failure:^(NSError *error) {
//        
//        
//    }];
    
}

- (IBAction)userAgreementClick:(UIButton *)sender {
    
  //用户协议
    NSLog(@"用户协议");
}





- (IBAction)close:(UIButton *)sender {
    
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
