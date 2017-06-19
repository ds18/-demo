//
//  ScrollViewController.m
//  万能测试工程
//
//  Created by 段帅 on 2017/2/21.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "ScrollViewController.h"
#import "RollMessagesView.h"
#import "RollMessageModel.h"
@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    RollMessagesView *message = [[RollMessagesView alloc]initWithFrame:CGRectMake(0, 100, SIZEWIDTH, 50)];
    
    [self.view addSubview:message];
    RollMessageModel *model = [[RollMessageModel alloc]init];
    model.time = @"2014-12-1";
    model.message = @"这是什么地方，一眼的的大神 的 ";
     RollMessageModel *model1 = [[RollMessageModel alloc]init];
    model1.time = @"2015-11-11";
    model1.message = @"这爱恩我的的安利捷爱的啊额累计 ";
    
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:model]; 
    [arr addObject:model1];
    
    message.data = arr;
    
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
