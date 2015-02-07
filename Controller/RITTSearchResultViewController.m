//剪短发了开始到家乐福就说了句
//  RITTSearchResultViewController.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-27.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTSearchResultViewController.h"
#import "LongDistanceCodeAdapter.h"
#import "RITTDatabaseOperation.h"
#import "LocQuery_A95Adapter.h"
#import "LocQuery_GAdapter.h"
#import "RITTSearchResultDetailViewController.h"
#import "AlertView.h"
#import "RITT_C_CODE_Model.h"
#import "RITT_C_LOC_CODE_Model.h"
#import "IPAdapter.h"
#import "NetRequest.h"
#import "RITT_C_DOMAIN_Model.h"

@interface RITTSearchResultViewController () <ShowDetailProtocol, NetRequestProtocol>

@property (nonatomic, retain) UITableView *resultTableView;
@property (nonatomic, retain) LongDistanceCodeAdapter *longDistanceCodeAdapter;
@property (nonatomic, retain) LocQuery_A95Adapter *locQuery_A95Adapter;
@property (nonatomic, retain) LocQuery_GAdapter *locQuery_GAdapter;
@property (nonatomic, retain) IPAdapter *ipAdapter;

@end

@implementation RITTSearchResultViewController

@synthesize searchInput;
@synthesize searchInput_param2;
@synthesize resultTableView;
@synthesize longDistanceCodeAdapter;
@synthesize locQuery_A95Adapter;
@synthesize inputType;
@synthesize locQuery_GAdapter;
@synthesize isPush;
@synthesize ipAdapter;

