//
//  ViewController1.m
//  万能测试工程
//
//  Created by 段帅 on 16/5/11.
//  Copyright © 2016年 newfuture. All rights reserved.
//

#import "ViewController1.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"
#import "AFNetWorking.h"
@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    [self createData];
    // Do any additional setup after loading the view.
}
-(void)createData{
    
    
    
    
    NSString *urlString = @"https://www.4008117117.com/webapi/commonStore/getServerDate";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    NSData *certData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aaa" ofType:@"cer"]];
    NSSet *cerSet  = [NSSet setWithObject:certData];
    if(certData){
        [securityPolicy setPinnedCertificates:cerSet];
    }
    
    
    [securityPolicy setValidatesDomainName:YES];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // request
    [manager POST:urlString
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary * array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
             NSLog(@"OK === %@",array);
             NSString *htmlString = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSLog(@"%@",htmlString);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"error ==%@",error.description);
         }];
    
    
    
    
    
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    // 2.申明返回的结果是text/html类型
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//    // 3.设置超时时间为10s
//    mgr.requestSerializer.timeoutInterval = 10;
//    
//    // 加上这行代码，https ssl 验证。
//   
//        [mgr setSecurityPolicy:[self customSecurityPolicy]];
//  
//    
//    // 4.发送POST请求
//   [mgr POST:@"https://www.4008117117.com/webapi/commonStore/getServerDate" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
//       
//   } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//       
//       NSLog(@"sucess");
//       
//   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//       NSLog(@"faile---%@",error);
//   }];
//    
    
    
}

- (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"bbb" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = @[certData];
    
    return securityPolicy;
}


-(void)createUI{
    
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str = @"\"<img src=\"http://test.sooc.com/public/static/face/face/3.gif\">sadfas<img src=\"http://test.sooc.com/public/static/face/face/6.gif\">&lt;&gt;"; 
    
    
     
        //如果想要改变文字的字体,请在设置attributedText之后设置
    //    label.font = [UIFont systemFontOfSize:20];
    //    [self.view addSubview:label];
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSMutableAttributedString *mutabelStr = [[NSMutableAttributedString alloc]initWithString:str];
        //2 使用正则 获取str 的图片位置range
        NSString *patterm = @"<imgsrc=\"(.*?)\">";
        NSError *er = nil;
        
        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:patterm options:NSRegularExpressionCaseInsensitive error:&er];
        
        NSArray *adArr = [expression matchesInString:str options:0 range:NSMakeRange(0, str.length)];//地址数组
        NSLog(@"eeeeeee%@",er);
        //3 创建数组保存对应的图片和 地址
        NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:adArr.count];
        
        for (NSTextCheckingResult *match in adArr) {
            NSRange range = [match range];
            //获取表情URL
            NSString *subStr = [str substringWithRange:range];
            NSArray *arr = [subStr componentsSeparatedByString:@"\""];
            
            
            //        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            //        NSString *url = [user valueForKey:@"xtdz"];
            
            //        NSString *imageUrl = [url stringByAppendingString:arr[1]];
            NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
        
            
//            [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:arr[1]]]]
           
            
        }
        //替换表情
        for (int i = imageArray.count-1; i>=0; i--) {
            
            NSRange rang = [imageArray[i][@"range"] rangeValue];
            
            [ mutabelStr replaceCharactersInRange:rang withAttributedString:imageArray[i][@"image"]];
            
            
            
            
        }
    
        label.attributedText = mutabelStr;
        
    label.font = [UIFont systemFontOfSize:20];
        
        
        
       
    
        
        

    
    
    
    
    
    
    
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
