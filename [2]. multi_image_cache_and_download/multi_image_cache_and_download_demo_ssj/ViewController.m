//
//  ViewController.m
//  multi_image_cache_and_download_demo_ssj
//
//  Created by Sun Shijie on 2017/2/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "AppInfoModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *appInfos;                //模型数组
@property (nonatomic, strong) NSCache *imageCache;              //图片内存缓存
@property (nonatomic, strong) NSMutableDictionary *operations;  //操作缓存
@property (nonatomic, strong) NSOperationQueue *queue;          //下载队列

@end

@implementation ViewController
{
    NSInteger _dataCount;
}

#pragma mark- Delegate
#pragma mark UITableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"app";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    AppInfoModel *model = self.appInfos[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.download;
    
    //查询内存缓存
    UIImage *image = [self.imageCache objectForKey:model.icon];
    
    //找到了缓存
    if (image) {
        
        cell.imageView.image = image;
        
    }else{
        
        //没有找到内存缓存，查询沙盒缓存
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *fileName = [model.icon lastPathComponent];
        NSString *filePath = [cachePath stringByAppendingPathComponent:fileName];
        NSData *imageData = [NSData dataWithContentsOfFile:filePath];
        
        if (imageData) {
            
            //找到了沙盒缓存
            UIImage *image = [UIImage imageWithData:imageData];
            [self.imageCache setObject:image forKey:model.icon];
            cell.imageView.image = image;
            
        }else{
            
            //开始下载
            NSBlockOperation *download = [self.operations objectForKey:model.icon];
            
            if (download) {
                
                //什么都不做，因为存在下载该url的线程
                
            }else{
                
                //设置占位图片
                cell.imageView.image = [UIImage imageNamed:@"placeholder"];
                
                //下载任务
                download = [NSBlockOperation blockOperationWithBlock:^{
                    
                    //通过url下载图片
                    NSURL *url = [NSURL URLWithString:model.icon];
                    NSData *imageData = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    //没有拿到图片
                    if (image == nil) {
                        [self.operations removeObjectForKey:model.icon];
                        return;
                    }
                    
                    //拿到图片了，缓存内存缓存
                    [self.imageCache setObject:image forKey:model.icon];
                    
                    //回到主线程刷新
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                    }];
                    
                    //缓存沙盒缓存
                    [imageData writeToFile:filePath atomically:YES];
                    [self.operations removeObjectForKey:model.icon];
                    
                }];
                
                //将操作添加到操作缓存中
                [self.operations setObject:download forKey:model.icon];
                
                //将下载任务添加到队列里
                [self.queue addOperation:download];
            }            
        }
    }
    
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.tableView reloadData];
    _dataCount = self.appInfos.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.imageCache removeAllObjects];
    [self.queue cancelAllOperations];
}

#pragma mark- Lazy Loads
-(NSOperationQueue*)queue
{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 5;
    }
    return _queue;
}

-(NSCache*)imageCache
{
    if (_imageCache == nil) {
        _imageCache = [[NSCache alloc] init];
    }
    return _imageCache ;
}

-(NSArray*)appInfos
{
    if (_appInfos == nil) {
        
        NSArray *arrI = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"appsInfo.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arrI) {
            [arrM addObject:[AppInfoModel appWithDict:dict]];
        }
        _appInfos = arrM;
        
    }
    return _appInfos;
}

-(NSMutableDictionary*)operations
{
    if (_operations == nil) {
        _operations = [NSMutableDictionary dictionary];
    }
    return _operations;
}


@end