- (void)dealloc
{
    [longDistanceCodeAdapter release], longDistanceCodeAdapter = nil;
    [resultTableView release], resultTableView = nil;
    [locQuery_A95Adapter release], locQuery_A95Adapter = nil;
    [locQuery_GAdapter release], locQuery_GAdapter = nil;
    [ipAdapter release], ipAdapter = nil;
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
    
    resultTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    resultTableView.backgroundColor = [UIColor clearColor];
    resultTableView.tableFooterView = [[[UIView alloc]init]autorelease];
    [self.view addSubview:resultTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //排序方法
    NSComparator cmptr = ^(RITT_C_CODE_Model *obj1, RITT_C_CODE_Model *obj2){
        if ([obj1.CODE integerValue] > [obj2.CODE integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1.CODE integerValue] < [obj2.CODE integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    if (isPush) {
        [AlertView showMBProgressHUDWithMessage:@"正在查询，请稍候。。。" OffsetX:0.0 OffsetY:0.0];        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            if (inputType == InputType_A) {
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"code";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_AWithCode:searchInput] sortedArrayUsingComparator:cmptr];
                
                self.list = locQuery_A95Adapter.list;
                
                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
            } else if (inputType == InputType_A_95) {
                NSArray *codeArray = [NSArray arrayWithObjects:@"号段：950", @"号段：951", @"号段：952", @"号段：955", @"号段：957", @"号段：958", @"号段：959", nil];
                NSArray *nameArray = [NSArray arrayWithObjects:@"用途:电话信息服务、呼叫中心业务", @"用途:电话信息服务、呼叫中心业务", @"用途:电话信息服务、呼叫中心业务、语音信箱业务", @"用途:服务型企事业单位客服号码", @"用途:寻呼、ISP和新业务接入号码", @"用途:寻呼、ISP和新业务接入号码", @"用途:寻呼、ISP和新业务接入号码", nil];
                NSArray *bitArray = [NSArray arrayWithObjects:@"位长：5", @"位长：5", @"位长：6", @"位长：5", @"位长：5", @"位长：5", @"位长：5", nil];
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for (int i = 0; i < 7; i++) {
                    RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]init];
                    c_code_model.CODE = [codeArray objectAtIndex:i];
                    c_code_model.CUS_NAME = [nameArray objectAtIndex:i];
                    c_code_model.EXPIRETIME = [bitArray objectAtIndex:i];
                    [array addObject:c_code_model];
                    [c_code_model release];
                }
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"95";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = array;
                self.list = locQuery_A95Adapter.list;
                [array release];
                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
            } else if (inputType == InputType_B_106) {
                NSArray *codeArray = [NSArray arrayWithObjects:@"号段：1062", @"号段：10630", @"号段：1063（5-8）", @"号段：10639", @"号段：1064", @"号段：1065", @"号段：1066", @"号段：10690" ,@"号段：1069（5-8）", @"号段：10699", nil];
                NSArray *nameArray = [NSArray arrayWithObjects:@"用途:省内经营性短消息类服务", @"用途:省内非经营性短消息类服务接入平台", @"用途:省内非经营性短消息类服务", @"用途:省内公益性短消息类服务", @"用途:机器通信号码", @"用途:基础运营商自营业务", @"用途:跨省/全国范围内经营性短消息类服务", @"用途:跨省/全国范围内非经营性短消息类服务接入平台", @"用途:跨省/全国性非经营性短消息类服务", @"用途:跨省/全国范围内公益性短消息类服务", nil];
                NSArray *bitArray = [NSArray arrayWithObjects:@"位长：8", @"位长：8", @"位长：12", @"位长：8", @"位长：5", @"位长：8", @"位长：8", @"位长：8", @"位长：12", @"位长：8", nil];
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for (int i = 0; i < 10; i++) {
                    RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]init];
                    c_code_model.CODE = [codeArray objectAtIndex:i];
                    c_code_model.CUS_NAME = [nameArray objectAtIndex:i];
                    c_code_model.EXPIRETIME = [bitArray objectAtIndex:i];
                    [array addObject:c_code_model];
                    [c_code_model release];
                }
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = array;
                self.list = locQuery_A95Adapter.list;
                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
                [array release];
            } else if (inputType == InputType_B) {
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"code";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_BWithCode:searchInput] sortedArrayUsingComparator:cmptr];
                self.list = locQuery_A95Adapter.list;

                
                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
               
                
            } else if (inputType == InputType_C || inputType == InputType_C2) {
                longDistanceCodeAdapter = [[LongDistanceCodeAdapter alloc]init];
                longDistanceCodeAdapter.delegate = self;
                if (inputType == InputType_C) {
                    longDistanceCodeAdapter.list = [[RITTDatabaseOperation sharedInstance] findByCODE_CWithCode:searchInput];
                } else if (inputType == InputType_C2) {
                    longDistanceCodeAdapter.list = [[RITTDatabaseOperation sharedInstance] findByCODE_C2WithCode:searchInput];
                }
                self.list = longDistanceCodeAdapter.list;

                resultTableView.delegate = longDistanceCodeAdapter;
                resultTableView.dataSource = longDistanceCodeAdapter;
                
                
            } else if (inputType == InputType_D) {
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"code";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_DWithCode:searchInput mid:searchInput_param2] sortedArrayUsingComparator:cmptr];
                self.list = locQuery_A95Adapter.list;

                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
                

            } else if (inputType == InputType_E) {
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"code";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_EWithCode:searchInput mid:searchInput_param2] sortedArrayUsingComparator:cmptr];
 
                self.list = locQuery_A95Adapter.list;

                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
                
            } else if (inputType == InputType_F) {
                locQuery_GAdapter = [[LocQuery_GAdapter alloc]init];
                locQuery_GAdapter.delegate = self;
//                locQuery_GAdapter.type = @"code";
                locQuery_GAdapter.delegate = self;
                locQuery_GAdapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_FWithCode:searchInput mid:searchInput_param2] sortedArrayUsingComparator:cmptr];
                self.list = locQuery_GAdapter.list;

                
                resultTableView.delegate = locQuery_GAdapter;
                resultTableView.dataSource = locQuery_GAdapter;
                
            } else if (inputType == InputType_G) {
                locQuery_GAdapter = [[LocQuery_GAdapter alloc]init];
                locQuery_GAdapter.delegate = self;
                locQuery_GAdapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_GWithCode:searchInput] sortedArrayUsingComparator:cmptr];
//                locQuery_GAdapter.type = @"code";
                self.list = locQuery_GAdapter.list;

                resultTableView.delegate = locQuery_GAdapter;
                resultTableView.dataSource = locQuery_GAdapter;
            } else if (inputType == InputType_IPv4) {
                ipAdapter = [[IPAdapter alloc]init];
                ipAdapter.list = [[RITTDatabaseOperation sharedInstance] findWithIpInfo:searchInput];
                
                self.list = ipAdapter.list;

                resultTableView.delegate = ipAdapter;
                resultTableView.dataSource = ipAdapter;
                
            } else if (inputType == InputType_IPv4_2) {
                ipAdapter = [[IPAdapter alloc]init];
                ipAdapter.list = [[RITTDatabaseOperation sharedInstance] findByIPV4_2WithCodeNum_2_start:searchInput codeNum_2_end:searchInput_param2];
                self.list = ipAdapter.list;

                resultTableView.delegate = ipAdapter;
                resultTableView.dataSource = ipAdapter;
            } else if (inputType == InputType_all) {
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"code";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = [[[RITTDatabaseOperation sharedInstance] findByCODE_ALLWithCode:searchInput] sortedArrayUsingComparator:cmptr];
                
                self.list = locQuery_A95Adapter.list;
                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
                
            } else if (inputType == InputType_domain) {
                [[NetRequest sharedInstance]domain:searchInput];
                [[NetRequest sharedInstance]setDelegate:self];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (inputType != InputType_domain) {
                    if ([self.list count] == 0) {
                        [AlertView updateMBProgressHUDWithMessage:@"没有查询到相关记录，请重新查询"];
                        // 延迟2秒执行：
                        double delayInSeconds = 1.5;
                        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            // code to be executed on the main queue after delay
                            [AlertView hideMBProgressHUD];
                        });
                    } else {
                        if (inputType != InputType_domain) {
                            [AlertView hideMBProgressHUD];
                        }
                        isPush = NO;
                        [resultTableView reloadData];
                    }
                } else {
                    isPush = NO;
                    [resultTableView reloadData];
                }
                
            });
        });
    }
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

