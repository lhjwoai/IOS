//
//  FirstViewController.m
//  IOS
//
//  Created by lihj on 14-2-8.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"1";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
    
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = CGRectMake(40, 40, 100, 100);
    [img setImageWithURL:[NSURL URLWithString:@"http://static2.dmcdn.net/static/video/214/448/51844412:jpeg_preview_small.jpg?20121105220415"]
                   placeholderImage:[UIImage imageNamed:@"Default"] options:SDWebImageRefreshCached];
    [self.view addSubview:img];
    
    
    UIImageView *img1 = [[UIImageView alloc] init];
    img1.frame = CGRectMake(40, 160, 100, 100);
    [self.view addSubview:img1];

    
    __block UIActivityIndicatorView *activityIndicator;
    __weak UIImageView *weakImageView = img1;
    [img1 setImageWithURL:[NSURL URLWithString:@"http://assets.sbnation.com/assets/2512203/dogflops.gif"] placeholderImage:[UIImage imageNamed:@"Default"] options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize)
     {
         if (!activityIndicator)
         {
             [self.view addSubview:activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge]];
             DLog(@"%@, %@", NSStringFromCGRect(weakImageView.frame), NSStringFromCGPoint(weakImageView.center));
             activityIndicator.center = weakImageView.center;
             DLog(@"%@", NSStringFromCGPoint(activityIndicator.center));
             DLog(@"%@", NSStringFromCGRect(activityIndicator.frame));
             [activityIndicator startAnimating];
         }
     }
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
     {
         [activityIndicator removeFromSuperview];
         activityIndicator = nil;
     }];


//    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
