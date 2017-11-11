//
//  LoginTextField.m
//  bigger
//
//  Created by Lee on 2017/11/11.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "LoginTextField.h"
#import "Masonry.h"
#import "YYKit.h"
#import "UIButton+UCountDown.h"

@interface LoginTextField()

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UIImageView * lineImageView;
@property (nonatomic, strong) UIButton * verifyButton;

@end

@implementation LoginTextField

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.iconImageView];
        [self addSubview:self.textField];
        [self addSubview:self.lineImageView];
        [self addSubview:self.verifyButton];
    }
    return self;
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}

-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
    }
    return _textField;
}

-(UIImageView *)lineImageView{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor darkGrayColor]]];
    }
    return _lineImageView;
}

-(UIButton *)verifyButton{
    if (!_verifyButton) {
        _verifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_verifyButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_verifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _verifyButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _verifyButton.hidden = YES;
        [_verifyButton addTarget:self action:@selector(verifyBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verifyButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.superview).with.offset(10);
        make.centerY.equalTo(self.iconImageView.superview);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(15);
        make.centerY.equalTo(self.iconImageView);
        make.right.equalTo(self);
    }];
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineImageView.superview.mas_bottom).with.offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(self.lineImageView.superview.width, .5));
        make.left.equalTo(self.lineImageView.superview);
    }];
    [self.verifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, self.verifyButton.superview.height));
        make.right.equalTo(self.verifyButton.superview);
        make.centerY.equalTo(self.verifyButton.superview);
    }];
    
}

-(void)setTextFieldType:(LoginTextFieldType)textFieldType{
    _textFieldType = textFieldType;
    switch (textFieldType) {
        case LoginTextFieldType_phoneNum:
            self.iconImageView.image = [UIImage imageNamed:@"iphone"];
            break;
        case LoginTextFieldType_password:
            self.iconImageView.image = [UIImage imageNamed:@"password"];
            break;
        case LoginTextFieldType_verify:{
            self.iconImageView.hidden = YES;
            self.verifyButton.hidden = NO;
            
        }
            break;
    }
}
-(void)verifyBtnClicked{
    [self.verifyButton countDownSeconds:60 endTitle:@"重新发送" waitTitle:@"重新发送"];
}
@end
