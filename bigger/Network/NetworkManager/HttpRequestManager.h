//
//  HttpRequestManager.h
//  bigger
//
//  Created by Lee on 2017/11/9.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^URequestSuccess)(id _Nullable response);

typedef void(^URequestFailure)(NSString * _Nullable error);

@interface HttpRequestManager : NSObject

@end
