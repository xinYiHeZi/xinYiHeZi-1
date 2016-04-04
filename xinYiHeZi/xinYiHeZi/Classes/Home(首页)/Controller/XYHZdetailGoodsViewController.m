//
//  XYHZdetailGoodsViewController.m
//  xinYiHeZi
//
//  Created by lixinyu on 16/4/4.
//  Copyright © 2016年 苏烁. All rights reserved.
//

#import "XYHZdetailGoodsViewController.h"
#import  "XYHZNetWorkTool.h"
@interface XYHZdetailGoodsViewController ()
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation XYHZdetailGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏底部的bar
    self.hidesBottomBarWhenPushed=YES;
    self.webView.backgroundColor=[UIColor whiteColor];
}

-(void)setUrlStr:(NSString *)urlStr{
    _urlStr=urlStr;
 
//    NSLog(@"%@",urlStr);
//    [[UIApplication sharedApplication]openURL:url];
    [[XYHZNetWorkTool sharedNetworkTool]GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}
#pragma mark 懒加载
-(UIWebView *)webView{
    if (_webView==nil) {
        _webView=[[UIWebView alloc]init];
        [self.view addSubview:_webView];
        _webView.frame=self.view.bounds;
    }
    return _webView;
}



@end
