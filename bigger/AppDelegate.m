//
//  AppDelegate.m
//  bigger
//
//  Created by Lee on 2017/11/7.
//  Copyright © 2017年 cashpie. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "CYLTabBarController.h"
#import "ShopViewController.h"
#import "CreditViewController.h"
#import "MineViewController.h"
@interface AppDelegate ()

@property (nonatomic, strong) CYLTabBarController * tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow * window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    window.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
    window.rootViewController = self.tabBarController;
    [window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (void)setupViewControllers {
    ShopViewController *firstViewController = [[ShopViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    CreditViewController *secondViewController = [[CreditViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    MineViewController *thirdViewController = [[MineViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:thirdViewController];
    
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    [self customizeTabBarForController:tabBarController];
    
    [tabBarController setViewControllers:@[
                                           firstNavigationController,
                                           secondNavigationController,
                                           thirdNavigationController
                                           ]];
    self.tabBarController = tabBarController;
}

/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"超市",
                            CYLTabBarItemImage : @"shop_n",
                            CYLTabBarItemSelectedImage : @"shop_c",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"信用",
                            CYLTabBarItemImage : @"credit_n",
                            CYLTabBarItemSelectedImage : @"credit_c",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"我",
                            CYLTabBarItemImage : @"mine_n",
                            CYLTabBarItemSelectedImage : @"mine_c",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2 ,dict3];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
