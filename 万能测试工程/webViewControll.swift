//
//  webViewControll.swift
//  万能测试工程
//
//  Created by 段帅 on 16/12/19.
//  Copyright © 2016年 newfuture. All rights reserved.
//

import UIKit

class webViewControll: UIViewController {

    let ppt = "http://ftp.sooc.com/2016-07-20/578f1a1c52aca343902201.ppt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let web = UIWebView()
        web.frame = view.bounds
        web.scalesPageToFit = true
        web.loadRequest(URLRequest.init(url: URL.init(string: ppt)!))
        view.addSubview(web)
        

        // Do any additional setup after loading the view.
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
