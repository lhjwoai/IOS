//
//  baseViewController.h
//  tempPrj
//
//  Created by lihj on 13-4-9.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)viewDidLoad2;
- (void)setLbtnNormal;
- (void)setLBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action;
- (void)setRBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action;
- (void)setLBtnHidden:(BOOL)hidden;
- (void)backAction;

@end
