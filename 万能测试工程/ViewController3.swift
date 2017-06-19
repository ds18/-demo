//
//  ViewController3.swift
//  万能测试工程
//
//  Created by 段帅 on 16/11/9.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit
//let main_url = "http://localhost:8181"
//let main_url = "http://172.16.14.41:8181"
//let main_url_ceshi = "https://www.4008117117.com/webapi/commonStore/getServerDate"
let main_url = "http://172.16.14.41:8181"
let URL_regist = "/duan/regist"//注册
let URL_LOGIN = "/duan/login" //登陆
let URL_UPDATA = "/duan/updata"//更新信息
let URL_sign = "/duan/sign" //一键签到
let URL_lookupsign = "/duan/lookupsign" //查询签到记录

extension UIViewController {
    
    func Post(url:String,para:[String:Any],sucess:@escaping ([String:Any])->Void){
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        

        manager.post(url, parameters: para, progress: { (pre) in
            
        }, success: { (aaa, responseObject)->Void in
            
            let json = try? JSONSerialization.jsonObject(with: responseObject as! Data, options:JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
            
            guard (json != nil) else {
                
                DSAlert.alert(title: "数据解析出错")
                return
            }
            print(url,json!)
            
          
            
            if json!["code"] as! Int == 0 {
              
                
                 sucess(json!)
                
                
            }else{
                
                DSAlert.alert(title: json!["codeStatus"] as? String)
            }
            
            
            
            
            
        }, failure: { (ssss, error) in
            print(error)
            DSAlert.alert(title: "网络连接失败")
        })
        

    }
    
    
}


class ViewController3: UIViewController {
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var passWord1: UITextField!
    @IBOutlet weak var passWord2: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "注册"
       
               
          
       
        
        navigationItem.setRightBarButton( UIBarButtonItem.init(title: "登录", style: .plain, target: self, action:#selector(login)), animated: true)
        
        
        
        

        // Do any additional setup after loading the view.
    }
    func login()  {
        
        
        
        navigationController?.pushViewController(UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController31"), animated: true)
        
    }

    
    @IBAction func registUser(_ sender: Any) {
        
        if passWord1.text != passWord2.text {
            DSAlert.alert(title: "两个密码不一致") 
        }else if (passWord1.text?.characters.count)! < 6 {
            DSAlert.alert(title: "密码长度至少6位")
        }else {
            
            //注册
              let para = ["count":userName.text!,"password":passWord1.text!]
            Post(url: main_url+URL_regist, para: para, sucess: { (data) in
                
                DSAlert.alert(title: "注册成功", sure: { 
                    self.login()
                })
                                
            })
            
            
            
                       
            
            
            
            
        }

            
            
        }
        
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        
               
        
        
        
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
