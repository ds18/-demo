//
//  RollMessageCell.m
//  万能测试工程
//
//  Created by 段帅 on 2017/2/21.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "RollMessageCell.h"
#define SIZEWIDTH   [[UIScreen mainScreen] bounds].size.width
#define SIZEHEIGHT  [[UIScreen mainScreen] bounds].size.height
@interface RollMessageCell ()
{

    UILabel *_message;
    UILabel *_time;
    
}
@end
@implementation RollMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        _message = [[UILabel alloc]init];
        [self.contentView addSubview:_message];
        _time = [[UILabel alloc]init];
        [self.contentView addSubview:_time];
        
    }
    return self;
}

-(void)setModel:(RollMessageModel *)model{
    

    
    _time.text = model.time;
    _time.font = [UIFont systemFontOfSize:14];
    _time.frame = CGRectMake(10, 0, 0, self.frame.size.height);
    [_time sizeToFit];
   
    
    
    _message.text = model.message;
    _message.font = [UIFont systemFontOfSize:14];
  
    
    
    
    
    
    
    
    
}

-(void)layoutSubviews{
    
     _time.frame = CGRectMake(self.frame.size.width - 10 - _time.frame.size.width, 0, _time.frame.size.width, self.frame.size.height);
      _message.frame = CGRectMake(0, 0, self.frame.size.width-20-_time.frame.size.width, self.frame.size.height);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
