 //
//  RITTHomeViewController.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-10.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTHomeViewController.h"
#import "FMDatabase.h"
#import "RITTDatabaseOperation.h"
#import "RITT_C_CODE_Model.h"
#import "Reachability.h"
#import "AFViewShaker.h"
#import "RITT_C_DB_INFO_Model.h"
#import "RITTSearchResultViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "DBInfoView.h"
#import "LongDistanceCodeAdapter.h"
#import "RegExCategories.h"
#import "RITT_C_PROVINCE_Model.h"
#import "InputExpression.h"
#import "ChooseProvinceView.h"

@interface RITTHomeViewController () <UITextFieldDelegate>

@property (nonatomic, retain) UITextField *inputTextField;  //查询输入
@property (nonatomic, retain) UIButton *searchButton;   //查询按钮
@property (nonatomic, retain) AFViewShaker *afViewShaker;   //震动控件
@property (nonatomic, retain) RITT_C_DB_INFO_Model *c_db_info_model;
@property (nonatomic, retain) DBInfoView *dbInfoView;   //数据库信息显示
@property (nonatomic, retain) UILabel *tipLabel;    //提示语
@property (nonatomic, assign) InputType inputType;  //输入类型
@property (nonatomic, assign) BOOL inputStatus; //输入状态
@property (nonatomic, retain) ChooseProvinceView *chooseProvinceView;   //选择省份UI
@property (nonatomic, retain) NSArray *provinceArray;   //省份数组
@property (nonatomic, retain) UIImageView *logoImageView;   //logo
@property (nonatomic, retain) UIImageView *rightImageView;

@end

@implementation RITTHomeViewController

@synthesize inputTextField;
@synthesize searchButton;
@synthesize afViewShaker;
@synthesize c_db_info_model;

@synthesize dbInfoView;
@synthesize tipLabel;
@synthesize inputType;
@synthesize inputStatus;
@synthesize provinceArray;

@synthesize chooseProvinceView;

@synthesize logoImageView;
@synthesize rightImageView;

- (void)dealloc
{
    [inputTextField release], inputTextField = nil;
    [afViewShaker release], afViewShaker = nil;
    
    [c_db_info_model release], c_db_info_model = nil;
    
    [dbInfoView release], dbInfoView = nil;
    
    [tipLabel release], tipLabel = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
    [chooseProvinceView release], chooseProvinceView = nil;
    [provinceArray release], provinceArray = nil;
    [logoImageView release], logoImageView = nil;
    
    [rightImageView release], rightImageView = nil;

    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor lightGrayColor];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEndEditing:) name:UITextFieldTextDidEndEditingNotification object:inputTextField];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    [self generateUI];
    
    provinceArray = [[NSArray alloc]init];

    
    //获取数据库总体信息
    c_db_info_model = [[RITTDatabaseOperation sharedInstance] totalCountDB_Info];
    [dbInfoView dbInfoWithCodeCount:c_db_info_model.CODE_COUNT ipCount:c_db_info_model.IP_COUNT domainCount:c_db_info_model.DOMAIN_COUNT];
    
    //获取全部省份
    self.provinceArray = [[RITTDatabaseOperation sharedInstance] findProvinceAll];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    chooseProvinceView.hidden = YES;
    inputTextField.hidden = NO;
    tipLabel.hidden = NO;
    searchButton.hidden = NO;
    dbInfoView.hidden = NO;
    
    //每次回退到这个页面都恢复到初始状态
    inputTextField.text = @"";
    tipLabel.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 生成界面UI
