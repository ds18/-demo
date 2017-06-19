//
//  ViewController2.m
//  万能测试工程
//
//  Created by 段帅 on 16/5/12.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
   
    UIView *_butView;
    NSArray *_UIArr;
    
}

@property (nonatomic,strong) UIScrollView *scroll;
@property (nonatomic,strong) UITableView *table;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view.
}

-(void)createUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scroll];
    
    
    
    
    
    
}

-(UIScrollView *)scroll{
    
    if (!_scroll) {
        _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
        _scroll.delegate = self;
        
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 200)];
        imageView.backgroundColor = COLOR_MAIN;
        [_scroll addSubview:imageView];
        _butView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), SIZEWIDTH, 80)];
        _butView.backgroundColor = [UIColor greenColor];
      
        NSArray *titleArr = @[@"热点",@"评论"];
        
        for (int i = 0; i<2; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(SIZEWIDTH/2*i, 0, SIZEWIDTH/2, 80);
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitleColor:COLOR_TITLE_A5A5A5 forState:UIControlStateNormal];
            [_butView addSubview:button];
            
        }
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_butView.frame), SIZEWIDTH, 50*50) style:UITableViewStylePlain];
        _table.rowHeight = 50;
        _table.dataSource = self;
        _table.delegate = self;
       //  _table.scrollEnabled = NO;
        [_scroll addSubview:_table];
          [_scroll addSubview:_butView];
        _scroll.contentSize = CGSizeMake(SIZEWIDTH, CGRectGetMaxY(_table.frame));
       
    }
    
    
  
    return _scroll;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 50;
    
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"1212354";
    return cell;
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //1  scroll和table两个同时只有一个能滑动  2开始scroll滑动，当button吸顶时，tableview滑动
    CGPoint point = scrollView.contentOffset;
    CGPoint scrollPoint = _scroll.contentOffset;
    CGPoint tablePoint = _table.contentOffset;
    NSLog(@"-----------%f",_butView.frame.origin.y);
    
    if (point.y>=135) {
    CGRect rect = _butView.frame;
        rect.origin.y=200+(point.y-135); 
        
        _butView.frame = rect;
    }else{
        
        _butView.frame =CGRectMake(0, 200, SIZEWIDTH, 80);
    }
    
   

    
    
    
    
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
