//
//  XYActivityCell.m
//  wodemokuai
//
//  Created by lixinyu on 16/4/4.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYHZActivityCell.h"
#import <UIButton+WebCache.h>
#import "XYHZActivityData.h"
#import "XYHZGoods.h"
#import "XYHZGoodsCell.h"
#import "XYHZButton.h"
@interface XYHZActivityCell()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet XYHZButton *shareButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
//商品的详细信息
@property(nonatomic,strong)NSArray*goods;

@end

@implementation XYHZActivityCell

-(void)awakeFromNib{
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    self.collectionView.backgroundColor=[UIColor whiteColor];

    self.layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    self.layout.itemSize=CGSizeMake(105, 140);
    self.layout.sectionInset=UIEdgeInsetsMake(0, 10, 0, 10);
    self.collectionView.bounces=NO;
    self.collectionView.showsHorizontalScrollIndicator=NO;
}



#pragma mark collectionView的数据源和代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.goods.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYHZGoodsCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"goods" forIndexPath:indexPath];
    
    cell.goods=self.goods[indexPath.item];
    return cell;
}
#pragma mark set方法
-(void)setActivitys:(XYHZActivityData *)activitys{
    _activitys=activitys;
    //为button赋值
    NSURL *URL=[NSURL URLWithString:activitys.url];
    [self.shareButton sd_setBackgroundImageWithURL:URL forState:UIControlStateNormal];
    //数组赋值
    self.goods=activitys.goods;
    //赋值成功后刷新页面
    [self.collectionView reloadData];
}
//点击后展示商品详情
- (IBAction)shareButtonDidClick {
    if (self.shareGoods) {
        self.shareGoods();
    }
}

@end
