//
//  ThirdViewController.m
//  IOS
//
//  Created by lihj on 14-2-8.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    CGFloat gMaxWidth = 58.0f;
    CGFloat gWidth = 100*2.0f;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, gWidth, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 1;
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = title;
    self.navigationItem.titleView = label;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.title = @"third";
    
    self.navigationItem.title = @"加入";
//    [self setTitle:@"321"];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(sss) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
//    [self startAnimationTitle];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    if (self.navigationController.viewControllers.count == 1 && !_ifInteractivePop) {

    //    }
}

- (void)sss {
    FourthViewController *vc = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
