//
//  XYGoodsCell.m
//  wodemokuai
//
//  Created by lixinyu on 16/4/4.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYHZGoodsCell.h"
#import <UIImageView+WebCache.h>
#import "XYHZGoods.h"
@interface XYHZGoodsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dsrLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation XYHZGoodsCell

-(void)setGoods:(XYHZGoods *)goods{
    _goods=goods;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:goods.image_url]];
    self.dsrLabel.text=goods.short_name;
    CGFloat price=[goods.p_price floatValue];
    self.priceLabel.text=[NSString stringWithFormat:@"￥ %.2f",price];
}

@end
