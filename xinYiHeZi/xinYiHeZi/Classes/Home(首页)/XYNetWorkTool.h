//
//  XYNetWorkTool.h
//  0326bantang
//
//  Created by lixinyu on 16/3/26.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface XYNetWorkTool : AFHTTPSessionManager
+ (instancetype)sharedNetworkTool;
@end
