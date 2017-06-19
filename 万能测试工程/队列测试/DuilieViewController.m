//
//  DuilieViewController.m
//  万能测试工程
//
//  Created by 段帅 on 2017/3/27.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "DuilieViewController.h"

@interface DuilieViewController ()

@end

@implementation DuilieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *stop = [[UIButton alloc]initWithFrame:CGRectMake(150, 200, 100, 50)];
    [stop setTitle:@"停止" forState:UIControlStateNormal];
    [stop setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:stop];
    [stop addTarget:self action:@selector(stopPlay) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *star = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, 100, 50)];
    [star setTitle:@"开始" forState:UIControlStateNormal];
    [star setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:star];
    [star addTarget:self action:@selector(starPlay) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
    
   
    
}
-(void)aaaaaaa{
    NSLog(@"aaaaaaaa");
    
}
-(void)starPlay{
     [self performSelector:@selector(aaaaaaa) withObject:nil afterDelay:3];
    
    
}
-(void)stopPlay{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(aaaaaaa) object:nil];//可以取消成功。  
    //串行，异步顺序下载
//    dispatch_queue_t serialQueue =dispatch_queue_create("serialQueue",DISPATCH_QUEUE_SERIAL);
//    dispatch_async(serialQueue, ^{
//        [NSThread sleepForTimeInterval:arc4random_uniform(5)];//5秒内的随机时间
//        dispatch_async(serialQueue, ^{
//            NSLog(@"%@下载完成",[NSThread currentThread]);
//        });
//        
//        [NSThread sleepForTimeInterval:arc4random_uniform(5)];//5秒内的随机时间
//        dispatch_async(serialQueue, ^{
//            NSLog(@"%@下载完成",[NSThread currentThread]);
//        });
//        
//        dispatch_async(serialQueue, ^{
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"%@下载完成",[NSThread currentThread]);
//            });
//        });
//    });
    
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
