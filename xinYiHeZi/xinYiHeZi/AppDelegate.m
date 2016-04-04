//
//  AppDelegate.m
//  xinYiHeZi
//
//  Created by  sulcan on 16/3/27.
//  Copyright © 2016年 苏烁. All rights reserved.
//

#import "AppDelegate.h"
#import "XYHZTabBarController.h"
#import "XYHZNavigationController.h"
#import "XYHZHomeController.h"
#import "XYHZCategoryController.h"
#import "XYHZGoodController.h"
#import "XYHZStrategyController.h"
#import "XYHZMineController.h"

@interface AppDelegate ()
@property (nonatomic, strong) XYHZTabBarController *tabBarVC;
@end

@implementation AppDelegate
// 各模块URL
/**
 *  首页：
 
 檀志文
 http://app.xinyihezi.com:8888/homepage/?search_type=16&unique_id=B0B5E40C-1536-466F-BA72-2CE8F5E8854C&app_ver=2.3.0&from_type=iOS&ticket=92392e93df834af79776a59e60d49a9a
 
 李新雨
 http://app.xinyihezi.com:8888/homepage/?search_type=16&unique_id=B0B5E40C-1536-466F-BA72-2CE8F5E8854C&app_ver=2.3.0&from_type=iOS&ticket=92392e93df834af79776a59e60d49a9a
 */

- (XYHZTabBarController *)tabBarVc{
    
    if (!_tabBarVC) {
        _tabBarVC = [[XYHZTabBarController alloc] init];
    }
    return _tabBarVC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置缓存
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:@"images"];
    [NSURLCache setSharedURLCache:cache];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //首页
    XYHZHomeController *homeVC = [[XYHZHomeController alloc] init];
    [self addchildVC:homeVC title:@"首页" imageNamed:@"home" selectedImageNamed:@"home_selected"];
    
    //分类
    XYHZCategoryController *categoryVC = [[XYHZCategoryController alloc] init];
    
    [self addchildVC:categoryVC title:@"分类" imageNamed:@"category" selectedImageNamed:@"category_selected"];
    
    //好物
    XYHZGoodController *goodVC = [[XYHZGoodController alloc] init];
    [self addchildVC:goodVC title:@"好物" imageNamed:@"good" selectedImageNamed:@"good_selected"];
    
    //攻略
    XYHZStrategyController *strategyVC = [[XYHZStrategyController alloc] init];
    [self addchildVC:strategyVC title:@"攻略" imageNamed:@"strategy" selectedImageNamed:@"strategy_selected"];
    //我的
    XYHZMineController *mineVC = [[XYHZMineController alloc] init];
    [self addchildVC:mineVC title:@"我的" imageNamed:@"mine" selectedImageNamed:@"mine_selected"];
    
    self.window.rootViewController = self.tabBarVc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)addchildVC:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageName selectedImageNamed:(NSString *)selectedImageName{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.view.backgroundColor = PriceColor;
    XYHZNavigationController *nav = [[XYHZNavigationController alloc] initWithRootViewController:vc];
    if (selectedImageName) {
        vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    [self.tabBarVc addChildViewController:nav];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


// 打印所有字体
- (void)printFont {
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}

@end