//
//  RegisterViewController.m
//  bigger
//
//  Created by Lee on 2017/11/11.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "RegisterViewController.h"
#import "MacroConfig.h"
#import "YYKit.h"
#import "LoginTextField.h"
#import "UITextField+UInputLimit.h"
#import "UITextField+UFormat.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView * logoImageView;

@property (nonatomic, strong) LoginTextField * phoneTextField;

@property (nonatomic, strong) LoginTextField * verifyTextField;

@property (nonatomic, strong) LoginTextField * passwordTextField;

@property (nonatomic, strong) UIButton * registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.verifyTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.registerButton];
    // Do any additional setup after loading the view.
}
- (UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
        _logoImageView.frame =CGRectMake(kScreenSize.width/2-40, kNavigationHeight+40, 80, 80);
    }
    return _logoImageView;
}

-(LoginTextField *)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField = [[LoginTextField alloc]initWithFrame:CGRectMake(20, self.logoImageView.bottom+25,kScreenWidth-40, 60)];
        _phoneTextField.textFieldType = LoginTextFieldType_phoneNum;
        _phoneTextField.textField.placeholder = @"请输入手机号";
        _phoneTextField.textField.ufo_maxLength = 13;
        _phoneTextField.textField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.textField.delegate = self;
    }
    return _phoneTextField;
}

-(LoginTextField *)verifyTextField{
    if (!_verifyTextField) {
        _verifyTextField = [[LoginTextField alloc]initWithFrame:CGRectMake(20, self.phoneTextField.bottom+5,kScreenWidth-40, 60)];
        _verifyTextField.textFieldType = LoginTextFieldType_verify;
        _verifyTextField.textField.placeholder = @"请输入验证码";
        _verifyTextField.textField.ufo_maxLength = 6;
        _verifyTextField.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _verifyTextField;
}


-(LoginTextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[LoginTextField alloc]initWithFrame:CGRectMake(20, self.verifyTextField.bottom+5,kScreenWidth-40, 60)];
        _passwordTextField.textFieldType = LoginTextFieldType_password;
        _passwordTextField.textField.placeholder = @"请输入账号密码";
        _passwordTextField.textField.ufo_maxLength = 20;
        _passwordTextField.textField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _passwordTextField;
}

-(UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:0];
        _registerButton.frame = CGRectMake(kScreenWidth/2-100, self.passwordTextField.bottom +50, 200, 50);
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        _registerButton.backgroundColor = [UIColor lightGrayColor];
    }
    return _registerButton;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return [UITextField phoneNumberFormatTextField:textField shouldChangeCharactersInRange:range replacementString:string];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
