//
//  AppDelegate.m
//  IOS
//
//  Created by lihj on 14-4-17.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "InteractivePopNavigationController.h"
#import "BaseTabBarController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    if (IOS7) {
        [application setStatusBarStyle:UIStatusBarStyleDefault];
    }
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    
    [self customizeInterface];
    
    return YES;
}

#pragma mark - Methods

- (void)setupViewControllers {
    UIViewController *firstViewController = [[FirstViewController alloc] init];
    UINavigationController *firstNavigationController = [[InteractivePopNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[SecondViewController alloc] init];
    UINavigationController *secondNavigationController = [[InteractivePopNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[ThirdViewController alloc] init];
    UINavigationController *thirdNavigationController = [[InteractivePopNavigationController alloc]
                                                   initWithRootViewController:thirdViewController];

    UIViewController *fourthViewController = [[FourthViewController alloc] init];
    UINavigationController *fourthNavigationController = [[InteractivePopNavigationController alloc]
                                                   initWithRootViewController:fourthViewController];

    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController, fourthNavigationController]];
    self.viewController = tabBarController;
    
    int tabBarViewControllersCount = tabBarController.viewControllers.count;
    NSMutableArray *tbNormalArray = [NSMutableArray arrayWithCapacity:tabBarViewControllersCount];
    for (int i=0; i<tabBarViewControllersCount; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"tbNormal%d",i]];
        [tbNormalArray addObject:image];
    }
    [tabBarController setItemImages:tbNormalArray];
    
    NSMutableArray *tbHighlightArray = [NSMutableArray arrayWithCapacity:tabBarViewControllersCount];
    for ( int i=0; i<tabBarViewControllersCount; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"tbHighlight%d",i]];
        [tbHighlightArray addObject:image];
    }
    [tabBarController setItemHighlightedImages:tbHighlightArray];
    tabBarController.delegate = (id<UITabBarControllerDelegate>) self;
    [tabBarController setTabBarBackgroundImage:[UIImage imageNamed:@"tb_bg"]];
    [tabBarController removeSelectionIndicator];
}

- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
//    [navigationBarAppearance setTintColor:[UIColor whiteColor]];
    
    NSDictionary *textAttributes = nil;

    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
        [navigationBarAppearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_tall"]
                                      forBarMetrics:UIBarMetricsDefault];
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    }
    else {
        [navigationBarAppearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"]
                                      forBarMetrics:UIBarMetricsDefault];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:20],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

@end
