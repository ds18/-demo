//
//  DSAlert.swift
//  万能测试工程
//
//  Created by 段帅 on 16/11/12.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit

class DSAlert: NSObject {
    
    
    class func alert(title:String? ,sure: (()->Void)?){
        
        let alertControl = UIAlertController.init(title: "提示", message: title, preferredStyle: .alert)
              let action_sure = UIAlertAction.init(title: "确定", style: .default, handler: {(act) -> Void in
                 
                sure!()                
            } )
        let action_cancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alertControl.addAction(action_sure)
        alertControl.addAction(action_cancel)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertControl, animated: true, completion: nil)
        
        
    }
    
    class func alert(title:String?){
        
        let  alertControl = UIAlertController.init(title: "提示", message: title, preferredStyle: .alert)
       
        let action_cancel = UIAlertAction.init(title: "确定", style: .cancel, handler: nil)
      
        alertControl.addAction(action_cancel)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertControl, animated: true, completion: nil)
        
        
    }
    
    class func alert(noCancel title2:String? , sure: (()->Void)?){
        
        let alertControl = UIAlertController.init(title: "提示", message: title2, preferredStyle: .alert)
        let action_sure = UIAlertAction.init(title: "确定", style: .default, handler: {(act) -> Void in
            
            sure!()                
        } )
       // let action_cancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alertControl.addAction(action_sure)
       // alertControl.addAction(action_cancel)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertControl, animated: true, completion: nil)
        
        
    }


    
    
}
