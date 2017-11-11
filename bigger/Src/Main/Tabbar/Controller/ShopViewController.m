//
//  ShopViewController.m
//  bigger
//
//  Created by HUYI on 2017/11/9.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "ShopViewController.h"
#import "GlobalDefine.h"
#import "ProductModel.h"
#import "DetailWebViewController.h"
#import "MineViewController.h"
#import "LoginViewController.h"

@interface ShopViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView * _topScrollView;
    UIView *_hotView;
    UITableView *_plTableView;
    NSMutableArray *_productArray;
}
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"贷款超市";
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStyleDone target:self action:nil];
//    self.navigationItem.rightBarButtonItem = anotherButton;
    
    
    _productArray = [[NSMutableArray alloc]init];
    
    ProductModel *productModel = [[ProductModel alloc]init];
    productModel.pImages=@""; //图片
    productModel.pName=@"顺借"; //产品名
    productModel.pDesc=@"小额贷款"; //一句话描述
    productModel.pLevel=@"A"; //产品等级
    productModel.pPassRate=@"80%"; //通过率
    productModel.pPayMoney=@"1000"; //借款金额范围
    productModel.pPayLimit=@"7~30"; //借款期限范围
    productModel.pLendingRate=@"最快2小时到账"; //放款速度
    productModel.pApprovalWay=@"自动审批"; //审批方式
    productModel.pLimitType = @"天";//期限类型
    productModel.pProductUrl = @"http://t.cn/RWa2KuL";
    [_productArray addObject:productModel];
    
    
    ProductModel *productModel1 = [[ProductModel alloc]init];
    productModel1.pImages=@""; //图片
    productModel1.pName=@"优否·飞碟贷"; //产品名
    productModel1.pDesc=@"小额贷款"; //一句话描述
    productModel1.pLevel=@"A"; //产品等级
    productModel1.pPassRate=@"80%"; //通过率
    productModel1.pPayMoney=@"1000"; //借款金额范围
    productModel1.pPayLimit=@"7、14"; //借款期限范围
    productModel1.pLendingRate=@"最快2小时到账"; //放款速度
    productModel1.pApprovalWay=@"自动审批"; //审批方式
    productModel1.pLimitType = @"天";//期限类型
    productModel1.pProductUrl = @"http://t.cn/RWaLqgA";
    [_productArray addObject:productModel1];
    
    [self shopTableViewProductList];
    // Do any additional setup after loading the view.
}

