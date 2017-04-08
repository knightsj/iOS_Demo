//
//  ViewController.m
//  das_demo
//
//  Created by Sun Shijie on 2017/4/1.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [self af];
//    [self original];
    
//    //确定请求路径
//    NSURL *url = [NSURL URLWithString:@"https://10.128.230.148:9443/analytics/table_exists?table=TEST"];
//    //创建 NSURLSession 对象
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    [session.HTTPAdditionalHeaders
//     NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:
//                                      ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                          
//                                          //解析服务器返回的数据
//                                          NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//                                          //默认在子线程中解析数据
//                                          NSLog(@"%@", [NSThread currentThread]);
//                                      }];
//    //发送请求（执行Task）
//    [dataTask resume];
    
    
}

- (void)af
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 可接受的文本参数规格
    //    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    //
//    NSData *usernameData = [@"admin"dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *username = [usernameData base64EncodedStringWithOptions:0];
//    
//    NSData *passwordData = [@"admin"dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *password = [passwordData base64EncodedStringWithOptions:0];
//    
//    NSString *authStr = [NSString stringWithFormat:@"%@:%@",@"admin",@"admin"];
//    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *authValue = [NSString stringWithFormat:@"Basic %@",[authData base64EncodedStringWithOptions:0]];
    
//    [manager.requestSerializer setValue:@"Basic YWRtaW46YWRtaW4=" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:@"https://10.128.231.239:9443/analytics/table_exists?table=TEST"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"success:%@",responseObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"%@",error.domain);
             NSLog(@"%ld",error.code);
         }];
    
    NSautore
}



- (void)original{
    // 构造URL资源地址
    NSURL *url = [NSURL URLWithString:@"http://10.128.231.239:9763/analytics/table_exists?table=TEST"];
                  // 创建Request请求
                  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                  // 配置Request请求
                  // 设置请求方法
                  [request setHTTPMethod:@"GET"];
                  // 设置请求超时 默认超时时间60s
                  [request setTimeoutInterval:10.0];
    
    // 设置头部参数
                  [request addValue:@"application/json" forHTTPHeaderField:@"Content-Encoding"];
                  [request addValue:@"Basic YWRtaW46YWRtaW4=" forHTTPHeaderField:@" "];
    
                  //或者下面这种方式 添加所有请求头信息
//                  request.allHTTPHeaderFields=@{@"Content-Encoding":@"gzip"};
                  //设置缓存策略
                  [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 请求失败，打印错误信息
        if (error) {
            NSLog(@"get error :%@",error.localizedDescription);
        }
        //请求成功，解析数据
        else {
            // JSON数据格式解析
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 判断是否解析成功
            if (error) {
                NSLog(@"get error :%@",error.localizedDescription);
            }else {
                NSLog(@"get success :%@",object);
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 刷新界面....
                });
            }   
        }
    }];
    
    [task resume];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler{
    NSLog(@"didReceiveChallenge");
    //    if([challenge.protectionSpace.host isEqualToString:@"api.lz517.me"] /*check if this is host you trust: */ ){
    completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]);
    //    }
}





@end
