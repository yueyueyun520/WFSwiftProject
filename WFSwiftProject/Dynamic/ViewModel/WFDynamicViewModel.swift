//
//  WFDynamicViewModel.swift
//  WFSwiftProject
//
//  Created by efun on 2019/6/26.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

class WFDynamicViewModel: NSObject {
    struct responeModel {
        var dataModel:WFDynamicModel?
    }

    class func loadData(completionHandler: @escaping (responeModel) -> Void) {
        WFNetworkingManager.fectData(url: "", param: [:]) { (responeData) in
           // print(responeData.jsonData)
            
            do { //throws 的要加do catch   有try都要do catch
                let decoder = JSONDecoder()
                let model = try decoder.decode(WFDynamicModel.self, from: responeData.data!)
                let respone = responeModel(dataModel: model)
                completionHandler(respone)
            } catch {
                
            }
            

        }
    }
    
    
}
