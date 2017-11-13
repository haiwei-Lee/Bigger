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
#import "HttpRequestManager.h"

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
    _productArray = [[NSMutableArray alloc]init];
    [self getProductList];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"贷款超市";
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)HexColor(0x00C2D7).CGColor, (__bridge id)HexColor(0x773EE4).CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, -20, self.view.bounds.size.width, 64);
    [self.navigationController.navigationBar.layer addSublayer:gradientLayer];
    
    
    UIImage *rightImage = [[UIImage imageNamed:@"userHead"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    [self selectBanner];
//    [self shopTableViewProductList];
    // Do any additional setup after loading the view.
}

- (void)hotRecommendedView{
    _hotView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, self.view.bounds.size.width-20, 180)];
    [_hotView.layer setCornerRadius:20.0f];
    [_hotView.layer setBorderWidth:1.0f];
    [_hotView.layer setBorderColor:HexColor(0x999999ff).CGColor];
    [self.view addSubview:_hotView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectBanner{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 64, self.view.bounds.size.width, 54);
    [view setBackgroundColor:[UIColor whiteColor]];
    view.layer.shadowOpacity = 0.8f;
    view.layer.shadowRadius = 4.f;
    view.layer.shadowOffset = CGSizeMake(0,4);
    [view.layer setShadowColor:HexColor(0xefefefff).CGColor];
    [self.view addSubview:view];
    
    UILabel *label_left = [[UILabel alloc] init];
    label_left.frame = CGRectMake(0, 0, view.bounds.size.width/2, 54);
    label_left.text = @"热门爆款";
    [label_left setTextAlignment:NSTextAlignmentCenter];
    label_left.font = [UIFont fontWithName:@"FZLTHEL_SC--GB1-4" size:16];
    label_left.textColor = [UIColor colorWithRed:159/255.0 green:176/255.0 blue:197/255.0 alpha:1/1.0];
    [view addSubview:label_left];
    
    UILabel *label_right = [[UILabel alloc] init];
    label_right.frame = CGRectMake(view.bounds.size.width/2, 0, view.bounds.size.width/2, 54);
    label_right.text = @"周周新品";
    [label_right setTextAlignment:NSTextAlignmentCenter];
    label_right.font = [UIFont fontWithName:@"FZLTHEL_SC--GB1-4" size:16];
    label_right.textColor = [UIColor colorWithRed:159/255.0 green:176/255.0 blue:197/255.0 alpha:1/1.0];
    [view addSubview:label_right];

}

