//
//  NetRequest.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "NetRequest.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "ASINetworkQueue.h"
#import "AlertView.h"

@interface NetRequest ()
{
    NetRequestAct requestAct;
}

@end

@implementation NetRequest

@synthesize delegate;

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

- (void)code:(NSString *)mme_eid
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"viewCode" forKey:kParam_name];
    [params setObject:mme_eid forKey:kParam_mme_eid];
    
    [self sendRequest:ReqAct_code params:params requestURLString:RequestURL(@"") requestForm:kRequestFormGET];
}

- (void)domain:(NSString *)domain
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"searchDomain" forKey:kParam_name];
    [params setObject:[domain stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:kParam_domain];
    
    [self sendRequest:ReqAct_domain params:params requestURLString:RequestURL(@"") requestForm:kRequestFormGET];
}

- (void)dbCheckForUpdate:(NSString *)dbSW
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:dbSW forKey:kParam_dbSW];
    [params setObject:@"DBdownload" forKey:kParam_name];
    [self sendRequest:ReqAct_dbCheckForUpdate params:params requestURLString:RequestURL(@"") requestForm:kRequestFormGET];
}

#pragma mark - 发送请求公共方法
/* @brief  发送请求公共方法
 * @param  currentReqId    请求ID, 参照NetRequest请求枚举
 * @param  params            上行参数列表
 * @param  requestString   接口地址
 * @param  method            发送请求方法GET/POST
 */
- (void)sendRequest:(NetRequestAct)netRequestAct params:(NSMutableDictionary*)params requestURLString:(NSString *)requestURLString requestForm:(NSString *)requestForm
{
    requestAct = netRequestAct;
    if ([requestForm isEqualToString:@"GET"]) {
        //GET请求
        NSString *URLString = [requestURLString stringByAppendingFormat:@"?"];
        // 设定上传参数,拼接URL
        NSEnumerator *enumerator = [params keyEnumerator];
        NSString* key;
        int objectNum = 1;//已经转换棏参数个数。最后一个参数不加'&'
        while ((key = [enumerator nextObject]))
        {
            NSString *value = [params objectForKey:key];
            URLString = [URLString stringByAppendingFormat:@"%@=%@", key, value];
            if (objectNum != [params count]) {
                URLString = [URLString stringByAppendingFormat:@"&"];
                objectNum++;
            }
        }
        NSLog(@"v2.0 - GET  requestURL:  %@",URLString);
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:URLString]];
        [request setDelegate:self];
        // 开始异步请求
        [request startAsynchronous];
    }
    else
    {
        //POST 请求
        NSURL *requestURL = [NSURL URLWithString:requestURLString];
        NSLog(@"v2.0 - POST  requestURL:  %@",requestURL);
        // 构建URL和请求对象
        ASIFormDataRequest *requestForm = [ASIFormDataRequest requestWithURL:requestURL];
        //超时时间为30秒
        [requestForm setShouldAttemptPersistentConnection:NO];
        // 设定上传参数  键值对的形式
        NSEnumerator *enumerator = [params keyEnumerator];
        NSString* key;
        while ((key = [enumerator nextObject]))
        {
            NSString* value = [params objectForKey:key];
            NSLog(@"Key:%@— value:%@\n",key,value);
            [requestForm setPostValue:value forKey:key];
        }
        [requestForm setDelegate:self];
        // 开始异步请求
        [requestForm startAsynchronous];
    }
}



#pragma mark - ASIHTTPRequestDelegate 请求回调函数
-(void)requestFinished:(ASIHTTPRequest *)request
{
    //    debugMethodLog([NSString stringWithFormat:@"**********requestFinished*******:%@,%@",[self reqIdStringForKey:currentReqId],self.delegate]);
        // 获取服务器返回的数据responseString
    NSString *resString = request.responseString;
    NSLog(@"responseString... : %@", resString);
    if(resString != nil && [resString length] != 0)
    {
        // 构建回传键值列表
        if ([delegate respondsToSelector:@selector(netRequestFinished:withAct:)]) {
            NSData *jsonData = [resString dataUsingEncoding:NSUTF8StringEncoding];
            [delegate netRequestFinished:[jsonData objectFromJSONData] withAct:requestAct];
        }
    }
    else
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
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"responseString... : %@", request.responseString);
    // 把errCode回传给前端
    NSError* error = [request error];
    NSLog(@"error :%@",error);
    NSInteger errCode = [error code];
    NSMutableDictionary* params = [[[NSMutableDictionary alloc] init]autorelease];
    [params setObject:[NSNumber numberWithInt:errCode] forKey:@"errCode"];
    if ([delegate respondsToSelector:@selector(netRequestFailed:withAct:)]) {
        [delegate netRequestFailed:params withAct:requestAct];
    }
}

@end
