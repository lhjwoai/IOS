//
//  shareFun.h
//  tempPrj
//
//  Created by lihj on 13-4-8.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface shareFun : NSObject

+ (void)showAlert:(NSString *)msg;

+ (BOOL)isValidateEmail:(NSString *)email;          //判断邮箱格式是否正确
+ (BOOL)isMobileNumber:(NSString *)mobileNum;        //判断手机号码是否正确

//+ (BOOL)isObjectOK:(nss)
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
@end
