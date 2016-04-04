//
//  XYHZNetworkTool.h
//  xinYiHeZi
//
//  Created by 檀志文 on 16/4/3.
//  Copyright © 2016年 苏烁. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface XYHZNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;
@end
