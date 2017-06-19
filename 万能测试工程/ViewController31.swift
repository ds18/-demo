//
//  ViewController31.swift
//  万能测试工程
//
//  Created by 段帅 on 16/11/12.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit
let USERMESSAGE = "usermessagesss"


/// 用户信息
class UserMessage : NSObject {
    
    var name = ""
    var sex = ""
    var age = ""
    var image = ""
    var count = ""
    var password = ""
    var phone = ""
    var input_time = ""
    var isqiandao = ""
    
    
   override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    func numOfProperty() -> Int {
        
        return 5
        
        
    }
    
    func transToDic() -> [String:String] {
        
        var dic = [String:String]()
         dic.updateValue(self.name, forKey: "name")
         dic.updateValue(self.sex, forKey: "sex")
         dic.updateValue(self.age, forKey: "age")
         dic.updateValue(self.image, forKey: "image")
         dic.updateValue(self.count, forKey: "count")
         dic.updateValue(self.password, forKey: "password")
         dic.updateValue(self.phone, forKey: "phone")
        return dic
        
    }
    
    
    
}


class ViewController31: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
       
      
        super.viewDidLoad()
        title = "登录"

        // Do any additional setup after loading the view.
    }

    @IBAction func logIn(_ sender: Any) {
        
        //登录
        let para = ["count":userName.text!,"password":passWord.text!]
        
        Post(url: main_url + URL_LOGIN, para: para, sucess: {(data) -> Void in
            
            
            let dic = data["data"] as! [String:String]
            
            
         
         
            
            
            UserDefaults.standard.set(dic, forKey: USERMESSAGE)
        
            
            DSAlert.alert(title: "登录成功", sure: {
                
                 self.navigationController?.pushViewController(UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController32"), animated: true)
            })
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
