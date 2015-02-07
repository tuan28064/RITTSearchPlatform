//
//  RITTBaseViewController.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-10.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTBaseViewController.h"
#import "RITTSettingViewController.h"

@interface RITTBaseViewController ()

@property (nonatomic, retain) UIImageView *backgroundImageView;

@end

@implementation RITTBaseViewController

@synthesize titleViewContent;
@synthesize list;
@synthesize backgroundImageView;
@synthesize searchInfoLabel;

- (void)dealloc
{
    [backgroundImageView release], backgroundImageView = nil;
    [searchInfoLabel release], searchInfoLabel = nil;
    [super dealloc];
}

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
    if (kIsGreaterThanIOS7) {
        UIImageView *navBarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        navBarImageView.image = [UIImage imageNamed:@"home_navBar"];
        [self.view addSubview:navBarImageView];
        [navBarImageView release];
        
        backgroundImageView = [[UIImageView alloc]init];
        backgroundImageView.frame = CGRectMake(0, kStatusBarHeight + kNavBarHeight, self.view.frame.size.width, self.view.frame.size.height);
        backgroundImageView.image = [UIImage imageNamed:@"home_background"];
        [self.view addSubview:backgroundImageView];
        
//        searchInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 20, self.view.frame.size.width, 20)];
//        searchInfoLabel.backgroundColor = [UIColor clearColor];
//        searchInfoLabel.font = [UIFont systemFontOfSize:14.0f];
//        searchInfoLabel.textAlignment = NSTextAlignmentJustified;
//        [backgroundImageView addSubview:searchInfoLabel];
    } else {
        UIImageView *navBarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        navBarImageView.image = [UIImage imageNamed:@"home_navBar"];
        [self.view addSubview:navBarImageView];
        [navBarImageView release];
        
        backgroundImageView = [[UIImageView alloc]init];
        backgroundImageView.frame = CGRectMake(0, kNavBarHeight, self.view.frame.size.width, self.view.frame.size.height);
        backgroundImageView.image = [UIImage imageNamed:@"home_background"];
        [self.view addSubview:backgroundImageView];
        
//        searchInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 20, self.view.frame.size.width, 20)];
//        searchInfoLabel.backgroundColor = [UIColor clearColor];
//        searchInfoLabel.font = [UIFont systemFontOfSize:14.0f];
//        searchInfoLabel.textAlignment = NSTextAlignmentJustified;
//        [backgroundImageView addSubview:searchInfoLabel];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 生成navBarUI
- (void)generateNavBarUIWithLeftImage:(UIImage *)leftImage rightImage:(UIImage *)rightImage titleText:(NSString *)titleText target:(id)target
{
    if (leftImage) {    //左边按钮，返回按钮
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(6, kHeightForStatusBar + 10, 24, 24);
        [leftButton setBackgroundImage:leftImage forState:UIControlStateNormal];
        [leftButton setBackgroundImage:leftImage forState:UIControlStateHighlighted];
        [leftButton addTarget:self action:@selector(leftButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:leftButton];
    }
    if (rightImage) {   //右边按钮，设置按钮
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(self.view.frame.size.width - 24 - 6, kHeightForStatusBar + 10, 24, 24);
        [rightButton setBackgroundImage:rightImage forState:UIControlStateNormal];
        [rightButton setBackgroundImage:rightImage forState:UIControlStateHighlighted];
        [rightButton addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:rightButton];
    }
    if (titleText) {
        UILabel *titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 110, kHeightForStatusBar, 220, 44)]autorelease];
        titleLabel.text = titleText;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:titleLabel];
    }
}

- (void)leftButton:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButton:(UIButton *)button
{
    RITTSettingViewController *settingViewController = [[RITTSettingViewController alloc]init];
    [self.navigationController pushViewController:settingViewController animated:YES];
    [settingViewController release];
}

#pragma mark - AdapterProtocol
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