- (void)generateUI
{
    
    //生成navBarUI
    [self generateNavBarUIWithLeftImage:nil rightImage:[UIImage imageNamed:@"home_setting"] titleText:@"" target:self];
    
    //logo
    logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(45, kNavBarHeight + kStatusBarHeight + 40, 227, 64)];
    if (kIsFourInchScreen) {
        logoImageView.frame = CGRectMake(45, kNavBarHeight + kStatusBarHeight + 44 + 40, 227, 64);
    }
    logoImageView.image = [UIImage imageNamed:@"home_logo"];
    [self.view addSubview:logoImageView];
    
    //输入框
    inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(8, 256 - 44, self.view.frame.size.width - 54 - 8, 35)];
    inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    inputTextField.delegate = self;
    inputTextField.clearButtonMode = UITextFieldViewModeAlways;
    [inputTextField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    if (kIsFourInchScreen) {
        inputTextField.frame = CGRectMake(8, 256, self.view.frame.size.width - 54 - 8, 35);
    }
    inputTextField.placeholder = @"查询：IP、码号、区号、域名";
    inputTextField.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:inputTextField];
    
    //放大镜图标
    rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(inputTextField.frame.size.width - 32, 2, 30, 30)];
    rightImageView.image = [UIImage imageNamed:@"home_searchIcon"];
    [inputTextField addSubview:rightImageView];

    
    //提示框
    tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(inputTextField.frame) + 60, CGRectGetMinY(inputTextField.frame) - 20, 100, 20)];
    tipLabel.textColor = [UIColor colorWithRed:178.0 / 255.0 green:178.0 / 255.0 blue:178.0 / 255.0 alpha:1.0f];
    tipLabel.numberOfLines = 0;
    tipLabel.lineBreakMode = NSLineBreakByWordWrapping;
    tipLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:tipLabel];
    
    //查询按钮
    searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.frame = CGRectMake(CGRectGetMaxX(inputTextField.frame) + 4, CGRectGetMinY(inputTextField.frame), 44, 35);
    [searchButton setBackgroundImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateHighlighted];
    [searchButton addTarget:self action:@selector(searchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    //数据库总体信息
    dbInfoView = [[DBInfoView alloc]initWithFrame:CGRectMake(75, CGRectGetMaxY(inputTextField.frame) + 50, 200, 100)];
    [self.view addSubview:dbInfoView];
    
    //选择省份界面
    chooseProvinceView = [[ChooseProvinceView alloc]initWithFrame:CGRectMake(10, 220, self.view.frame.size.width - 20, 6 * 25 + 20 + 7)];
    chooseProvinceView.userInteractionEnabled = YES;
    chooseProvinceView.hidden = YES;
    [self.view addSubview:chooseProvinceView];
    
    //省份按钮
    [chooseProvinceView.beijingButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.tianjinButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.hebeiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.shanxiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.neimengguButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.guangdongButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.guangxiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.henanButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.hubeiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.hunanButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.hainanButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.shanghaiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.jiangsuButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.zhejiangButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.anhuiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.fujianButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.jiangxiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.shandongButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.chongqingButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.sichuanButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.guizhouButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.yunnanButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.xizangButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.liaoningButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.jilinButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.heilongjiangButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.shannxiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.gansuButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.qinghaiButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.ningxiaButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    [chooseProvinceView.xinjiangButton addTarget:self action:@selector(chooseProvince:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
#pragma mark - 选择省份
- (void)chooseProvince:(UIButton *)button
{
    for (int i = 0; i < [provinceArray count]; i++) {
        if ([((RITT_C_PROVINCE_Model *)[provinceArray objectAtIndex:i]).CUS_NAME rangeOfString:button.titleLabel.text].location != NSNotFound) {
            RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
            searchResultViewController.searchInput = inputTextField.text;
            searchResultViewController.searchInput_param2 = ((RITT_C_PROVINCE_Model *)[provinceArray objectAtIndex:i]).MME_EID
            ;
            searchResultViewController.titleViewContent = ((RITT_C_PROVINCE_Model *)[provinceArray objectAtIndex:i]).CUS_NAME;
            searchResultViewController.inputType = inputType;
            searchResultViewController.isPush = YES;
            [self.navigationController pushViewController:searchResultViewController animated:YES];
            [searchResultViewController release];
        }
    }
}

#pragma mark - 查询按钮
- (void)searchButton:(UIButton *)button
{
    if ([inputTextField.text isEqualToString:@""] || !inputStatus) {
        afViewShaker = [[AFViewShaker alloc]initWithView:inputTextField];
        [afViewShaker shake];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    } else {
        switch (inputType) {
            case InputType_A_95:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = inputTextField.text;
                searchResultViewController.inputType = InputType_A_95;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"95规划";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];

            }
                break;
            case InputType_A:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = inputTextField.text;
                searchResultViewController.inputType = InputType_A;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"95号码";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_B_106:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = inputTextField.text;
                searchResultViewController.inputType = InputType_B_106;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"106规划";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_B:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = inputTextField.text;
                searchResultViewController.inputType = InputType_B;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = [NSString stringWithFormat:@"%@接入代码", inputTextField.text];
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_C:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = [inputTextField.text substringFromIndex:1];
                searchResultViewController.inputType = InputType_C;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"长途区号";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_C2:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = inputTextField.text;
                searchResultViewController.inputType = InputType_C2;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"长途区号";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_D:
            {
                chooseProvinceView.hidden = NO;
                inputTextField.hidden = YES;
                tipLabel.hidden = YES;
                searchButton.hidden = YES;
                dbInfoView.hidden = YES;
                [inputTextField resignFirstResponder];
            }
                break;
            case InputType_E:
            {
                chooseProvinceView.hidden = NO;
                inputTextField.hidden = YES;
                tipLabel.hidden = YES;
                searchButton.hidden = YES;
                dbInfoView.hidden = YES;
                [inputTextField resignFirstResponder];
            }
                break;
            case InputType_F:
            {
                chooseProvinceView.hidden = NO;
                inputTextField.hidden = YES;
                tipLabel.hidden = YES;
                searchButton.hidden = YES;
                dbInfoView.hidden = YES;
                [inputTextField resignFirstResponder];
            }
                break;
            case InputType_G:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = [inputTextField.text substringToIndex:7];
                searchResultViewController.inputType = InputType_G;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"公众移动通信网网号查询";

                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_all:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = inputTextField.text;
                searchResultViewController.inputType = InputType_all;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"码号查询";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];

            }
                break;
            case InputType_IPv4:
            {
                NSArray *ipArray = [inputTextField.text componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                NSString *ip0 = [ipArray objectAtIndex:0];
                NSString *ip1 = [ipArray objectAtIndex:1];
                NSString *ip2 = [ipArray objectAtIndex:2];
                NSString *ip3 = [ipArray objectAtIndex:3];
                long long ipCode = (long long)([ip0 longLongValue]) * (long long)256 * (long long)256 * (long long)256 + (long long)([ip1 longLongValue]) * (long long)256 * (long long)256 + (long long)([ip2 longLongValue]) * (long long)256 + (long long)([ip3 longLongValue]) ;
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = [NSString stringWithFormat:@"%lld", ipCode];
                searchResultViewController.inputType = InputType_IPv4;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = inputTextField.text;
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_IPv4_2:
            {
                long long ipCode_start = 0l;
                long long ipCode_end = 0l;
                if ([inputTextField.text isMatch:RX(kRegexIPv4_2)]) {
                    NSArray *ipArray = [inputTextField.text componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    NSString *ip0 = [ipArray objectAtIndex:0];
                    NSString *ip1 = [ipArray objectAtIndex:1];
                    ipCode_start = (long long)([ip0 longLongValue]) * (long long)256 * (long long)256 * (long long)256 + (long long)([ip1 longLongValue]) * (long long)256 * (long long)256;
                    ipCode_end = ipCode_start + (long long)255 * (long long)256 + (long long)255;
                }
                if ([inputTextField.text isMatch:RX(kRegexIPv4_3)]) {
                    NSArray *ipArray = [inputTextField.text componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    NSString *ip0 = [ipArray objectAtIndex:0];
                    NSString *ip1 = [ipArray objectAtIndex:1];
                    NSString *ip2 = [ipArray objectAtIndex:2];
                    ipCode_start = (long long)([ip0 longLongValue]) * (long long)256 * (long long)256 * (long long)256 + (long long)([ip1 longLongValue]) * (long long)256 * (long long)256 + (long long)([ip2 longLongValue]) * (long long)256;
                    ipCode_end = ipCode_start + (long long)255;
                }
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                searchResultViewController.searchInput = [NSString stringWithFormat:@"%lld", ipCode_start];
                searchResultViewController.searchInput_param2 = [NSString stringWithFormat:@"%lld", ipCode_end];
                searchResultViewController.inputType = InputType_IPv4_2;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = inputTextField.text;
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            case InputType_IPv6:
            {
                //暂时不做
            }
                break;
            case InputType_domain:
            {
                RITTSearchResultViewController *searchResultViewController = [[RITTSearchResultViewController alloc]init];
                if ([inputTextField.text hasPrefix:@"www."] || [inputTextField.text hasPrefix:@"Www"]) {
                    searchResultViewController.searchInput = [[[inputTextField.text substringFromIndex:4]lowercaseString]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                } else {
                    searchResultViewController.searchInput = [[inputTextField.text lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//                    searchResultViewController.searchInput = inputTextField.text;
                }
                
                searchResultViewController.inputType = InputType_domain;
                searchResultViewController.isPush = YES;
                searchResultViewController.titleViewContent = @"域名查询";
                [self.navigationController pushViewController:searchResultViewController animated:YES];
                [searchResultViewController release];
            }
                break;
            default:
                break;
        }
    }
}

#pragma mark - 返回按钮
- (void)leftButton:(UIButton *)button   //主页没有返回按钮
{
    NSLog(@"other left");
}
#pragma mark - 
- (void)textFieldEditChanged:(UITextField *)textField
{
    if ([textField.text isMatch:RX(@"^[\u4E00-\u9FA5]$")]) {
        if (inputTextField.text.length < 2) {
            inputStatus = false;
            tipLabel.text = @"查询长途区号，请输入至少2字符中文地名";
        } else if (inputTextField.text.length < 6) {
            inputStatus = true;
            inputType = InputType_C2;
            tipLabel.text = @"查询长途区号";
        } else {
            inputStatus = false;
            tipLabel.text = @"您输入的地址名过长";
        }
    }
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    tipLabel.text = @"";
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    //中文判断
    if ([inputTextField.text isMatch:RX(@"^[\u4E00-\u9FA5]")]) {
        if (text.length < 2) {
            inputStatus = false;
            tipLabel.text = @"查询长途区号，请输入至少2字符中文地名";
        } else if (text.length < 6) {
            inputStatus = true;
            inputType = InputType_C2;
            tipLabel.text = @"查询长途区号";
        } else {
            inputStatus = false;
            tipLabel.text = @"您输入的地址名过长";
        }
    }

    return YES;
}

- (void)textFieldChange:(id)sender
{
    rightImageView.hidden = YES;
    
    if (![InputExpression isPutRight:inputTextField.text] && ![inputTextField.text isEqualToString:@""]) {
        inputStatus = false;
        tipLabel.text = @"请输入IP、码号、区号、域名查询";
    }
    
    //长途区号反查
    if ([inputTextField.text isMatch:RX(@"^[\u4E00-\u9FA5]")]) {
        if (inputTextField.text.length < 2) {
            inputStatus = false;
            tipLabel.text = @"查询长途区号，请输入至少2字符中文地名";
        } else if (inputTextField.text.length < 6) {
            inputStatus = true;
            inputType = InputType_C2;
            tipLabel.text = @"查询长途区号";
        } else {
            inputStatus = false;
            tipLabel.text = @"您输入的地址名过长";
        }
    }
    
    //域名1：全英文
    if ([InputExpression containsEnglish:inputTextField.text] || [InputExpression checkNameEnglish:inputTextField.text]) {
        inputStatus = true;
        inputType = InputType_domain;
        tipLabel.text = [NSString stringWithFormat:@"查询包含%@的域名", inputTextField.text];
    }
    //域名2：需要后缀
    if ([InputExpression domainNeedEnd:inputTextField.text]) {
        
        if ([InputExpression inputIsDomainEnds:inputTextField.text]) {
            inputStatus = true;
            inputType = InputType_domain;
            tipLabel.text = [NSString stringWithFormat:@"查询域名:%@", inputTextField.text];
        } else {
            inputStatus = false;
            inputType = InputType_domain;
            tipLabel.text = @"请输入正确的域名后缀，如.com等";
        }

    }
    
    
    
    //ipv4
    if ([InputExpression inputIsIPv4:inputTextField.text] || [inputTextField.text rangeOfString:@":"].location != NSNotFound) {
        if ([inputTextField.text isMatch:RX(kRegexIPv4_2)] || [inputTextField.text isMatch:RX(kRegexIPv4_3)]) {
            inputType = InputType_IPv4_2;
            inputStatus = YES;
            tipLabel.text = @"查询IP地址段";
            return;
        }
        
        //ipv4
        else if ([inputTextField.text isMatch:RX(kRegexIPv4)]) {
            inputType = InputType_IPv4;
            inputStatus = YES;
            tipLabel.text = @"查询IP地址";
            return;
        } else {
            inputStatus = NO;
            tipLabel.text = @"请输入正确的IP地址";
            return;
        }
        
    }
    
    
    
    //纯数字查询
    if ([inputTextField.text isMatch:RX(@"^[0-9]*$")]) {
        if (inputTextField.text.length < 2) {
            tipLabel.text = @"请输入至少2位查询码";
            inputStatus = false;
        }
        if (inputTextField.text.length == 2) {
            //需求A全国短号码
            if ([inputTextField.text isEqualToString:@"95"]) {
                tipLabel.text = @"查询全国短号码95规划、\n输入查询95XXX/95XXXX全国短号码";
                inputType = InputType_A_95;
                inputStatus = true;
            } else if ([inputTextField.text isEqualToString:@"12"]) {
                tipLabel.text = @"请至少输入3位查询12XXX全国短号码";
                inputStatus = false;
            } else if ([inputTextField.text isEqualToString:@"10"]) {   //需求B全国短消息、需求E
                tipLabel.text = @"请至少输入3位查询以10开头的号码";
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"0[0-9]")]) {   //需求C长途区号
                tipLabel.text = @"请至少输入3位查询长途区号";
                inputStatus = false;
            } else if ([inputTextField.text isEqualToString:@"96"]) {   //需求D省内短号码
                tipLabel.text = @"请至少输入3位查询\n96XXX/96XXXX省内短号码";
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"[2-8][0-9]")]) {   //需求F局号
                tipLabel.text = @"请至少输入3位查询局号/固定电话号码";
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"1[34578]")]) {
                tipLabel.text = @"请至少输入7位查询移动用户号码";
                inputStatus = false;
            } else {
                tipLabel.text = @"请至少输入3位查询";
                inputStatus = false;
            }
        }
        if (inputTextField.text.length == 3) {
            //需求全国短号码
            if ([inputTextField.text isMatch:RX(@"95[0-9]")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@XX/%@XXX全国短号码", inputTextField.text, inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"12[13]")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@XX全国短号码", inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isEqualToString:@"106"]) {  //需求B全国短消息、需求E
                tipLabel.text = @"查询106规划\n输入查询全国短号码、省内短消息号码";
                inputType = InputType_B_106;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"0[0-9][0-9]")]) {  //需求C长途区号
                tipLabel.text = @"查询长途区号";
                inputType = InputType_C;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"96[0-9]")]) {  //需求D省内短号码
                tipLabel.text = [NSString stringWithFormat:@"查询%@XX/%@XXX省内短号码", inputTextField.text, inputTextField.text];
                inputType = InputType_D;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"[2-8][0-9][0-9]")]) {  //需求F局号
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@查询", string];
                if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"[2-8]00")]) {
                    inputType = InputType_all;
                    inputStatus = true;
                } else {
                    inputType = InputType_F;
                    inputStatus = true;
                }
            } else if ([inputTextField.text isMatch:RX(@"1[34578][0-9]")]) {    //需求G移动
                tipLabel.text = @"公众移动通信网网号\n请至少输入7位查询移动用户号码";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length == 4) {
            if ([inputTextField.text isMatch:RX(@"12[13][0-9]")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@X全国短号码", inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"95[0-9]{2}")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@X/%@XX全国短号码", inputTextField.text, inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"106[0-9]")]) {
                tipLabel.text = @"查询106规划\n输入查询全国短消息号码/省内短消息号码";
                inputType = InputType_B_106;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"0[0-9]{3}")]) {
                tipLabel.text = @"查询长途区号";
                inputType = InputType_C;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"96[0-9]{2}")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@X/%@XX省内短号码", inputTextField.text, inputTextField.text];
                inputType = InputType_D;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"[2-8][0-9]{3}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@查询", string];
                if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"[2-8]00")]) {
                    inputType = InputType_all;
                    inputStatus = true;
                } else {
                    inputType = InputType_F;
                    inputStatus = true;
                }
            } else if ([inputTextField.text isMatch:RX(@"1[34578][0-9]{2}")]) {
                tipLabel.text = @"请至少输入7位查询移动用户号码";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length == 5) {
            if ([inputTextField.text isMatch:RX(@"12[13][0-9]{2}")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@全国短号码", inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"95[0-9]{3}")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@/%@X全国短号码", inputTextField.text, inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"106[69][0-9]")]) {
                tipLabel.text = @"查询全国短消息号码";
                inputType = InputType_B;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"0[0-9]{4}")]) {
                tipLabel.text = @"输入的长途区号应小于5位";
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"96[0-9]{3}")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@/%@X省内短号码", inputTextField.text, inputTextField.text];
                inputType = InputType_D;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"1062[0-9]")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputType = InputType_E;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"1063[5678]")]) {
                tipLabel.text = [NSString stringWithFormat:@"请至少输入6位查询%@开头的省内短消息号码", inputTextField.text];
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"[2-8][0-9]{4}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@查询", string];
                if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"[2-8]00")]) {
                    inputType = InputType_all;
                    inputStatus = true;
                } else {
                    inputType = InputType_F;
                    inputStatus = true;
                }
            } else if ([inputTextField.text isMatch:RX(@"1[34578][0-9]{3}")]) {
                tipLabel.text = @"请至少输入7位查询移动用户号码";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length == 6) {
            if ([inputTextField.text isMatch:RX(@"12[13][0-9]{3}")]) {
                tipLabel.text = @"输入的全国短号码应小于6位";
                inputType = InputType_A;
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"95[0-9]{4}")]) {
                tipLabel.text = [NSString stringWithFormat:@"查询%@全国短号码", inputTextField.text];
                inputType = InputType_A;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"106[69][0-9]{2}")]) {
                tipLabel.text = @"查询全国短消息号码";
                inputType = InputType_B;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"0[0-9]{5}")]) {
                tipLabel.text = @"输入的长途区号应小于5位";
                inputStatus = false;
            } else if ([inputTextField.text isMatch:RX(@"96[0-9]{4}")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"106[23][0-9]{2}")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputType = InputType_E;
                inputStatus = true;
            } else if ([inputTextField.text isMatch:RX(@"[2-8][0-9]{5}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@查询", string];
                if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"[2-8]00")]) {
                    inputType = InputType_all;
                    inputStatus = true;
                } else {
                    inputType = InputType_F;
                    inputStatus = true;
                }
            } else if ([inputTextField.text isMatch:RX(@"1[34578][0-9]{4}")]) {
                tipLabel.text = @"请至少输入7位查询移动用户号码";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length > 6 && inputTextField.text.length < 9) {
            if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"12[13][0-9]{4}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"95[0-9]{5}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[69][0-9]{3}")]) {
                tipLabel.text = @"查询全国短消息号码";
                inputType = InputType_B;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"0[0-9]{6}")]) {
                tipLabel.text = @"输入的长途区号应小于5位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"96[0-9]{5}")]) {
                tipLabel.text = @"查询省内短消息号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[23][0-9]{3}")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputType = InputType_E;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"[2-8][0-9]{6}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@查询", string];
                if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"[2-8]00")]) {
                    inputType = InputType_all;
                    inputStatus = true;
                } else {
                    inputType = InputType_F;
                    inputStatus = true;
                }
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"1[34578][0-9]{5}")]) {
                tipLabel.text = @"查询移动用户号码";
                inputType = InputType_G;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length > 8 && inputTextField.text.length < 12) {
            if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"12[13][0-9]{4}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"95[0-9]{5}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[69][0-9]{3}")]) {
                tipLabel.text = @"查询全国短消息号码";
                inputType = InputType_B;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"0[0-9]{6}")]) {
                tipLabel.text = @"输入的长途区号应小于5位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"96[0-9]{5}")]) {
                tipLabel.text = @"查询省内短消息号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[23][0-9]{3}")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputType = InputType_E;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"[2-8][0-9]{6}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@应小于9位", string];
                inputType = InputType_F;
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"1[34578][0-9]{5}")]) {
                tipLabel.text = @"查询移动用户号码";
                inputType = InputType_G;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length == 12) {
            if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"12[13][0-9]{4}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"95[0-9]{5}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[69][0-9]{3}")]) {
                tipLabel.text = @"查询全国短消息号码";
                inputType = InputType_B;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"0[0-9]{6}")]) {
                tipLabel.text = @"输入的长途区号应小于5位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"96[0-9]{5}")]) {
                tipLabel.text = @"查询省内短消息号码应小于6位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[23][0-9]{3}")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputType = InputType_E;
                inputStatus = true;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"[2-8][0-9]{6}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@应小于9位", string];
                inputType = InputType_F;
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"1[34578][0-9]{5}")]) {
                tipLabel.text = @"查询移动用户号码应小于12位";
                inputType = InputType_G;
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length > 12 && inputTextField.text.length <= 20) {
            if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"12[13][0-9]{4}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"95[0-9]{5}")]) {
                tipLabel.text = @"输入的全国短号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[69][0-9]{3}")]) {
                tipLabel.text = @"查询全国短消息号码";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"0[0-9]{6}")]) {
                tipLabel.text = @"输入的长途区号应小于5位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"96[0-9]{5}")]) {
                tipLabel.text = @"查询省内短消息号码应小于7位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"106[23][0-9]{3}")]) {
                tipLabel.text = @"查询省内短消息号码";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"[2-8][0-9]{6}")]) {
                NSString *string = [self guihua_2_8XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@应小于9位", string];
                inputType = InputType_F;
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:7] isMatch:RX(@"1[34578][0-9]{5}")]) {
                tipLabel.text = @"查询移动用户号码应小于12位";
                inputStatus = false;
            } else if ([[inputTextField.text substringToIndex:3] isMatch:RX(@"1[0-9][0-9]")]) {
                NSString *string = [self guihua_1XX:inputTextField.text];
                tipLabel.text = [NSString stringWithFormat:@"%@\n码号查询", string];
                inputType = InputType_all;
                inputStatus = true;
            } else {
                tipLabel.text = @"码号查询";
                inputType = InputType_all;
                inputStatus = true;
            }
        }
        if (inputTextField.text.length > 20) {
            tipLabel.text = @"您输入的号码过长";
            inputStatus = false;
        }
    }
    
    
    if ([inputTextField.text isEqualToString:@""]) {
        rightImageView.hidden = NO;
        tipLabel.text = @"";
        
    }
    
    tipLabel.frame = CGRectMake(CGRectGetMinX(inputTextField.frame) + 30, CGRectGetMinY(inputTextField.frame) - [self heightForString:tipLabel.text fontSize:12.0 width:250] - 10, 250, [self heightForString:tipLabel.text fontSize:12.0 width:250]);
    tipLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - 其他号码说明
