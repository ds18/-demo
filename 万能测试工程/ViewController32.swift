//
//  ViewController32.swift
//  万能测试工程
//
//  Created by 段帅 on 16/11/12.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit




class ViewController32: UIViewController,UITableViewDelegate,UITableViewDataSource {

  
    var user = UserMessage()
    
   
    var data = [[String]]()
    
    @IBOutlet weak var userHeader: UIImageView!
    
    @IBOutlet weak var button_buqian: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var button_jiaban: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        

        // Do any additional setup after loading the view.
    }
    
    
    func loadData()  {
        
        
        let user111 =  UserDefaults.standard.object(forKey: USERMESSAGE) 
        user.setValuesForKeys(user111 as! [String : Any])
        
        if !(user.image.characters.isEmpty) {
              userHeader.sd_setImage(with: URL.init(string: user.image))
        }
      print(user)
          print(user.name,user.image,user.count)
        nameLabel.text = user.name
        
        
        data = [["账号:",user.count],["手机号:",user.phone],["年龄:",user.age],["性别:",user.sex],["加入时间",user.input_time]]
        
        table.rowHeight = 50;
        
        table.reloadData()
        
        
        button_jiaban.setTitle("一键签到", for: UIControlState())
        button_jiaban.setTitle("已签到", for: .selected)
        if user.isqiandao == "0" {
            button_jiaban.isSelected = false
        }else{
            
            button_jiaban.isSelected = true
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.numOfProperty()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ID")
        if (cell == nil) {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "id")
        }
        cell?.textLabel?.text = data[indexPath.row][0]
        cell?.detailTextLabel?.text = data[indexPath.row][1]
        
        
        
        return cell!;
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updata(_ sender: Any) {
        //修改信息
        
        navigationController?.pushViewController(UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController33"), animated: true)
        
    }
    
    
    //一键加班
    
    @IBAction func yiJianJiaBan(_ sender: Any) {
        
        let button = sender as! UIButton
        
            
            Post(url:main_url + URL_sign, para: ["count":user.count,"isbuqian":"0"], sucess: { (date) in
             
             DSAlert.alert(noCancel: date["codeStatus"] as? String, sure: { 
                button.isSelected = !button.isSelected
                
                
             })
              
                
            })
            
     
        
        
        
        
    }
    
    //补签
    
    @IBAction func buQian(_ sender: Any) {
        
        
//        Post(url:main_url + URL_sign, para: ["count":user.count,"isbuqian":"1","data":[["date":"2016-11-11"],["date":"2016-11-12"],["date":"2016-11-13"]]], sucess: { (date) in
//            
//           DSAlert.alert(title: "补签成功-前端")
//            
//            
//        })

        let contrl = LookupSignVIewController()
        navigationController?.pushViewController(contrl, animated: true)
        
        
        
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
