//
//  TextViewController.m
//  万能测试工程
//
//  Created by 段帅 on 2017/3/9.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()<UITextViewDelegate>

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(50, 100, 200, 30)];
    [text setFont:[UIFont systemFontOfSize:15]];
    text.backgroundColor = [UIColor yellowColor];
    text.delegate = self;
    [self.view addSubview:text];
    // Do any additional setup after loading the view.
}


-(void)textViewDidChange:(UITextView *)textView{
    //博客园-FlyElephant
    static CGFloat maxHeight =100;
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height<=frame.size.height) {
        size.height=frame.size.height;
    }else{
        if (size.height >= maxHeight)
        {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
        }
        else
        {
            textView.scrollEnabled = NO;    // 不允许滚动
        }
    }
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
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