- (NSString *)guihua_1XX:(NSString *)code
{
    code = [code substringToIndex:3];
    if ([code isEqualToString:@"111"]) {
        return @"社会服务类（含邮政服务）";
    }
    else if ([code isEqualToString:@"112"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"113"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"114"]){
        return @"查号业务";
    }
    else if ([code isEqualToString:@"115"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"116"]){
        return @"运营商业务代码";
    }
    else if ([code isEqualToString:@"117"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"118"]){
        return @"运营商业务代码";
    }
    else if ([code isEqualToString:@"119"]){
        return @"紧急业务";
    }
    
    else if ([code isEqualToString:@"110"]){
        return @"紧急业务";
    }
    else if ([code isEqualToString:@"121"]){
        return @"社会服务类";
    }
    else if ([code isEqualToString:@"122"]){
        return @"紧急业务";
    }
    else if ([code isEqualToString:@"123"]){
        return @"政府公务类";
    }
    else if ([code isEqualToString:@"124"]){
        return @"号码携带业务路由码";
    }
    else if ([code isEqualToString:@"125"]){
        return @"运营商业务代码";
    }
    else if ([code isEqualToString:@"126"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"127"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"128"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"129"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"120"]){
        return @"紧急业务";
	}
    else if ([code isMatch:RX(@"1[3-5][0-9]")]) {
        return @"公众移动通信网网号";
    }
    else if ([code isEqualToString:@"161"]){
        return @"数据类业务";
    }
    else if ([code isEqualToString:@"162"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"163"]){
        return @"互联网类业务";
    }
    else if ([code isEqualToString:@"164"]){
        return @"ATM/帧中继网号";
    }
    else if ([code isEqualToString:@"165"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"166"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"167"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"168"]){
        return @"电话信息服务";
    }
    else if ([code isEqualToString:@"169"]){
        return @"互联网类业务";
    }
    else if ([code isEqualToString:@"160"]){
        return @"电话信息服务";
	}
    else if ([code isMatch:RX(@"17[1-8]")]) {
        return @"公众移动通信网网号";
    }
    else if ([code isEqualToString:@"179"]){
        return @"IP电话类业务";
    }
    else if ([code isEqualToString:@"170"]){
        return @"公众移动通信网网号";
	}
    else if ([code isMatch:RX(@"18[0-9]")]) {
        return @"公众移动通信网网号";
    }
    else if ([code isEqualToString:@"191"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"192"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"193"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"194"]){
        return @"ATM/帧中继网号";
    }
    else if ([code isEqualToString:@"195"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"196"]){
        return @"运营商识码CIC";
    }
    else if ([code isEqualToString:@"197"]){
        return @"运营商标识码CIC";
    }
    else if ([code isEqualToString:@"198"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"199"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"190"]){
        return @"运营商标识码CIC";
	}
    else if ([code isEqualToString:@"101"]){
        return @"运营商业务代码";
    }
    else if ([code isEqualToString:@"102"]){
        return @"运营商业务代码";
    }
    else if ([code isEqualToString:@"103"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"104"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"105"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"106"]){
        return @"短消息类服务接入代码";
    }
    else if ([code isEqualToString:@"107"]){
        return @"备用";
    }
    else if ([code isEqualToString:@"108"]){
        return @"国际直拨被叫付费、话务员受话付费和国际卡业务";
    }
    else if ([code isEqualToString:@"109"]){
        return @"国际话务员受话付费和国际卡业务";
    }
    else if ([code isEqualToString:@"100"]){
        return @"全国性基础电信运营商的客户服务类业务";
	}
    return @"";
}
- (NSString *)guihua_2_8XX:(NSString *)code
{
    NSString *myCode = [NSString stringWithString:[code substringToIndex:3]];
    if ([myCode isEqualToString:@"200"] || [myCode isEqualToString:@"201"]) {
        return @"本地电话卡智能业务、校园卡业务接入码";
    }
    else if ([myCode isEqualToString:@"300"]) {
        return @"备用";
    }
    else if ([myCode isEqualToString:@"400"]) {
        return @"主被叫分摊付费智能业务接入码";
    }
    else if ([myCode isEqualToString:@"500"]) {
        return @"备用";
    }
    else if ([myCode isEqualToString:@"600"]) {
        return @"国内虚拟专用网智能业务接入码";
    }
    else if ([myCode isEqualToString:@"700"]) {
        return @"通用个人通信智能业务接入码";
    }
    else if ([myCode isEqualToString:@"800"]) {
        return @"全国被叫集中付费智能业务接入码";
    }
    else if ([myCode isMatch:RX(@"[2-8]0[1-9]")]) {
		return	@"本地电话局号/省内智能业务接入码";
    }
    else if ([myCode isMatch:RX(@"[2-8][1-9][0-9]")]) {
		return	@"本地电话局号";
    }
    return @"";
}

#pragma mark - 点击任意位置关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [inputTextField resignFirstResponder];
}

#pragma mark - 计算text高度
- (float)heightForString:(NSString *)string fontSize:(float)fontSize width:(float)width
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    return sizeToFit.height;
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
