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


@end
