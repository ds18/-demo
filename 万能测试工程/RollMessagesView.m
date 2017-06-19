//
//  RollMessagesView.m
//  万能测试工程
//
//  Created by 段帅 on 2017/2/21.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "RollMessagesView.h"
#import "RollMessageCell.h"

@interface RollMessagesView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView *_table;
    NSInteger _page;//滚动的page
    
}
@property (nonatomic,strong) NSTimer *timer;
@end
@implementation RollMessagesView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
    
}
-(void)createUI{
    self.backgroundColor = [UIColor yellowColor];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 0, self.frame.size.height)];
    title.font = [UIFont systemFontOfSize:14];
    title.text = @"【通知】:";
    title.textColor = [UIColor redColor];
    [title sizeToFit];
    title.frame = CGRectMake(10, 0, title.frame.size.width, self.frame.size.height);
    [self addSubview:title];
    
    
    _table = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(title.frame), 0, SIZEWIDTH-title.frame.size.width-10, self.frame.size.height) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.rowHeight = self.frame.size.height;
    [self addSubview:_table];
    _table.scrollEnabled = NO;
}

-(void)setData:(NSMutableArray *)data{
    
    _data = data;
  
    if (_data.count > 1) {
        _page = 0;
        [_data addObject:[_data firstObject]];
       _timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(roll) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes]; 
    }
    
      [_table reloadData];
}
#pragma mark - ------滚动
-(void)roll{
    CGPoint point = _table.contentOffset;
    
    _page = _page + 1;
    
    
    [_table setContentOffset:CGPointMake(point.x, _page*self.frame.size.height) animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _data.count;
    
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RollMessageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[RollMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.model = _data[indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%f",scrollView.contentOffset.y);
   

   
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
   // NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y/self.frame.size.height == _data.count) {
        _page = 0;
        _table.contentOffset = CGPointMake(0, 0);
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
