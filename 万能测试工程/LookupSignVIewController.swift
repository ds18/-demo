//
//  LookupSignVIewController.swift
//  万能测试工程
//
//  Created by 段帅 on 16/11/20.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit
let SIZE_W = UIScreen.main.bounds.width
let SIZE_H = UIScreen.main.bounds.height




class LookupSignVIewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var data = [[String:String]]()
    var collect:UICollectionView!
     var current_date  = Date()
    var date_arr = [String]()
    var requset_arr = [[String:String]]()
    
       var user = UserMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createData()
        createUI()
        
       

        // Do any additional setup after loading the view.
    }

    
    func createUI() {
        
        
         navigationItem.setRightBarButton( UIBarButtonItem.init(title: "提交", style: .plain, target: self, action:#selector(submit)), animated: true)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20;
        layout.itemSize = CGSize.init(width: 120, height: 100)
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        
        collect = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        
        collect.delegate = self;
        collect.dataSource = self;
        
        view.addSubview(collect)
        
        collect.backgroundColor = UIColor.white
        collect.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "ID")
        
        
        //添加刷新
        
        self.collect.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: { 
            self.addDate()
            
        })
        
        
    }
    
    func createData()  {
        let user111 =  UserDefaults.standard.object(forKey: USERMESSAGE) 
        user.setValuesForKeys(user111 as! [String : Any])
        
        Post(url: main_url+URL_lookupsign, para: ["count":user.count], sucess: { (data) in
            print(data)
            
             self.date_arr = (data["data"] as! [String : [String]])["date"]!  
            
             self.addDate()
            
        }
        )
        
    }
    
    
    
    func addDate()  {
        
        //读取时间
        for  item  in 0  ..< 10  {
            
            if data.last == nil {
                //空数组
               
                let currentFormatter = DateFormatter()
                currentFormatter.dateStyle = .full
               
                currentFormatter.timeZone = TimeZone.current
                let today = currentFormatter.string(from: current_date)
                //yyyy-MM-dd
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                 formatter.timeZone = TimeZone.current
                let format_date = formatter.string(from: current_date)
                
                
                data.append(["title":today,"isqiandao":"0","date":format_date])
            }else{
                //下拉刷新
                current_date = Date.init(timeIntervalSinceNow: Double(-86400*data.count))
                let currentFormatter = DateFormatter()
                currentFormatter.dateStyle = .full
                
                currentFormatter.timeZone = TimeZone.current
                let today = currentFormatter.string(from: current_date)
                //yyyy-MM-dd
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                formatter.timeZone = TimeZone.current
                let format_date = formatter.string(from: current_date)

                
                
                
                
                data.append(["title":today,"isqiandao":"0","date":format_date])
            }
        }
        
        for i in 0..<data.count {
            
            for item in date_arr {
                if item == data[i]["date"] {
                    data[i]["isqiandao"] = "1"
                }
            }
            
            
        }
        
        
        
        
       
        collect.reloadData()
        collect.mj_footer.endRefreshing()
        
        
    }
    
       
     
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return data.count
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let cell = collectionView.cellForItem(at: indexPath)
        
       
       
        if cell?.contentView.backgroundColor == UIColor.yellow {
            cell?.contentView.backgroundColor = UIColor.green
            
            data[indexPath.row]["isqiandao"] = "2"
            requset_arr.append(["date":data[indexPath.row]["date"]!])
            
        }else{
             cell?.contentView.backgroundColor = UIColor.yellow
                     for i in 0..<requset_arr.count {
                if requset_arr[i]["date"] == data[indexPath.row]["date"]! {
                    
                    requset_arr.remove(at: i)
                    break
                    
                }
                
            }
              
        
        }
         
        
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ID", for: indexPath)
        
        let bbb:UILabel? = cell.contentView.viewWithTag(10) as! UILabel?
//        if aaa == nil {
        bbb?.removeFromSuperview()
            let aaa = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 100))
          
            aaa.tag = 10;
            cell.contentView.addSubview(aaa)
//        }
        aaa.numberOfLines = 0
          aaa.text = data[indexPath.row]["title"]
         cell.backgroundColor = UIColor.yellow;
        if data[indexPath.row]["isqiandao"] == "1" {
            cell.contentView.backgroundColor = UIColor.green
            cell.isUserInteractionEnabled = false;
        }else if (data[indexPath.row]["isqiandao"] == "2"){
              cell.contentView.backgroundColor = UIColor.green
        }else{
            cell.contentView.backgroundColor = UIColor.yellow
            cell.isUserInteractionEnabled = true;
            
        }
        
       
        
       
        
        
        return cell
        
    }
    
    func submit(){
        //提交补签数据
        
        Post(url: main_url+URL_sign, para: ["count":user.count,"isbuqian":"1","data":requset_arr], sucess: {(data) in
            
            
            DSAlert.alert(title: "补签成功-前端")
            
            
            
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
