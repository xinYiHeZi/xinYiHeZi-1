//
//  XYActivityData.m
//  wodemokuai
//
//  Created by lixinyu on 16/4/3.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYHZActivityData.h"
#import "XYHZNetWorkTool.h"
#import "XYHZGoods.h"
@implementation XYHZActivityData


+(instancetype)activityDataWithDict:(NSDictionary*)dict{
    id obj=[[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
//未使用的属性，防止报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

//url拼接
-(NSString *)share_urlStr{

    return [NSString stringWithFormat:@"%@?activity_id=%@",self.share_url,self.theme_id];
}

+(void)loadactivityDataWithURLString:(NSString*)URLStr success:(void (^)(NSArray *activityData))success faild:(void (^)(NSError *error))failed{
    
    //断言判断必须传入回调
    NSAssert(success!=nil, @"回调不能为空");
    
    [[XYHZNetWorkTool sharedNetworkTool]GET:URLStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {
        
        //请求成功后传回数据
//      NSLog(@"%@",responseObject);
        NSDictionary *dict=responseObject[@"data"];
        NSArray *activity=dict[@"activity"];
//        NSLog(@"%@",activity);

        //可变模型数组
        NSMutableArray *arrM=[NSMutableArray array];
        //遍历数组
        [activity enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            XYHZActivityData *activity=[XYHZActivityData activityDataWithDict:obj];
            //嵌套字典转模型
            activity.goods=[XYHZGoods goosWithArray:activity.goods];
            
            [arrM addObject:activity];
        }];
        //完成回调
        success(arrM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
    
    
}
@end
