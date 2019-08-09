//
//  WFDynamicModel.swift
//  WFSwiftProject
//
//  Created by efun on 2019/6/26.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


//root
struct WFDynamicModel:Codable{

    var code:Int?
    var dataDic:DataModel?
    
    enum CodingKeys:String,CodingKey {
        case code
        case dataDic = "data"
    }

}

//data
struct DataModel:Codable {
    var moodTitle:String?
    var moodTitleDesc:String?
    var searchTitle:String?
    var list:[List]?
    
    enum CodingKeys:String,CodingKey {
        case moodTitle = "mood_title"
        case moodTitleDesc = "mood_title_desc"
        case searchTitle = "search_title"
        case list
    }
}

//list
struct List:Codable {
    var content:String?
    var coverImgUrlFuzzy:String?
    var coverImgUrl:String?
    var imgUrls:[ImgUrls]?
    var userInfo:UserInfo?
    
    enum CodingKeys:String,CodingKey {
        case content
        case coverImgUrlFuzzy = "cover_img_url_fuzzy"
        case coverImgUrl = "cover_img_url"
        case imgUrls = "img_urls"
        case userInfo = "user_info"
    }
    
}

struct ImgUrls:Codable {
    var imageUrl:String?
    var imageUrlFuzzy:String?  //大图
    
    enum CodingKeys:String,CodingKey {
        case imageUrl = "image_url"
        case imageUrlFuzzy = "image_url_fuzzy"
        
    }
}

struct UserInfo:Codable {
    var nickName:String?
    var userIcon:String?
    
    enum CodingKeys:String,CodingKey {
        case nickName = "nickname"
        case userIcon = "user_icon"
    }
}






//类似于分类 WFDynamicModel 的分类
//extension WFDynamicModel {
    //解析数据
//    init(from decoder: Decoder) throws{
//        let baseData = try decoder.container(keyedBy: CodingKeys.self)
//        code = try baseData.decode(Int.self, forKey: CodingKeys.code)
//        //nestedContainer  获取内嵌层
//        let dataDic = try baseData.nestedContainer(keyedBy: dataDicKeys.self, forKey: .dataDic)
//        moodTitle = try dataDic.decode(String.self, forKey: .moodTitle)
//        moodTitleDesc = try dataDic.decode(String.self, forKey: .moodTitleDesc)
//
//    }
//    //编码数据
//    func encode(to encoder: Encoder) throws{
//
//    }
//}

/**
 自定义解析
 
 struct WFDynamicModel:Codable {
 
 var code:Int
 var dataDic:DataModel
 //data
 var moodTitle:String
 var moodTitleDesc:String
 
 enum CodingKeys:String,CodingKey {
 case code
 case dataDic = "data"
 }
 
 enum dataDicKeys:String,CodingKey {
 case moodTitle = "mood_title"
 case moodTitleDesc = "mood_title_desc"
 }
 }
 
 
 //类似于分类 WFDynamicModel 的分类
 extension WFDynamicModel {
 //解析数据
 init(from decoder: Decoder) throws{
 let baseData = try decoder.container(keyedBy: CodingKeys.self)
 code = try baseData.decode(Int.self, forKey: CodingKeys.code)
 //nestedContainer  获取内嵌层
 let dataDic = try baseData.nestedContainer(keyedBy: dataDicKeys.self, forKey: .dataDic)
 moodTitle = try dataDic.decode(String.self, forKey: .moodTitle)
 moodTitleDesc = try dataDic.decode(String.self, forKey: .moodTitleDesc)
 
 }
 //编码数据
 func encode(to encoder: Encoder) throws{
 
 }
 }
 */
