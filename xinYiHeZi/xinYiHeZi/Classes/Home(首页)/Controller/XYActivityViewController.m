//
//  XYActivityViewController.m
//  wodemokuai
//
//  Created by lixinyu on 16/4/3.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYActivityViewController.h"
#import "XYActivityData.h"
#import "XYActivityCell.h"
@interface XYActivityViewController ()
@property(nonatomic,strong)NSArray*activityDatas;
@end

@implementation XYActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlStr=@"activity/?search_type=6&activity_cat_id=0&page=1&page_size=10&unique_id=459DD776-D030-4924-A87A-53CBBCB6E8E6&app_ver=2.3.0&from_type=iOS";
    //网络请求获得数据
    [XYActivityData loadactivityDataWithURLString:urlStr success:^(NSArray *activityData) {
        self.activityDatas=activityData;
        //刷新页面
        [self.tableView reloadData];
//        NSLog(@"%@",activityData);
        
    } faild:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    self.tableView.showsVerticalScrollIndicator=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.activityDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  XYActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activity" forIndexPath:indexPath];
    
    cell.activitys=self.activityDatas[indexPath.row];
    
    return cell;
}

//头部视图
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView=[[UIView alloc]init];
    //label
    UILabel *label=[[UILabel alloc]init];
    label.text=@"心意专场";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:14];
    label.textColor=[UIColor grayColor];
    [headView addSubview:label];
    //左右的线条
    UIView *leftView=[[UIView alloc]init];
    leftView.backgroundColor=[UIColor grayColor];
    [headView addSubview:leftView];
    UIView *rightView=[[UIView alloc]init];
    rightView.backgroundColor=[UIColor grayColor];
    [headView addSubview:rightView];
    //做约束
    CGFloat viewW=130;
    CGFloat labelW=80;
    CGFloat labelX=(self.view.frame.size.width-labelW)*0.5;
    label.frame=CGRectMake(labelX, 0, labelW, 40);
    leftView.frame=CGRectMake(10, 20, viewW, 1);
    rightView.frame=CGRectMake(labelX+labelW, 20, viewW, 1);
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
@end
