//
//  XYNetWorkTool.m
//  0326bantang
//
//  Created by lixinyu on 16/3/26.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYHZNetWorkTool.h"

@implementation XYHZNetWorkTool
+ (instancetype)sharedNetworkTool{
    static XYHZNetWorkTool *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL=[NSURL URLWithString:@"http://app.xinyihezi.com:8888/"];
        instance=[[self alloc]initWithBaseURL:baseURL];
        // 修改响应解析器能够解析的数据类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    });
    return instance;
}
@end
