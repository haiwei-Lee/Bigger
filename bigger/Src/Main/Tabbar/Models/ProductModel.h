//
//  ProductModel.h
//  bigger
//
//  Created by HUYI on 2017/11/10.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property (copy, nonatomic) NSString *pImages;//图片
@property (copy, nonatomic) NSString *pName;//产品名
@property (copy, nonatomic) NSString *pDesc;//一句话描述
@property (copy, nonatomic) NSString *pLevel;//产品等级
@property (copy, nonatomic) NSString *pPassRate;//通过率
@property (copy, nonatomic) NSString *pPayMoney;//借款金额范围
@property (copy, nonatomic) NSString *pPayLimit;//借款期限范围
@property (copy, nonatomic) NSString *pLimitType;//期限类型
@property (copy, nonatomic) NSString *pLendingRate;//放款速度
@property (copy, nonatomic) NSString *pApprovalWay;//审批方式
@property (copy, nonatomic) NSString *pProductUrl;//产品链接


@property (copy, nonatomic) NSString *url;//"https://www.baidu.com"; 产品链接
@property (copy, nonatomic) NSString *termtype;//B;期限类型
@property (copy, nonatomic) NSString *term;//"1,2,3";期限值
@property (copy, nonatomic) NSString *checktype;//A; 审核方式
@property (copy, nonatomic) NSString *logo;//"https://www.baidu.com/img/baidu_jgylogo3.gif"; logo
@property (copy, nonatomic) NSString *name;//1; 产品名称
@property (nonatomic) float grantrate;//"0.8"; 放款概率
@property (copy, nonatomic) NSString *grantspeed;//1; 放款速度
@property (copy, nonatomic) NSString *descripe;//1; 描述
@property (copy, nonatomic) NSString *money;//"500,1000,1500"; 借款金额

@property (copy, nonatomic) NSString *acturltransfertype;//A; 实际到账方式
@property (copy, nonatomic) NSString *authcredit;//0; 是否查询征信
@property (copy, nonatomic) NSString *authjingdong;//1; 京东认证
@property (copy, nonatomic) NSString *authmobile;//1; 实名手机
@property (copy, nonatomic) NSString *authrenhang;//0; 人行征信
@property (copy, nonatomic) NSString *authtaobao;//"<null>"; 认证淘宝
@property (copy, nonatomic) NSString *authzhima;//1; 芝麻信用
@property (copy, nonatomic) NSString *canadvancerepay;//1; 能否提前还款
@property (copy, nonatomic) NSString *cangrowmoney;//1; 能否提额
@property (copy, nonatomic) NSString *code;//1; 产品编号
@property (copy, nonatomic) NSString *createtime;//创建时间;
@property (copy, nonatomic) NSString *datastatus;//1; 状态
@property (copy, nonatomic) NSString *jobtype;//A; 面向人群
@property (copy, nonatomic) NSString *maxmoney;//1500; 最大金额
@property (copy, nonatomic) NSString *minmoney;//500; 最小金额
@property (copy, nonatomic) NSString *pid;//1; 产品id
@property (copy, nonatomic) NSString *repaytype;//A; 还款方式
@property (copy, nonatomic) NSString *repayway;//A;还款途径
@property (copy, nonatomic) NSString *sortid;//1;
@property (copy, nonatomic) NSString *termmax;//3;期限最大值
@property (copy, nonatomic) NSString *termmin;//1;期限最小值
@property (copy, nonatomic) NSString *transfertype;//A;到账方式
@property (copy, nonatomic) NSString *updatetime;//更新时间;


@end
