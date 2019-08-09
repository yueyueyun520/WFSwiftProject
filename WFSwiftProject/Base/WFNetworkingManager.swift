//
//  WFNetworkingManager.swift
//  WFSwiftProject
//
//  Created by efun on 2019/6/25.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WFNetworkingManager: NSObject {
    struct responeData {
        var jsonData:JSON?
        var error:Error?
        var success:Bool = false
        var data:Data?
    }
    
    //类方法
    class func fectData(url:String,param:Dictionary<String, Any>,completionHandler: @escaping (responeData) -> Void ){
        //判断网络状态
        let url = "https://api-social.adnonstop.com/index.php?r=1.3.0/article/recommend/get-list&req=eyJpc19lbmMiOjAsImN0aW1lIjoxNTU1MTIwOTg2LjgzNTYzNCwib3NfdHlwZSI6ImlvcyIsImRldmljZSI6ImlQaG9uZSA3IiwiaW1laSI6IjE5NkU3RDBCLTNENzItNDI1OC04NERELUZBMkQ1MDQ1OTdDNSIsImNvbWVfZnJvbSI6eyJ2ZXJzaW9uIjoiMi4wLjUifSwidmVyc2lvbiI6IjEuMy4wIiwicGFyYW0iOnsibWF4X2lkIjowLCJsYXRpdHVkZSI6IjIzLjExNjI1NSIsInR5cGUiOjAsImxvbmdpdHVkZSI6IjExMy4zMjI3NTkiLCJmaXJzdF9pZCI6MH0sImFwcF9uYW1lIjoidHdlbnR5X29uZV9pcGhvbmUiLCJzaWduX2NvZGUiOiIyZjYwYTNlZDI5NTY1ZDA0NjVkIn0%3D"
        let managerSession = Alamofire.SessionManager.default
        managerSession.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).response (completionHandler: {
            (response) in
           
            
            let json:JSON =  try! JSON(data: response.data!)
            if response.error == nil {  //请求成功
                if JSON.null != json {
                    let completionData = responeData(jsonData: json, error:response.error,success: true,data: response.data!)
                    completionHandler(completionData)
                }
            } else { //请求失败
                let completionData = responeData(jsonData: json, error:response.error,success: false,data: response.data!)
                completionHandler(completionData)
                
            }
            
        })
        
        
    }
    
}
