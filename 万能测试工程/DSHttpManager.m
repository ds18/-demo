//
//  DSHttpManager.m
//  Competition
//
//  Created by 段帅 on 16/4/18.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import "DSHttpManager.h"

@implementation DSHttpManager

+(void)POST:(NSString *)url parameters:(NSDictionary *)param isToken:(BOOL)istoken finishBlock:(void(^)(NSDictionary *dataDic))finishBlock faildeBlock:(void(^)(NSError *error))fildeBlock{
    
  
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
//    [dic setValuesForKeysWithDictionary:@{@"account":@"admin",@"pwd":@"111111"}];
      if (param) {
        [dic setValuesForKeysWithDictionary:param];
}
   
    NSLog(@"dic-------%@   url-----%@",dic,url);
//    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@",data);
//        finishBlock(data);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        fildeBlock(error);
//
//    }];
   
    
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"%@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",data);
        finishBlock(data);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        fildeBlock(error);
    }];

    

    
    
    
}

+(void)GET:(NSString *)url parameters:(NSDictionary *)param isToken:(BOOL)istoken finishBlock:(void(^)(NSDictionary *dataDic))finishBlock faildeBlock:(void(^)(NSError *error))fildeBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    //    [dic setValuesForKeysWithDictionary:@{@"account":@"admin",@"pwd":@"111111"}];
     
  
    
    NSLog(@"Url-----%@  dic------%@",url,dic);
//    [manager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//        
//        finishBlock(data);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        fildeBlock(error);
//    }];
    
    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"%@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",data);
        finishBlock(data);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fildeBlock(error);
    }];
    

    
    
    
    
}


@end
