//
//  XYActivityData.h
//  wodemokuai
//
//  Created by lixinyu on 16/4/3.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYActivityData : NSObject
//商品
@property(nonatomic,strong)NSArray*goods;
//展示全部商品的url
@property(nonatomic,copy)NSString*share_url;
//id序列号，id越大越靠前
@property(nonatomic,strong)NSNumber *theme_id;
//显示图片的URL
@property(nonatomic,copy)NSString*url;

//对外提供获得数据数组的方法
+(void)loadactivityDataWithURLString:(NSString*)URLStr success:(void (^)(NSArray *activityData))success faild:(void (^)(NSError *error))failed;
@end