- (void)hotRecommendedView{
    _hotView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, self.view.bounds.size.width-20, 180)];
    [_hotView.layer setCornerRadius:20.0f];
    [_hotView.layer setBorderWidth:1.0f];
    [_hotView.layer setBorderColor:HexColor(0x999999ff).CGColor];
    [self.view addSubview:_hotView];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStyleDone target:self action:@selector(tap)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    // Do any additional setup after loading the view.
}
- (void)tap{
//    MineViewController * vc =  [MineViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
//    self.navigationController.toolbarHidden = YES;
//    [self.navigationController presentViewController:[LoginViewController new] animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)shopTableViewProductList{
    _plTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,
                                                                self.view.bounds.size.width, self.view.bounds.size.height-_hotView.bounds.size.height) style:UITableViewStylePlain];
    [_plTableView setDelegate:self];
    [_plTableView setDataSource:self];
    [_plTableView setTableFooterView:[[UIView alloc]init]];
    [_plTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_plTableView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_plTableView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    
    _hotView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, _plTableView.bounds.size.width-20, 180)];
    [_hotView.layer setCornerRadius:20.0f];
    [_hotView.layer setBorderWidth:1.0f];
    [_hotView setBackgroundColor:[UIColor whiteColor]];
    [_hotView.layer setBorderColor:HexColor(0x999999ff).CGColor];
    [view addSubview:_hotView];
    
    ProductModel *productModel = [_productArray objectAtIndex:0];
    //tips
    UIImage *image = [UIImage imageNamed:@"xshd"];
    UIImageView *activityImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, image.size.width, image.size.height)];
    [activityImage setImage:image];
    [_hotView addSubview:activityImage];
    //title
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, image.size.height+15, _hotView.bounds.size.width, 30)];
    [titleLabel setText:[NSString stringWithFormat:@"%@-%@",productModel.pName,productModel.pDesc]];
    [_hotView addSubview:titleLabel];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
    //level
    UILabel *levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,
                                                                   titleLabel.bounds.size.height+titleLabel.bounds.size.height, _hotView.bounds.size.width, 30)];
    [levelLabel setText:[NSString stringWithFormat:@"申请等级：%@",productModel.pLevel]];
    [_hotView addSubview:levelLabel];
    [levelLabel setTextAlignment:NSTextAlignmentCenter];
    [levelLabel setFont:[UIFont systemFontOfSize:16.0f]];
    
    
    UIView *disView = [[UIView alloc]initWithFrame:CGRectMake(20, image.size.height+10+
                                                              titleLabel.bounds.size.height+levelLabel.bounds.size.height, _hotView.bounds.size.width-40, 30)];
    [_hotView addSubview:disView];
    //pLendingRate
    UILabel *pLendingRate = [[UILabel alloc]initWithFrame:CGRectMake(0,0, disView.bounds.size.width/3, 30)];
    [pLendingRate setText:[NSString stringWithFormat:@"%@",productModel.pLendingRate]];
    [pLendingRate setTextColor:HexColor(0x666666ff)];
    [disView addSubview:pLendingRate];
    [pLendingRate setTextAlignment:NSTextAlignmentLeft];
    [pLendingRate setFont:[UIFont systemFontOfSize:14.0f]];
    
    UILabel *labelLineLeft = [[UILabel alloc]initWithFrame:CGRectMake(disView.bounds.size.width/3, 5, 1, 20)];
    [labelLineLeft setBackgroundColor:HexColor(0x666666ff)];
    [disView addSubview:labelLineLeft];
    
    //pApprovalWay
    UILabel *pApprovalWay = [[UILabel alloc]initWithFrame:CGRectMake(disView.bounds.size.width/3,0, disView.bounds.size.width/3, 30)];
    [pApprovalWay setText:[NSString stringWithFormat:@"%@",productModel.pApprovalWay]];
    [disView addSubview:pApprovalWay];
    [pApprovalWay setTextAlignment:NSTextAlignmentCenter];
    [pApprovalWay setFont:[UIFont systemFontOfSize:14.0f]];
    
    UILabel *labelLineRight = [[UILabel alloc]initWithFrame:CGRectMake(disView.bounds.size.width/3*2, 5, 1, 20)];
    [labelLineRight setBackgroundColor:HexColor(0x666666ff)];
    [disView addSubview:labelLineRight];
    
    //pLendingRate
    UILabel *pPassRate = [[UILabel alloc]initWithFrame:CGRectMake(disView.bounds.size.width/3*2,0, disView.bounds.size.width/3, 30)];
    [pPassRate setText:[NSString stringWithFormat:@"通过率：%@",productModel.pPassRate]];
    [disView addSubview:pPassRate];
    [pPassRate setTextAlignment:NSTextAlignmentRight];
    [pPassRate setFont:[UIFont systemFontOfSize:14.0f]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake((_hotView.bounds.size.width-100)/2, _hotView.bounds.size.height-50, 100, 40)];
    [button setTitle:@"马上申请" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.layer setBorderWidth:1.0f];
    [button.layer setCornerRadius:10.0f];
    [button.layer setBorderColor:HexColor(0x999999ff).CGColor];
    [button addTarget:self action:@selector(applyNow) forControlEvents:UIControlEventTouchUpInside];
    [_hotView addSubview:button];
    
    return view;
}

- (void)applyNow{
    NSLog(@"123");
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 190;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellIdentifier];
    }
    
    ProductModel *model = [_productArray objectAtIndex:[indexPath row]];
    [cell addSubview:[self tableViewCellShow:model tag:[indexPath row]]];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *labelLine = [[UILabel alloc]initWithFrame:CGRectMake(15, 79, self.view.bounds.size.width-30, 1)];
    [labelLine setBackgroundColor:HexColor(0xefefefff)];
    [cell addSubview:labelLine];
    
    return cell;
}

