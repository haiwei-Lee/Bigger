//
//  UIButton+UCountDown.h
//  uloan
//
//  Created by Lee on 2017/8/4.
//  Copyright © 2017年 cashbang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (UCountDown)

- (void)countDownSeconds:(NSInteger)timeout endTitle:(NSString *)endTitle waitTitle:(NSString *)waitTitle;

@end
