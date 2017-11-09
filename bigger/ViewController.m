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

@interface ViewController ()
@property (nonatomic, strong) BATabBarController* vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BATabBarItem *tabBarItem, *tabBarItem2, *tabBarItem3;
    UIViewController *vc1 = [[UIViewController alloc] init];
    UIViewController *vc2 = [[UIViewController alloc] init];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor colorWithHexString:@"#222B30"];
    vc2.view.backgroundColor = [UIColor colorWithHexString:@"#222B30"];
    vc3.view.backgroundColor = [UIColor colorWithHexString:@"#222B30"];
    
    
    NSMutableAttributedString *option1 = [[NSMutableAttributedString alloc] initWithString:@"Feed"];
    [option1 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#F0F2F6"] range:NSMakeRange(0,option1.length)];
    
    tabBarItem = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon1_unselected"] selectedImage:[UIImage imageNamed:@"icon1"] title:option1];
    
//    BATabBarBadge *badge = [[BATabBarBadge alloc] initWithValue:@22 backgroundColor:[UIColor redColor]];
//    tabBarItem.badge = badge;
    
    NSMutableAttributedString *option2 = [[NSMutableAttributedString alloc] initWithString:@"Home"];
    [option2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#F0F2F6"] range:NSMakeRange(0,option2.length)];
    
    tabBarItem2 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon2_unselected"] selectedImage:[UIImage imageNamed:@"icon2"] title:option2];
    
    NSMutableAttributedString * option3 = [[NSMutableAttributedString alloc] initWithString:@"Profile"];
    [option3 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#F0F2F6"] range:NSMakeRange(0,option3.length)];
    
    tabBarItem3 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon3_unselected"] selectedImage:[UIImage imageNamed:@"icon3"] title:option3];
    
    
    self.vc = [[BATabBarController alloc] init];
    
    //tab bar background color example
    self.vc.tabBarBackgroundColor = [UIColor blackColor];
    
    //tab bar item stroke color example
    self.vc.tabBarItemStrokeColor = [UIColor redColor];
    
    //Tab bar line width example
    self.vc.tabBarItemLineWidth = 1.0;
    
    //Hides the tab bar when true
    //        self.vc.hidesBottomBarWhenPushed = YES;
    //        self.vc.tabBar.hidden = YES;
    
    
    self.vc.viewControllers = @[vc1,vc2,vc3];
    self.vc.tabBarItems = @[tabBarItem,tabBarItem2,tabBarItem3];
    [self.vc setSelectedViewController:vc2 animated:NO];
    
//    self.vc.delegate = self;
    [self.view addSubview:self.vc.view];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
