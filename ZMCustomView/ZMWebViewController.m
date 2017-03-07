//
//  ZMWebViewController.m
//  ZMCustomView
//
//  Created by ddapp on 17/3/1.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMWebViewController.h"

@interface ZMWebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation ZMWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.xiachufang.com"]]];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError %@", error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
