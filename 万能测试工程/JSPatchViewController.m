//
//  JSPatchViewController.m
//  万能测试工程
//
//  Created by 段帅 on 17/2/7.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "JSPatchViewController.h"
#import <JSPatchPlatform/JSPatch.h>
@interface JSPatchViewController ()

@end

@implementation JSPatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}
-(void)createUI{
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    [button setTitle:@"正常的button" forState:UIControlStateNormal];
   
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"正常的button" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 100, 200, 50);
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
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
