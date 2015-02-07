//
//  RITTSearchResultDetailViewController.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTSearchResultDetailViewController.h"
#import "SearchResultDetailView.h"
#import "NetRequest.h"
#import "DomainSearchResultDetail.h"
#import "AlertView.h"

@interface RITTSearchResultDetailViewController () <NetRequestProtocol>

@property (nonatomic, retain) SearchResultDetailView *searchResultDetailView;
@property (nonatomic, retain) DomainSearchResultDetail *domainSearchResultDetail;

@end

@implementation RITTSearchResultDetailViewController

@synthesize searchResultDetailView;
@synthesize mme_eid;
@synthesize type;
@synthesize domain_name;
@synthesize domainSearchResultDetail;

- (void)dealloc
{
    [searchResultDetailView release], searchResultDetailView = nil;
    [domainSearchResultDetail release], domainSearchResultDetail = nil;
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
    [self generateUI];
    
    [AlertView showMBProgressHUDWithMessage:@"正在查询，请稍候。。。" OffsetX:0.0 OffsetY:0.0];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([type isEqualToString:@"code"]) {   //码号详情
            [[NetRequest sharedInstance]code:mme_eid];
            [[NetRequest sharedInstance]setDelegate:self];
            searchResultDetailView = [[SearchResultDetailView alloc]initWithFrame:CGRectMake(0, kNavBarHeight + kStatusBarHeight + 10, self.view.frame.size.width, 300)];
            [self.view addSubview:searchResultDetailView];
        } else if ([type isEqualToString:@"domain"]) {  //域名详情
            [[NetRequest sharedInstance]domain:domain_name];
            [[NetRequest sharedInstance]setDelegate:self];
            domainSearchResultDetail = [[DomainSearchResultDetail alloc]initWithFrame:CGRectMake(0, kNavBarHeight + kStatusBarHeight + 10, self.view.frame.size.width, 300)];
            [self.view addSubview:domainSearchResultDetail];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
//            [AlertView hideMBProgressHUD];
        });
    });
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 生成基础UI
- (void)generateUI
{
    [self generateNavBarUIWithLeftImage:[UIImage imageNamed:@"home_back"] rightImage:[UIImage imageNamed:@"home_setting"] titleText:self.titleViewContent target:self];
}

#pragma mark - NetRequestProtocol
- (void)netRequestFinished:(NSMutableDictionary *)data withAct:(int)act
{
    switch (act) {
        case ReqAct_code:
        {
            if (data) {
                [searchResultDetailView content:(NSArray *)data];
                [AlertView hideMBProgressHUD];
            } else {
                [AlertView updateMBProgressHUDWithMessage:@"没有查询到相关记录，请重新查询"];
                // 延迟2秒执行：
                double delayInSeconds = 1.5;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    // code to be executed on the main queue after delay
                    [AlertView hideMBProgressHUD];
                });
            }
            
        }
            break;
        case ReqAct_domain:
        {
            if (data) {
                [domainSearchResultDetail content:[(NSArray *)data objectAtIndex:0]];
                [AlertView hideMBProgressHUD];
            } else {
                [AlertView updateMBProgressHUDWithMessage:@"没有查询到相关记录，请重新查询"];
                // 延迟2秒执行：
                double delayInSeconds = 1.5;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    // code to be executed on the main queue after delay
                    [AlertView hideMBProgressHUD];
                });
            }
            
        }
            break;
        default:
            break;
    }
}

- (void)netRequestFailed:(NSMutableDictionary *)data withAct:(int)act
{
    switch (act) {
        case ReqAct_code:
        {
            [AlertView updateMBProgressHUDWithMessage:@"没有查询到相关记录，请重新查询"];
            // 延迟2秒执行：
            double delayInSeconds = 1.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                // code to be executed on the main queue after delay
                [AlertView hideMBProgressHUD];
            });
        }
            break;
        case ReqAct_domain:
        {
            [AlertView updateMBProgressHUDWithMessage:@"没有查询到相关记录，请重新查询"];
            // 延迟2秒执行：
            double delayInSeconds = 1.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                // code to be executed on the main queue after delay
                [AlertView hideMBProgressHUD];
            });
        }
            break;
        default:
            break;
    }
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
