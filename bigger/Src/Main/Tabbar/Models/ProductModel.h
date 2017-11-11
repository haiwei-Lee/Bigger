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


@end
