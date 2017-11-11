//
//  LoginTextField.h
//  bigger
//
//  Created by Lee on 2017/11/11.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,LoginTextFieldType) {
    LoginTextFieldType_phoneNum,
    LoginTextFieldType_password,
    LoginTextFieldType_verify
};

@interface LoginTextField : UIView

@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, assign) LoginTextFieldType textFieldType;

@end
