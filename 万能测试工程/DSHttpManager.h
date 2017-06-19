//
//  DSHttpManager.h
//  Competition
//
//  Created by 段帅 on 16/4/18.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"
@interface DSHttpManager : NSObject

+(void)POST:(NSString *)url parameters:(NSDictionary *)param isToken:(BOOL)istoken finishBlock:(void(^)(NSDictionary *dataDic))finishBlock faildeBlock:(void(^)(NSError *error))fildeBlock;



+(void)GET:(NSString *)url parameters:(NSDictionary *)param isToken:(BOOL)istoken finishBlock:(void(^)(NSDictionary *dataDic))finishBlock faildeBlock:(void(^)(NSError *error))fildeBlock;


@end
