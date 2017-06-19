//
//  DSTableViews.m
//  万能测试工程
//
//  Created by 段帅 on 16/12/29.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import "DSTableViews.h"

#define Scroll_heigh_title 42
#define Scroll_heigh_content self.frame.size.height - Scroll_heigh_title
#define SIZEWIDTH   [[UIScreen mainScreen] bounds].size.width
#define SIZEHEIGHT  [[UIScreen mainScreen] bounds].size.height
@interface DSTableViews ()
{
    UIScrollView *_scroll_title;
    UIScrollView *_scroll_content;
    
    UIView *_line_selected;//下划线
    UIButton *_oldButton;//上一个选中的button
    NSMutableArray *_arr_button;//保存所有的button
    
    
    
}
@property (nonatomic, copy) void (^changeLineLong)();//改变下划线长度
@end

@implementation DSTableViews

-(instancetype)initWithFrame:(CGRect)frame WithData:(NSArray *)data{
    
    
    if (self = [super initWithFrame:frame]) {
        [self createUI:data];
    }
    return self;
    
}
-(void)createUI:(NSArray *)data{
    //上方的title  scroll
    _scroll_title = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, Scroll_heigh_title)];
    //_scroll_title.backgroundColor = [UIColor redColor];
    [self addSubview:_scroll_title];
    _arr_button = [NSMutableArray array];
    _line_long = 50;

    if (data.count > 0) {
        //动态计算每个button的宽度:算法：（宽-30 ）/data.count  当大于5的时候放在今后扩展
        CGFloat width_button = (SIZEWIDTH-30)/data.count ;
        
        for (int i = 0; i<data.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [_scroll_title addSubview:button];
            button.frame = CGRectMake(15+i*width_button, 0, width_button, Scroll_heigh_title);
            [_arr_button addObject:button];
            [button setTitle:data[i][@"title"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            
            
            
            button.tag = 10+i;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i==0) {
                button.selected = YES;
                _oldButton = button;
                _line_selected = [[UIView alloc]initWithFrame:CGRectMake(button.frame.size.width/2-_line_long/2+15, CGRectGetMaxY(button.frame)-2, _line_long, 2)];
                self.changeLineLong = ^(){
                    _line_selected.frame = CGRectMake(button.frame.size.width/2-_line_long/2+15, CGRectGetMaxY(button.frame)-2, _line_long, 2);
                };
                _line_selected.backgroundColor = [UIColor redColor];
                [_scroll_title addSubview:_line_selected];
            }
            
            
        }
       
        
        
        
        
        
        
    }
    
   
    
  //下方的view  
    _scroll_content = [[UIScrollView alloc]initWithFrame:CGRectMake(0, Scroll_heigh_title, SIZEWIDTH, Scroll_heigh_content)];
    
    [self addSubview:_scroll_content];
    
    _scroll_content.contentSize = CGSizeMake(SIZEWIDTH*data.count, Scroll_heigh_content);
    _scroll_content.pagingEnabled = YES;
    for (int i = 0; i < data.count ; i++) {
        //修正view的frame  并把view添加到scroll
        UIView *view = data[i][@"view"];
        view.frame = CGRectMake(SIZEWIDTH*i, 0, SIZEWIDTH, Scroll_heigh_content);
        
        [_scroll_content addSubview:view];
        
    }    
    
    _scroll_content.scrollEnabled = NO;
    
    
}

//点击选择
-(void)clickButton:(UIButton *)button{
    
    if (button == _oldButton) {
        return ;
    }else{
        _oldButton.selected = NO;
        _oldButton = button;
        _oldButton.selected = YES;
        [UIView animateWithDuration:0.2 animations:^{
            _line_selected.frame = CGRectMake(_oldButton.frame.origin.x+(_oldButton.frame.size.width/2-_line_long/2), CGRectGetMaxY(_oldButton.frame)-2,_line_long, 2);
        }];
        
        [_scroll_content setContentOffset:CGPointMake(SIZEWIDTH*(button.tag-10), 0) animated:NO];
        if (self.changeTableView) {
            self.changeTableView(button.tag-10);
        }
        
    }
    
    
    
}

-(void)setTitle_fone:(UIFont *)title_fone{
    _title_fone = title_fone;
    for (UIButton *button in _arr_button) {
        button.titleLabel.font = _title_fone;
        
    }
}
-(void)setTitle_Color_Normal:(UIColor *)title_Color_Normal{
    
    _title_Color_Normal = title_Color_Normal;
    for (UIButton *button in _arr_button) {
        [button setTitleColor:_title_Color_Normal forState:UIControlStateNormal];
        }
}
-(void)setTitle_Color_Selected:(UIColor *)title_Color_Selected{
    _title_Color_Selected = title_Color_Selected;
    for (UIButton *button in _arr_button) {
        [button setTitleColor:_title_Color_Selected forState:UIControlStateSelected];
    }
}
-(void)setLine_long:(CGFloat)line_long{
    _line_long = line_long;
    if (self.changeLineLong) {
        self.changeLineLong();
    }
      
    
}
-(void)setLine_Color:(UIColor *)line_Color{
    _line_Color = line_Color;
    _line_selected.backgroundColor = _line_Color;
    
}

-(void)setScroll_title_backGroudColor:(UIColor *)scroll_title_backGroudColor{
    _scroll_title_backGroudColor = scroll_title_backGroudColor;
    
    _scroll_title.backgroundColor = _scroll_title_backGroudColor;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
