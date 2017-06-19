//
//  FirstViewController.m
//  万能测试工程
//
//  Created by 段帅 on 16/5/10.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController1.h"
#import "DSTableViewcell.h"
#import "ViewController2.h"
#import "万能测试工程-Swift.h"
#import "ViewController5.h"
#import "JSPatchViewController.h"
#import "PopViewController.h"
#import "ScrollViewController.h"

#import "TextViewController.h"

#import "DuilieViewController.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_data;
    
    
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [[NSMutableArray alloc]init];
    [_data addObject:@{@"title":@"gif测试"}];
     [_data addObject:@{@"title":@"微博"}];
     [_data addObject:@{@"title":@"注册"}];
    [_data addObject:@{@"title":@"web显示内容测试"}];
      [_data addObject:@{@"title":@"tabviews联动"}];
     [_data addObject:@{@"title":@"JSPatch热修复"}];
     [_data addObject:@{@"title":@"三级popview"}];
     [_data addObject:@{@"title":@"滚动的通知消息"}];
      [_data addObject:@{@"title":@"七牛视频"}];
    
    [_data addObject:@{@"title":@"textview高度自自适用"}];
    
//    [_data addObject:@{@"title":@"ios自带视频封装"}];
    
     [_data addObject:@{@"title":@"队列测试"}];
    
    NSArray *arr = @[@"1111",@"4111",@"21111111",@"31111",@"4545",@"4545",@"4545"];
    [self sortOfArr:arr];//排序算法测试
   
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 50;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            ViewController1 *view = [[ViewController1 alloc]init];
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 1:
        {
            ViewController2 *view = [[ViewController2 alloc]init];
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 2:
        {
            
            UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
           
            ViewController3 *childController = [board instantiateViewControllerWithIdentifier: @"ViewController3"];
            childController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:childController animated:YES];
            
        }break;
        case 3:
        {
            webViewControll *view = [[webViewControll alloc]init];
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 4:
        {
            ViewController5 *view = [[ViewController5 alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 5:
        {
            JSPatchViewController *view = [[JSPatchViewController alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 6:
        {
            PopViewController *view = [[PopViewController alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
            
        case 7:
        {
            ScrollViewController *view = [[ScrollViewController alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 8:
        {
//            PlayVideoViewController *view = [[PlayVideoViewController alloc]init];
//            view.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 9:
        {
             TextViewController*view = [[TextViewController alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 10:
        {
            DuilieViewController *view = [[DuilieViewController alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
            
        }break;
        case 11:
        {
           
            
        }break;
            
        default:
            break;
    }
    
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DSTableViewcell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[DSTableViewcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
             cell.lablead.text = _data[indexPath.row][@"title"];
            
                   
   
    return cell; 
    
}

-(void)sortOfArr:(NSArray *)arr{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    for (NSString *time in arr) {
        if (dic[time] == nil) {
            NSMutableArray *newArr = [NSMutableArray array];
            [newArr addObject:time];
            [dic setValue:newArr forKey:time];
        }else{
            NSMutableArray *newArr = dic[time];
            [newArr addObject:time];
        }
            //        NSArray *newKey = [keyArr sortedArrayUsingSelector:@selector(compare:)];
        
    }
    
    
    //排序
    NSMutableArray *keyArr = [NSMutableArray array];
    [keyArr addObjectsFromArray:dic.allKeys];
    if (keyArr.count >=2 ) {
        for (int i = 0 ; i<keyArr.count; i++) {
            for (int j = 0; j<keyArr.count; j++) {
                if ([self version:keyArr[i] lessthan:keyArr[j]]) {
                    [keyArr exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
            }
        }
        
    }

    
    NSMutableArray *final = [NSMutableArray array];
    
    for (NSString *key in keyArr) {
        [final addObject:dic[key]];
    }
    
    
    NSLog(@"%@",final);   
    
    
    }

- (BOOL)version:(NSString *)oldver lessthan:(NSString *)newver //系统api
{      
    return  [oldver compare:newver options:NSNumericSearch]==NSOrderedAscending;
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
