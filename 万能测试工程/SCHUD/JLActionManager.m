//
// Created by Lee on 14-2-25.
// Copyright (c) 2014 Lee. All rights reserved.
//

#import "JLActionManager.h"



@implementation JLActionManager

#define kMBProgressHUDLabelFont FONT(14)
#define FONT(A) [UIFont fontWithName:HIRAGINOFONT  size:A]
#define HIRAGINOFONT  @"HiraginoSansGB-W3"

+(instancetype)sharedInstance
{
    static JLActionManager *_sharedInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance=[[self alloc] init];
    });

    return _sharedInstance;
}

- (void)showAndHideHUDWithTitle:(NSString *)title detailText:(NSString *)detail inView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelFont=kMBProgressHUDLabelFont;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;// 隐藏时将他从父类上移除
    [hud hide:YES afterDelay:1];
}

- (void)showHUDWithTitle:(NSString *)title detailText:(NSString *)detail{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.detailsLabelFont=kMBProgressHUDLabelFont;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
}

- (MBProgressHUD *)showHUDWithTitle:(NSString *)title detailText:(NSString *)detail inView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelFont=kMBProgressHUDLabelFont;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

- (void)showHUDWithLabelText:(NSString *)text imageView:(UIImageView *)imageView inView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelFont=kMBProgressHUDLabelFont;
    hud.customView.contentMode = UIViewContentModeScaleAspectFill;
    hud.customView=imageView;
    hud.mode=MBProgressHUDModeCustomView;
    hud.detailsLabelText=text;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];


}


@end
