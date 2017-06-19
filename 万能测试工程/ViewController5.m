//
//  ViewController5.m
//  万能测试工程
//
//  Created by 段帅 on 16/12/29.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import "ViewController5.h"
#import "DSTableViews.h"
@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.autoresizesSubviews = NO;
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
    view1.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
    view2.backgroundColor = [UIColor greenColor];
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
    view3.backgroundColor = [UIColor yellowColor];
    
    NSArray *arr =  @[@{@"title":@"必修课",@"view":view1},
                      @{@"title":@"选修课",@"view":view2},
                      @{@"title":@"选修课",@"view":view3}];
    
    DSTableViews *tables = [[DSTableViews alloc]initWithFrame:CGRectMake(0, 64, SIZEWIDTH, SIZEHEIGHT-64) WithData:arr];
    [self.view addSubview:tables];

//    tables.scroll_title_backGroudColor = [UIColor redColor];
//    tables.title_Color_Normal = [UIColor whiteColor];
//    tables.title_Color_Selected = [UIColor greenColor];
//    tables.line_Color = [UIColor yellowColor];
//    tables.line_long = 100;

    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
