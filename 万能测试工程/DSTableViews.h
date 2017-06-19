//
//  DSTableViews.h
//  万能测试工程
//
//  Created by 段帅 on 16/12/29.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSTableViews : UIView

/**
 初始化方法

 @param frame 整个tableview联动的frame
 @param data 包含标题和对应view的数组 例如:
   @[@{@"title":@"必修课",@"view":view1},@{@"title":@"选修课",@"view":view2}]
 @return <#return value description#>
 */
-(instancetype)initWithFrame:(CGRect)frame WithData:(NSArray *)data;




/**
 option: 可选设置的属性，用这些属性来定制个性化控件
 */
@property (nonatomic,strong) UIFont     * title_fone;//title的fone
@property (nonatomic,strong) UIColor     * title_Color_Normal;//正常的颜色
@property (nonatomic,strong) UIColor     * title_Color_Selected;//选中的颜色
@property (nonatomic,assign) CGFloat     line_long;//下划线长度
@property (nonatomic,strong) UIColor     * line_Color;//下划线颜色

@property (nonatomic, copy) void (^changeTableView)(NSInteger num);//切换view的时候的block
@property (nonatomic,strong) UIColor     * scroll_title_backGroudColor;//标题scroll的背景颜色

@end
