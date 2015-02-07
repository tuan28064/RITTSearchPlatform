//
//  RITTLoadingViewController.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-27.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTLoadingViewController.h"
#import "RITTHomeViewController.h"

@interface RITTLoadingViewController ()

@end

@implementation RITTLoadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置启动画面
    UIImageView *loadingImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    loadingImageView.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:loadingImageView];
    [loadingImageView release];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    //3秒后进入主页
    [self performSelector:@selector(pushHome) withObject:nil afterDelay:2.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//进入主页
- (void)pushHome
{
    RITTHomeViewController *homeViewController = [[RITTHomeViewController alloc]init];
    [self.navigationController pushViewController:homeViewController animated:YES];
    [homeViewController release];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
