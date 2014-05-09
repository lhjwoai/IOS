//
//  ViewController.h
//  tempPrj
//
//  Created by lihj on 13-4-9.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#define SERVE_URL @"http://www.weicircle.com"

#define kNavBarHeight 44

#define __AppName [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey]

//设备屏幕大小
#define __MainScreenFrame  [[UIScreen mainScreen] bounds]
//设备屏幕宽
#define __MainScreen_Width  __MainScreenFrame.size.width
//设备屏幕高 20,表示状态栏高度.如3.5inch 的高,得到的__MainScreenFrame.size.height是480,而去掉电量那条状态栏,我们真正用到的是460;
#define __MainScreen_Height (__MainScreenFrame.size.height-20)

#define __AppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]

//使用DLog，当DEBUG为1的时候打印。
#define __DEBUG

#ifdef __DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) ? YES : NO

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#pragma mark - color functions
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