- (UIView *)tableViewCellShow:(ProductModel *)model tag:(NSInteger)tag{
    UIView *cellView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, self.view.bounds.size.width-30, 80)];
    //产品图片
    UIImage *image = [UIImage imageNamed:@"default_pic"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, image.size.width, image.size.height)];
    [imageView setImage:image];
    [cellView addSubview:imageView];
    
    //产品名，介绍
    UILabel *pName = [[UILabel alloc]initWithFrame:CGRectMake(5+imageView.bounds.size.width, 10, self.view.bounds.size.width/2, 20)];
    [pName setText:[NSString stringWithFormat:@"%@-%@",model.pName,model.pDesc]];
    [pName setFont:[UIFont systemFontOfSize:14.0f]];
    [cellView addSubview:pName];
    
    //等级，通过率
    UILabel *pLevel = [[UILabel alloc]initWithFrame:CGRectMake(5+imageView.bounds.size.width, 30, self.view.bounds.size.width/2, 15)];
    [pLevel setText:[NSString stringWithFormat:@"申请等级:%@  通过率:%@%",model.pLevel,model.pPassRate]];
    [pLevel setFont:[UIFont systemFontOfSize:12.0f]];
    [cellView addSubview:pLevel];
    
    //借贷金额 图片
    UIImage *moneyImage = [UIImage imageNamed:@"money"];
    UIImageView *moneyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, image.size.height+25, moneyImage.size.width, moneyImage.size.height)];
    [moneyImageView setImage:moneyImage];
    [cellView addSubview:moneyImageView];
    
    //借贷金额
    UILabel *pMoney = [[UILabel alloc]initWithFrame:CGRectMake(5+moneyImageView.bounds.size.width,
                                                               image.size.height+25, self.view.bounds.size.width/2, 15)];
    [pMoney setText:[NSString stringWithFormat:@"额度：%@元",model.pPayMoney]];
    [pMoney setFont:[UIFont systemFontOfSize:12.0f]];
    [cellView addSubview:pMoney];
    
    //借贷期限 图片
    UIImage *limitImage = [UIImage imageNamed:@"limit"];
    UIImageView *limitImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cellView.bounds.size.width/2, image.size.height+25, limitImage.size.width, limitImage.size.height)];
    [limitImageView setImage:limitImage];
    [cellView addSubview:limitImageView];
    
    UILabel *pLimit = [[UILabel alloc]initWithFrame:CGRectMake(cellView.bounds.size.width/2+5+limitImageView.bounds.size.width,
                                                               image.size.height+25,
                                                               self.view.bounds.size.width/2, 15)];
    [pLimit setText:[NSString stringWithFormat:@"期限：%@%@",model.pPayLimit,model.pLimitType]];
    [pLimit setFont:[UIFont systemFontOfSize:12.0f]];
    [cellView addSubview:pLimit];
    
    UIButton *applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [applyBtn setFrame:CGRectMake(cellView.bounds.size.width-80, 20, 70, 25)];
    [applyBtn setTitle:@"申请" forState:UIControlStateNormal];
    [applyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [applyBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [applyBtn.layer setBorderWidth:1.0f];
    [applyBtn.layer setCornerRadius:5.0f];
    [applyBtn setTag:tag];
    [applyBtn.layer setBorderColor:HexColor(0x999999ff).CGColor];
    [applyBtn addTarget:self action:@selector(applyBorrow:) forControlEvents:UIControlEventTouchUpInside];
    [cellView addSubview:applyBtn];
    
    return cellView;
}

- (void)applyBorrow:(id)button{
    UIButton *btn = (UIButton *)button;
    ProductModel *model = [_productArray objectAtIndex:[btn tag]];
    DetailWebViewController *detailWeb = [[DetailWebViewController alloc]init];
    [detailWeb setShowUrl:model.pProductUrl];
    [self.navigationController pushViewController:detailWeb animated:YES];
    
}

#pragma mark - 设置列表行数
/*
 *  设置列表行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