//码号详情
- (void)showCodeDetail:(NSString *)mme_eid withCode:(NSString *)code
{
    RITTSearchResultDetailViewController *searchResultDetailViewController = [[RITTSearchResultDetailViewController alloc]init];
    searchResultDetailViewController.mme_eid = mme_eid;
    searchResultDetailViewController.type = @"code";
    if ([code rangeOfString:@"("].location != NSNotFound) {
        searchResultDetailViewController.titleViewContent = [code substringToIndex:[code rangeOfString:@"("].location];
    } else {
        searchResultDetailViewController.titleViewContent = code;
    }
    
    [self.navigationController pushViewController:searchResultDetailViewController animated:YES];
    [searchResultDetailViewController release];
}

//域名详情
- (void)showDomainDetail:(NSString *)domain
{
    RITTSearchResultDetailViewController *searchResultDetailViewController = [[RITTSearchResultDetailViewController alloc]init];
    searchResultDetailViewController.domain_name = domain;
    searchResultDetailViewController.type = @"domain";
    searchResultDetailViewController.titleViewContent = @"域名查询";
    [self.navigationController pushViewController:searchResultDetailViewController animated:YES];
    [searchResultDetailViewController release];
}

//95号码详情
- (void)show95Detail:(NSString *)code
{
    RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
    searchResultViewController.searchInput = code;
    searchResultViewController.inputType = InputType_A;
    searchResultViewController.isPush = YES;
    searchResultViewController.titleViewContent = @"95号码";
    [self.navigationController pushViewController:searchResultViewController animated:YES];
    [searchResultViewController release];
}

#pragma mark - NetRequestProtocol
- (void)netRequestFinished:(NSMutableDictionary *)data withAct:(int)act
{
    switch (act) {
        case ReqAct_domain:
        {
            
            NSArray *dataArray = (NSArray *)data;
            if ([dataArray count] > 0) {
                NSMutableArray *domainArray = [NSMutableArray array];
                //域名查询bj，返回条数太多，防止崩溃，最多显示1000条数据
                for (int i = 0; i < [data count]; i++) {
                    RITT_C_DOMAIN_Model *c_domain_model = [[RITT_C_DOMAIN_Model alloc]init];
                    c_domain_model.ID = [[dataArray objectAtIndex:i]objectAtIndex:0];
                    c_domain_model.DOMAIN_NAME = [[dataArray objectAtIndex:i] objectAtIndex:2];
                    c_domain_model.DOMAIN_STATUS = [[dataArray objectAtIndex:i]objectAtIndex:1];
                    c_domain_model.ORE_NAME = [[dataArray objectAtIndex:i]objectAtIndex:4];
                    c_domain_model.REGISTRANT = [[dataArray objectAtIndex:i]objectAtIndex:3];
                    c_domain_model.NAME_SERVER = [[dataArray objectAtIndex:i]objectAtIndex:5];
                    c_domain_model.REG_TIME = [[dataArray objectAtIndex:i]objectAtIndex:6];
                    c_domain_model.UPDATE_TIME = [[dataArray objectAtIndex:i]objectAtIndex:7];
                    [domainArray addObject:c_domain_model];
                    [c_domain_model release];
                }
                locQuery_A95Adapter = [[LocQuery_A95Adapter alloc]init];
                locQuery_A95Adapter.delegate = self;
                locQuery_A95Adapter.type = @"domain";
                locQuery_A95Adapter.showDetaildelegate = self;
                locQuery_A95Adapter.list = domainArray;
                resultTableView.delegate = locQuery_A95Adapter;
                resultTableView.dataSource = locQuery_A95Adapter;
                [resultTableView reloadData];
                [AlertView hideMBProgressHUD];
                
            }

            if (!data || [data isKindOfClass:[NSNull class]] || [locQuery_A95Adapter.list count] == 0) {
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
//            [AlertView hideMBProgressHUD];
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
//            [AlertView hideMBProgressHUD];
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
