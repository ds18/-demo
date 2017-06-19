//
//  ViewController33.swift
//  万能测试工程
//
//  Created by 段帅 on 16/11/13.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit



class ViewController33: UIViewController {

    
    @IBOutlet weak var ningCheng: UITextField!
    
    @IBOutlet weak var sex: UISegmentedControl!
    
    
    @IBOutlet weak var phone: UITextField!
    
    
    @IBOutlet weak var age: UITextField!
    
    
    @IBOutlet weak var newPass: UITextField!
    
    
    @IBOutlet weak var oldPass: UITextField!
    
    
    
    
       var user = UserMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user111 =  UserDefaults.standard.object(forKey: USERMESSAGE) 
        user.setValuesForKeys(user111 as! [String : Any])
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ningCheng.text = user.name
        age.text = user.age
        phone.text = user.phone
        if user.sex == "未设置" {
            sex.selectedSegmentIndex = 0
        }else if user.sex == "女" {
            
            sex.selectedSegmentIndex = 1
        }else {
            
            sex.selectedSegmentIndex = 2
        }
        
        
        
    }
    
    @IBAction func submitMessage(_ sender: Any) {
        
        user.age = age.text!
        user.name = ningCheng.text!
        user.password = newPass.text!
        user.phone = phone.text!
        
        if sex.selectedSegmentIndex == 0 {
            user.sex = "未设置"
        }else if sex.selectedSegmentIndex == 1 {
            
            user.sex = "女"

        }else {
            
            user.sex = "男"

        }
        
        var para = [String:String]()
        
        para = user.transToDic()
        
        if oldPass.text?.characters.count != 0 {
            //修改密码
            if (newPass.text?.characters.count)! < 6 {
                DSAlert.alert(title: "新密码至少6位")
                return
            }
            para.updateValue(oldPass.text!, forKey: "oldpass")
            
        }
        
        
        Post(url:main_url + URL_UPDATA, para: para, sucess: {(data) -> Void in
            
            //修改成功
            
            UserDefaults.standard.set(para, forKey: USERMESSAGE)
            
            DSAlert.alert(title: "修改成功")
        
        
        
        })
        

        
        
        
        
        
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
