//
//  UITextField+UFormat.h
//  uloan
//
//  Created by Lee on 2017/8/18.
//  Copyright © 2017年 cashbang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (UFormat)

/**
*  手机号码格式化
*  参数 textField UITextField控件
*  参数 range 文本范围
*  参数 string 字符串
*/
+ (BOOL)phoneNumberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;


/**
 *  银行卡格式化
 *  参数 textField UITextField控件
 *  参数 range 文本范围
 *  参数 string 字符串
 */
+ (BOOL)bankNumberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

/**
 *  格式化后的号码转正常数字
 *  参数 textField UITextField控件
 */
+ (NSString *)numberToNormalNumTextField:(UITextField *)textField;

@end
