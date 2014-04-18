//
//  baseViewController.m
//  tempPrj
//
//  Created by lihj on 13-4-9.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        if (IOS7) {
            self.automaticallyAdjustsScrollViewInsets = NO;
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
    [self addSwipe];
}

- (void)viewDidLoad2
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLBtnHidden:(BOOL)hidden {
    self.navigationItem.hidesBackButton = YES;
}

- (void)addSwipe {
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        [self backAction];
    }
}

- (void)setLbtnNormal{
    UIButton *t_buttonL = [[UIButton alloc] initWithFrame:CGRectMake(0, 2, 40, 40)];
	[t_buttonL setImage:[UIImage imageNamed:@"nav_back.png"] forState:UIControlStateNormal];
    [t_buttonL addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *t_barButtonL = [[UIBarButtonItem alloc] initWithCustomView:t_buttonL];
	self.navigationItem.leftBarButtonItem = t_barButtonL;
}

- (void) setLBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action {
	UIButton *t_buttonL = [[UIButton alloc] initWithFrame:CGRectMake(0, 2, 40, 40)];
	[t_buttonL setTitle:t_str forState:UIControlStateNormal];
	[t_buttonL setBackgroundImage:[UIImage imageNamed:t_img] forState:UIControlStateNormal];
	[t_buttonL setBackgroundImage:[UIImage imageNamed:t_imgSel] forState:UIControlStateHighlighted];
	[t_buttonL setBackgroundColor:[UIColor clearColor]];
    if (t_str) {
        [t_buttonL setShowsTouchWhenHighlighted:YES];
    }
	[t_buttonL.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	[t_buttonL addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *t_barButtonL = [[UIBarButtonItem alloc] initWithCustomView:t_buttonL];    
	self.navigationItem.leftBarButtonItem = t_barButtonL;
}

- (void) setRBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action {
	UIButton *t_buttonR = [[UIButton alloc] initWithFrame:CGRectMake(0, 2, 40, 40)];
	[t_buttonR setTitle:t_str forState:UIControlStateNormal];
	[t_buttonR setImage:[UIImage imageNamed:t_img] forState:UIControlStateNormal];
	[t_buttonR setImage:[UIImage imageNamed:t_imgSel] forState:UIControlStateHighlighted];
	[t_buttonR setBackgroundColor:[UIColor clearColor]];
    if (t_str) {
        [t_buttonR setShowsTouchWhenHighlighted:YES];
    }
	[t_buttonR.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	[t_buttonR addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *t_barButtonR = [[UIBarButtonItem alloc] initWithCustomView:t_buttonR] ;
	self.navigationItem.rightBarButtonItem = t_barButtonR;
}

- (void) backAction {
	[self.navigationController popViewControllerAnimated:YES];
}


@end
