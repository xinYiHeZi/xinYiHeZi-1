//
//  XYGoods.h
//  wodemokuai
//
//  Created by lixinyu on 16/4/3.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYHZGoods : NSObject

//商品的id
@property(nonatomic,strong)NSNumber *goods_id;
//html
@property(nonatomic,copy)NSString*html_src;
//图片的url
@property(nonatomic,copy)NSString*image_url;
//商品描述
@property(nonatomic,copy)NSString*short_name;
//
@property(nonatomic,copy)NSString*share_url;
//价格
@property(nonatomic,strong)NSNumber *price;
//折后价
@property(nonatomic,strong)NSNumber *p_price;
//销量
@property(nonatomic,strong)NSNumber *sale_count;
//字典转模型
+(NSArray*)goosWithArray:(NSArray*)array;

@end
