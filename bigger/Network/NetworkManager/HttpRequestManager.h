//
//  HttpRequestManager.h
//  bigger
//
//  Created by Lee on 2017/11/9.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^URequestSuccess)(id _Nullable response);

typedef void(^URequestFailure)(NSString * _Nullable error);

@interface HttpRequestManager : NSObject

+ (void)getProductList:(id)parameters success:(void(^)(NSArray * productList))success failure:(URequestFailure)failure;
NS_ASSUME_NONNULL_END
@end
