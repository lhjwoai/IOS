//
//  SecondViewController.m
//  IOS
//
//  Created by lihj on 14-2-8.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "SecondViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"second";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSMutableDictionary *t_dic = [NSMutableDictionary dictionaryWithCapacity:0];
    [t_dic setObject:@"3" forKey:@"cat"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:@"http://www.weicircle.com/api.php?m=banner&c=list&" parameters:t_dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@",error);
    }];

//    [[AFHTTPRequestOperationManager manager] GET:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
