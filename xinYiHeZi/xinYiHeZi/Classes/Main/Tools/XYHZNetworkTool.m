//
//  XYHZNetworkTool.m
//  xinYiHeZi
//
//  Created by 檀志文 on 16/4/3.
//  Copyright © 2016年 苏烁. All rights reserved.
//

#import "XYHZNetworkTool.h"

@implementation XYHZNetworkTool

+ (instancetype)sharedNetworkTool {
    static XYHZNetworkTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        http://c.m.163.com/nc/ad/headline/0-4.html
        NSURL *baseURL = [NSURL URLWithString:@"http://app.xinyihezi.com:8888/"];
        instance = [[self alloc] initWithBaseURL:baseURL];
        // 修改响应解析器能够解析的数据类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    });
    return instance;
}


@end
