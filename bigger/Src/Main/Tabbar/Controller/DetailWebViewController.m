//
//  DetailWebViewController.m
//  bigger
//
//  Created by HUYI on 2017/11/11.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "DetailWebViewController.h"
#import "HttpRequestManager.h"

@interface DetailWebViewController ()

@end

@implementation DetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIWebView* webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [webView setScalesPageToFit:YES];
    [self.view addSubview:webView];
    NSURL* url = [NSURL URLWithString:self.showUrl];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [webView loadRequest:request];//加载
    // Do any additional setup after loading the view.
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
