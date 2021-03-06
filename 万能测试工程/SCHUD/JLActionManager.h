//
// Created by Lee on 14-2-25.
// Copyright (c) 2014 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface JLActionManager : NSObject
+(instancetype)sharedInstance;
- (void)showAndHideHUDWithTitle:(NSString *)title detailText:(NSString *)detail inView:(UIView *)view;
- (void)showHUDWithTitle:(NSString *)title detailText:(NSString *)detail;
- (MBProgressHUD *)showHUDWithTitle:(NSString *)title detailText:(NSString *)detail inView:(UIView *)view;

-(void)showHUDWithLabelText:(NSString *)text imageView:(UIImageView *)imageView inView:(UIView *)view;
@end
