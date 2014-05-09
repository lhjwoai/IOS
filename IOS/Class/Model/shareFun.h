//
//  shareFun.h
//  tempPrj
//
//  Created by lihj on 13-4-8.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface shareFun : NSObject

/**
 *  显示警告框
 */
+ (void)showAlert:(NSString *)msg;

/**
 *  验证是否是EMAIL
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 *  验证是否是手机号
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 *  颜色转图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  获取UILabel的高度
 */
+ (float)getHeightOfLabel:(UILabel *)label;

/**
 *  获取UILabel的宽度
 */
+ (float)getWidthOfLabel:(UILabel *)label;

@end
