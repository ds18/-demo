//
//  PopViewController.m
//  万能测试工程
//
//  Created by 段帅 on 2017/2/20.
//  Copyright © 2017年 newfuture. All rights reserved.
//

#import "PopViewController.h"
#import "AFNetWorking.h"
@interface PopViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_table;
    NSMutableArray *_data;
    NSInteger _popTable_index;//三级列表标示 0->地区 1->楼号 2->房号
    
}
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view.
}
-(void)createUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"选择地址" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 100, 150, 50);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)clickButton{
    _popTable_index = 0;
    _table = [[UITableView alloc]initWithFrame:CGRectMake(50, 100, 200, 200) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    _table.rowHeight = 50;
    //发起第一次数据请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://kaifa.homesoft.cn/WebService/jsonInterface.ashx?json=GetEstateDetailFromCompanyID&CompanyID=-9057" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _data = [NSMutableArray array];
          NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"data---%@",data);
        NSArray *EstateDetail = data[@"EstateDetail"];
        for (NSDictionary *dic in EstateDetail) {
            
            NSDictionary *model = @{@"title":dic[@"Caption"]};
            [_data addObject:model];
            
        }
        
        [_table reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _data.count;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    
    
    cell.textLabel.text = _data[indexPath.row][@"title"];
    
    return cell;
    
    
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //首先判断当前tableview的 标识符
    switch (_popTable_index) {
        case 0:{//地区
            //在这请求第二级列表信息
            [self requestMessage_secend];
            
        }break;
        case 1:{//楼号
             [self requestMessage_third];
            
        }break;
        case 2:{//房号
            
            
        }break;
            
        default:
            break;
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ------列表请求信息方法
-(void)requestMessage_secend{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://kaifa.homesoft.cn/WebService/jsonInterface.ashx?json=GetBuildingDetailFromEstateID&Estateid=11" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _data = [NSMutableArray array];
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"data---%@",data);
        NSArray *EstateDetail = data[@"BuildingDetail"];
        for (NSDictionary *dic in EstateDetail) {
            
            NSDictionary *model = @{@"title":dic[@"buildingno"]};
            [_data addObject:model];
            
        }
        
        _popTable_index = 1;
        [_table reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
}

-(void)requestMessage_third{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://kaifa.homesoft.cn/WebService/jsonInterface.ashx?json=GetRoomDetailFromBuildingID&BuildingId=38" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _data = [NSMutableArray array];
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"data---%@",data);
        NSArray *EstateDetail = data[@"RoomDetail"];
        for (NSDictionary *dic in EstateDetail) {
            
            NSDictionary *model = @{@"title":dic[@"RmNo"]};
            [_data addObject:model];
            
        }
        
        _popTable_index = 2;
        [_table reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
    
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
