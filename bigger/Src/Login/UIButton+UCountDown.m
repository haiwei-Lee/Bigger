//
//  UIButton+UCountDown.m
//  uloan
//
//  Created by Lee on 2017/8/4.
//  Copyright © 2017年 cashbang. All rights reserved.
//

#import "UIButton+UCountDown.h"
#import "YYKit.h"

@implementation UIButton (UCountDown)

- (void)countDownSeconds:(NSInteger)timeout endTitle:(NSString *)endTitle waitTitle:(NSString *)waitTitle{
    
    __block NSInteger timeInterval = timeout;
    [self setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateDisabled];
   
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (timeInterval <= 0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:endTitle forState:UIControlStateNormal];
                self.enabled = YES;
            });
        }else{
            
            int seconds = timeInterval % 60;
            NSString * timeString = [NSString stringWithFormat:@"%.2d",seconds == 0 ? 60:seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%@s",timeString] forState:UIControlStateNormal];
                self.enabled = NO;
            });
            timeInterval-- ;
        }
    });
    dispatch_resume(timer);
}

@end
