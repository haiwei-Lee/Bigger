//
//  HttpRequestManager.m
//  bigger
//
//  Created by Lee on 2017/11/9.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "HttpRequestManager.h"
#import "PPNetworkHelper.h"

@implementation HttpRequestManager

/*------------------------------------------------------------------------------------------------
 
 请求的公用方法，进行参数的处理，请求头的设置，参数的拼装...
 
 ----------------------------------------------------------------------------------------------*/

#pragma mark - 请求的公共方法

+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(URequestSuccess)success failure:(URequestFailure)failure
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, kToken_keyPath参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
//    [PPNetworkHelper setValue:[UUserManager userMobile] ?[UUserManager userMobile]:@"" forHTTPHeaderField:@"mobile"];
    if (![URL hasPrefix:@"http"]) {
        URL = [NSString stringWithFormat:@"%@%@",@"kBaseUrl",@"URL"];
    }
    NSLog(@"parameter=%@",parameter);

    // 发起请求
    return [PPNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
        NSLog(@"url==%@ responseobjct == %@",URL,responseObject);
       
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        success(responseObject);
        
    } failure:^(NSError *error,NSURLSessionTask * task) {
        NSHTTPURLResponse * repsponse = (NSHTTPURLResponse*)task.response;
        // 取得http状态码
        NSInteger httpStatusCode = (long)[repsponse statusCode];
        NSLog(@"%ld",httpStatusCode);
        NSLog(@"%@",[error localizedDescription]);
        // 同上
        NSLog(@"url==%@ error == %@",URL,[error description]);
        failure(@"");
    }];
}

@end
