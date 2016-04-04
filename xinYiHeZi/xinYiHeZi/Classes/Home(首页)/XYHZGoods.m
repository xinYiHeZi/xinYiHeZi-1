//
//  XYGoods.m
//  wodemokuai
//
//  Created by lixinyu on 16/4/3.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYHZGoods.h"

@implementation XYHZGoods

+(instancetype)goosWithDict:(NSDictionary*)dict{
    id obj=[[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
//未使用的属性，防止报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
//字典转模型
+(NSArray*)goosWithArray:(NSArray*)array{
    NSMutableArray *arrM=[NSMutableArray array];
    for (NSDictionary *dict in array) {
        XYHZGoods *goos=[XYHZGoods goosWithDict:dict];
        [arrM addObject:goos];
    }
    return arrM;
}
@end
