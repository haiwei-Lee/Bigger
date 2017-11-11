//
//  GlobalDefine.h
//  com.cashpie.sunloan
//
//  Created by 蓝盾 on 2016/12/16.
//  Copyright © 2016年 cashpie. All rights reserved.
//


#ifndef GlobalDefine_h
#define GlobalDefine_h

#define HexColor(c) [UIColor colorWithRed:((c>>24)&0xFF)/255.0  \
green:((c>>16)&0xFF)/255.0  \
blue:((c>>8)&0xFF)/255.0   \
alpha:((c)&0xFF)/255.0]

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define DESIGN_VERTICAL_SCALE_RATIO SCREEN_HEIGHT/667.0
#define DESIGN_HORIZONTAL_SCALE_RATIO SCREEN_WIDTH/375.0

//XCode8 + iOS10 解决打印不全问题的宏
#ifdef DEBUG
#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define NSLog(format, ...)
#endif







#define kAESKey         @"abcdnnnnnn123456"
#define HEIGHT_IPHONE_5 568
#define BEFORE_IPHONE_5 ([[UIScreen mainScreen] bounds ].size.height <= HEIGHT_IPHONE_5)

#endif /* GlobalDefine_h */

#define KDEFAULTHOSTAPI         @"https://api.faceid.com"
#define KDEFAULIDCARDCHECK   @"https://api.faceid.com/ocr/idcard"
#define FACEID_OCR_IDCARD_URL             @"https://api.faceid.com/faceid/v1/ocridcard"
#define FACEID_DETECT_URL                  @"https://api.faceid.com/faceid/v1/detect"
#define kFaceidVerify                   @"https://api.faceid.com/faceid/v1/verify"
#define kFaceidVerify2_0               @"https://api.megvii.com/faceid/v2/verify"

#define kLineHeight     (0.5)

//颜色
#define RED_COLOR HexColor(0xCB4B39FF)

#define GRAY_COLOR HexColor(0xD6D6D6FF)
#define LIGHT_GRAY_COLOR HexColor(0x666666FF)
#define DEFAULT_BACKGROUND_COLOR HexColor(0xF6F6F6FF)

#define kButtonColor HexColor(0xFD610Eff)

//列表
#define kCellHeightNoImage   (44)
#define kCellHeight   (80)
#define kCellTitleColor     HexColor(0x333333ff)
#define kCellDescribeColor    HexColor(0x999999ff)
#define kCellTitleSize (15.0f)
#define kCellTitleSizeSmall (12.0f)
#define kCellDescribeSize  (10.0f)
#define kCellHeaderColor  HexColor(0xfafafaff)
#define kCellDetailLabelColor  HexColor(0xc8c8c8ff)

#define DesignVerticalScaleRatio SCREEN_HEIGHT/667.0

#define DesignHorizontalScaleRatio SCREEN_WIDTH/375.0

//验证码type

typedef NS_ENUM(NSUInteger,kMessageCodeType){
    kMessageCodeRegister = 1,
    kMessageCodeLoan,
    kMessageCodeLogin,
    kMessageCodeBankcard,
    kMessageCodeBindWX,
    kMessageCodeBindQQ,
    kMessageCodeResetPSWD,
    kMessageCodeCoupon,
};

// 身份证
#define  kValidateIdCard                         @"^(\\d{14}|\\d{17})(\\d|[xX])$"
// 密码
#define  kValidatePassword                 @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$"

//利率
#define kInterest       (0.003)

//jpush失败请求延迟
#define kJpushRegisterDelay  60.0f

#define LOGIN(viewController) \
    QBUserManager *userManager = [QBUserManager shareUserManager];\
    if (![userManager isLogined]) \
    {\
        [viewController.navigationController pushViewController:[QBFasterLoginViewController new] animated:YES];\
        return;\
    }

#define AUTH(viewController) \
    QBUserModel * qbuserModel = [[QBUserManager shareUserManager]userInfo];\
    if(!qbuserModel.idcard || [qbuserModel.idcard isEqualToString:@""])\
    {\
        QBIDCardStartViewController * idcardAuthView = [[QBIDCardStartViewController alloc]init];\
        [viewController.navigationController pushViewController:idcardAuthView animated:YES];\
        return;\
    }\
0

#define IDCARD_AUTH(viewController) \
    QBUserModel * qbuserModel = [[QBUserManager shareUserManager]userInfo];\
    if(!qbuserModel.idcard || [qbuserModel.idcard isEqualToString:@""])\
    {\
        QBIDCardStartViewController * idcardAuthView = [[QBIDCardStartViewController alloc]init];\
        [viewController.navigationController pushViewController:idcardAuthView animated:YES];\
        return;\
    }\
