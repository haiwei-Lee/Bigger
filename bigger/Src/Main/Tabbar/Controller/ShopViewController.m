//
//  ShopViewController.m
//  bigger
//
//  Created by HUYI on 2017/11/9.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "ShopViewController.h"
#import "MineViewController.h"
#import "LoginViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"贷款超市";
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStyleDone target:self action:@selector(tap)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    // Do any additional setup after loading the view.
}
- (void)tap{
//    MineViewController * vc =  [MineViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
//    self.navigationController.toolbarHidden = YES;
    UINavigationController * loginNavigationController = [[UINavigationController alloc]initWithRootViewController:[LoginViewController new]];
    [self.navigationController presentViewController:loginNavigationController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hotRecommendedScroll{
    
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
