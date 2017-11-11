//
//  ViewController.m
//  bigger
//
//  Created by Lee on 2017/11/7.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "ViewController.h"
#import "BATabBarController.h"
#import "BATabBarItem.h"
#import "YYKit.h"
#import "ShopViewController.h"
#import "CreditViewController.h"
#import "MineViewController.h"

@interface ViewController ()<BATabBarControllerDelegate>
@property (nonatomic, strong) BATabBarController* vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BATabBarItem *tabBarItem, *tabBarItem2, *tabBarItem3;
    
    
    UIViewController *shopVc = [[ShopViewController alloc] init];
    UIViewController *creditVc = [[CreditViewController alloc] init];
    UIViewController *mineVc = [[MineViewController alloc] init];
    
    UINavigationController *shopNav = [[UINavigationController alloc]initWithRootViewController:shopVc];
    UINavigationController *creditNav = [[UINavigationController alloc]initWithRootViewController:creditVc];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVc];
    
    
    //    NSMutableAttributedString *option1 = [[NSMutableAttributedString alloc] initWithString:@"超市"];
    //    [option1 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#ffffff"] range:NSMakeRange(0,option1.length)];
    
    tabBarItem = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"shop_n"] selectedImage:[UIImage imageNamed:@"shop_c"]];
    
    //    NSMutableAttributedString *option2 = [[NSMutableAttributedString alloc] initWithString:@"信用"];
    //    [option2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#ffffff"] range:NSMakeRange(0,option2.length)];
    
    tabBarItem2 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"credit_n"] selectedImage:[UIImage imageNamed:@"credit_c"]];
    
    //    NSMutableAttributedString * option3 = [[NSMutableAttributedString alloc] initWithString:@"我"];
    //    [option3 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#ffffff"] range:NSMakeRange(0,option3.length)];
    
    tabBarItem3 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"mine_n"] selectedImage:[UIImage imageNamed:@"mine_c"]];
    
    
    self.vc = [[BATabBarController alloc] init];
    
    //tab bar background color example
    self.vc.tabBarBackgroundColor = [UIColor blackColor];
    
    //tab bar item stroke color example
    self.vc.tabBarItemStrokeColor = [UIColor colorWithHexString:@"#1296db"];
    
    //Tab bar line width example
    self.vc.tabBarItemLineWidth = 1.0;
    
    //Hides the tab bar when true
//    self.vc.hidesBottomBarWhenPushed = YES;
//            self.vc.tabBar.hidden = NO;
    
    
    self.vc.viewControllers = @[shopNav,creditNav,mineNav];
    self.vc.tabBarItems = @[tabBarItem,tabBarItem2,tabBarItem3];
    [self.vc setSelectedViewController:shopNav animated:NO];
    
        self.vc.delegate = self;
    [self.view addSubview:self.vc.view];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tabBarController:(BATabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"%%%@",[viewController class]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

