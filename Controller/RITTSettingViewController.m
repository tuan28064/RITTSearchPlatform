//
//  RITTSettingViewController.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-8.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTSettingViewController.h"
#import "SettingAdapter.h"
#import "NetRequest.h"

@interface RITTSettingViewController () <NetRequestProtocol, SettingAdapterProtocol>

@property (nonatomic, retain) SettingAdapter *settingAdapter;
@property (nonatomic, retain) UITableView *settingTableView;

@end

@implementation RITTSettingViewController

@synthesize settingAdapter;
@synthesize settingTableView;

- (void)dealloc
{
    [settingTableView release], settingTableView = nil;
    [settingAdapter release], settingAdapter = nil;
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
    settingAdapter = [[SettingAdapter alloc]init];
    settingAdapter.delegate = self;
    settingAdapter.settingAdapterDelegate = self;
    
    [self generateNavBarUIWithLeftImage:[UIImage imageNamed:@"home_back"] rightImage:nil titleText:@"设置" target:self];
    
    settingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    settingTableView.delegate = settingAdapter;
    settingTableView.backgroundColor = [UIColor clearColor];
    settingTableView.tableFooterView = [[[UIView alloc]init]autorelease];
    settingTableView.dataSource = settingAdapter;
    [self.view addSubview:settingTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Adapter的delegate方法
- (void)updateDB
{
    [[NetRequest sharedInstance]setDelegate:self];
    [[NetRequest sharedInstance]dbCheckForUpdate:@"1.0"];
}


#pragma mark - NetRequestDelegate
- (void)netRequestFinished:(NSMutableDictionary *)data withAct:(int)act
{
    switch (act) {
        case ReqAct_dbCheckForUpdate:
        {
            if (data) {
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                [userDefault setObject:[data objectForKey:kData_url] forKey:@"dbURL"];
                [userDefault setObject:[data objectForKey:kData_dbSW] forKey:@"dbSW"];
                [userDefault synchronize];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)netRequestFailed:(NSMutableDictionary *)data withAct:(int)act
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