- (void)shopTableViewProductList{
    _plTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 118,
                                                                self.view.bounds.size.width, self.view.bounds.size.height-_hotView.bounds.size.height) style:UITableViewStylePlain];
    [_plTableView setDelegate:self];
    [_plTableView setDataSource:self];
    [_plTableView setTableFooterView:[[UIView alloc]init]];
    [_plTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_plTableView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_plTableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    if ([_productArray count] > 0) {
        ProductModel *model = [_productArray objectAtIndex:[indexPath row]];
        [cell addSubview:[self tableViewCellShow:model tag:[indexPath row]]];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    return cell;
}

- (UIView *)tableViewCellShow:(ProductModel *)model tag:(NSInteger)tag{
    UIView *cellView = [[UIView alloc] init];
    cellView.frame = CGRectMake(6, 118, self.view.bounds.size.width-12, 146.4);
    cellView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
//    //产品图片
//    UIImage *image = [UIImage imageNamed:@"default_pic"];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, image.size.width, image.size.height)];
//    [imageView setImage:image];
//    [cellView addSubview:imageView];
//
//    //产品名，介绍
//    UILabel *pName = [[UILabel alloc]initWithFrame:CGRectMake(5+imageView.bounds.size.width, 10, self.view.bounds.size.width/2, 20)];
//    [pName setText:[NSString stringWithFormat:@"%@-%@",model.name,model.descripe]];
//    [pName setFont:[UIFont systemFontOfSize:14.0f]];
//    [cellView addSubview:pName];
//
//    //等级，通过率
//    UILabel *pLevel = [[UILabel alloc]initWithFrame:CGRectMake(5+imageView.bounds.size.width, 30, self.view.bounds.size.width/2, 15)];
////    [pLevel setText:[NSString stringWithFormat:@"申请等级:%@  通过率:%f%%",model.pLevel,model.pPassRate]];
//    [pLevel setFont:[UIFont systemFontOfSize:12.0f]];
//    [cellView addSubview:pLevel];
//
//    //借贷金额 图片
//    UIImage *moneyImage = [UIImage imageNamed:@"money"];
//    UIImageView *moneyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, image.size.height+25, moneyImage.size.width, moneyImage.size.height)];
//    [moneyImageView setImage:moneyImage];
//    [cellView addSubview:moneyImageView];
//
//    //借贷金额
//    UILabel *pMoney = [[UILabel alloc]initWithFrame:CGRectMake(5+moneyImageView.bounds.size.width,
//                                                               image.size.height+25, self.view.bounds.size.width/2, 15)];
//    [pMoney setText:[NSString stringWithFormat:@"额度：%@元",model.money]];
//    [pMoney setFont:[UIFont systemFontOfSize:12.0f]];
//    [cellView addSubview:pMoney];
//
//    //借贷期限 图片
//    UIImage *limitImage = [UIImage imageNamed:@"limit"];
//    UIImageView *limitImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cellView.bounds.size.width/2, image.size.height+25, limitImage.size.width, limitImage.size.height)];
//    [limitImageView setImage:limitImage];
//    [cellView addSubview:limitImageView];
//
//    UILabel *pLimit = [[UILabel alloc]initWithFrame:CGRectMake(cellView.bounds.size.width/2+5+limitImageView.bounds.size.width,
//                                                               image.size.height+25,
//                                                               self.view.bounds.size.width/2, 15)];
//    [pLimit setText:[NSString stringWithFormat:@"期限：%@%@",model.term,model.termtype]];
//    [pLimit setFont:[UIFont systemFontOfSize:12.0f]];
//    [cellView addSubview:pLimit];
//
//    UIButton *applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [applyBtn setFrame:CGRectMake(cellView.bounds.size.width-80, 20, 70, 25)];
//    [applyBtn setTitle:@"申请" forState:UIControlStateNormal];
//    [applyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [applyBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
//    [applyBtn.layer setBorderWidth:1.0f];
//    [applyBtn.layer setCornerRadius:5.0f];
//    [applyBtn setTag:tag];
//    [applyBtn.layer setBorderColor:HexColor(0x999999ff).CGColor];
//    [applyBtn addTarget:self action:@selector(applyBorrow:) forControlEvents:UIControlEventTouchUpInside];
//    [cellView addSubview:applyBtn];
    
    return cellView;
}

- (void)applyBorrow:(id)button{
    UIButton *btn = (UIButton *)button;
    ProductModel *model = [_productArray objectAtIndex:[btn tag]];
    DetailWebViewController *detailWeb = [[DetailWebViewController alloc]init];
    [detailWeb setShowUrl:model.url];
    [self.navigationController pushViewController:detailWeb animated:YES];
    
}

#pragma mark - 设置列表行数
/*
 *  设置列表行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 146;
}


#pragma mark - 网络请求

- (void)getProductList{
    [HttpRequestManager getProductList:@{@"page":@"1",@"rows":@"10"} success:^(NSArray * _Nonnull productList) {
        [_productArray removeAllObjects];
        [_productArray addObjectsFromArray:productList];
        [_plTableView reloadData];
    } failure:^(NSString * _Nullable error) {
        
    }];
     
     //removeThirdBindStatus:@{@"uid":user.uid,@"type":[NSString stringWithFormat:@"%ld",type],@"token":[UTokenManager token]} success:^(id response) {
        
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

