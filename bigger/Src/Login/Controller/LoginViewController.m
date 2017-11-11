//
//  LoginViewController.m
//  bigger
//
//  Created by Lee on 2017/11/11.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "LoginViewController.h"
#import "MacroConfig.h"
#import "Masonry.h"
#import "LoginTextField.h"
#import "YYKit.h"
#import "RegisterViewController.h"
#import "UITextField+UInputLimit.h"
#import "UITextField+UFormat.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView * logoImageView;

@property (nonatomic, strong) LoginTextField * phoneTextField;

@property (nonatomic, strong) LoginTextField * passwordTextField;

@property (nonatomic, strong) UIButton * loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerSys)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    // Do any additional setup after loading the view.
}
- (UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
        _logoImageView.frame =CGRectMake(kScreenSize.width/2-40, kNavigationHeight+60, 80, 80);
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

-(LoginTextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[LoginTextField alloc]initWithFrame:CGRectMake(20, self.phoneTextField.bottom+5,kScreenWidth-40, 60)];
        _passwordTextField.textFieldType = LoginTextFieldType_password;
        _passwordTextField.textField.placeholder = @"请输入账号密码";
        _passwordTextField.textField.ufo_maxLength = 20;
        _passwordTextField.textField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _passwordTextField;
}

-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:0];
        _loginButton.frame = CGRectMake(kScreenWidth/2-100, self.passwordTextField.bottom +50, 200, 50);
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.backgroundColor = [UIColor lightGrayColor];
    }
    return _loginButton;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return [UITextField phoneNumberFormatTextField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (void)registerSys{
    [self.navigationController pushViewController:[RegisterViewController new] animated:YES];
}

-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
