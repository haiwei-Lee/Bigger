//
//  MineViewController.m
//  bigger
//
//  Created by HUYI on 2017/11/9.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "MineViewController.h"
#import "GlobalDefine.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStyleDone target:self action:nil];
//    self.navigationItem.rightBarButtonItem = anotherButton;
    // Do any additional setup after loading the view.
    
    [self userInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)userInfo{
    UIView *userInfoView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 240)];
    [userInfoView setBackgroundColor:HexColor(0xccccccff)];
    [self.view addSubview:userInfoView];
    
    UIImage *image = [UIImage imageNamed:@"userinfo"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((
                                                                           self.view.bounds.size.width-128)/2,
                                                                          16,128, 128)];
    [imageView setImage:image];
    [userInfoView addSubview:imageView];
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
