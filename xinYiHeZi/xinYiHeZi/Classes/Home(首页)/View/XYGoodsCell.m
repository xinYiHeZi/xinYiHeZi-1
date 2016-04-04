//
//  XYGoodsCell.m
//  wodemokuai
//
//  Created by lixinyu on 16/4/4.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYGoodsCell.h"
#import <UIImageView+WebCache.h>
#import "XYGoods.h"
@interface XYGoodsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dsrLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation XYGoodsCell

-(void)setGoods:(XYGoods *)goods{
    _goods=goods;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:goods.image_url]];
    self.dsrLabel.text=goods.short_name;
    CGFloat price=[goods.p_price floatValue];
    self.priceLabel.text=[NSString stringWithFormat:@"￥ %.2f",price];
}

@end
