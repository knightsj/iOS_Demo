//
//  ViewController.m
//  as_demo
//
//  Created by Sun Shijie on 2017/6/9.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()<NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [manager GET:@"http://10.0.33.43:9763/EmployeeManagementJAXRSProject-1.0.0/services/employee_management_service/employee/get/1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"开始解析XML文件");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    NSLog(@"%@",elementName);
    NSLog(@"%@",attributeDict);
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"XML所有元素解析完毕:%@",parser);
}

@end
