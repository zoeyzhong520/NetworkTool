//
//  SearchModel.swift
//  NetworkTool
//
//  Created by JOE on 2017/6/30.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchModel: NSObject {
    
    var code:NSNumber?
    var com:NSObject?
    var data:Array<SearchData>?
    
    var msg:NSObject?
    var timestamp:NSNumber?
    
    class func parseData(data:Data) -> SearchModel {
        
        let json = JSON(data: data)
        let model = SearchModel()
        model.code = json["code"].number
        
        var array = Array<SearchData>()
        for (_,subjson) in json["data"] {
            let dataModel = SearchData.parse(json: subjson)
            array.append(dataModel)
        }
        model.data = array
        
        return model
    }
}

class SearchData:NSObject {
    
    var bid:String?
    var book_level:String?
    var book_name:String?
    var picture_url:String?
    
    class func parse(json:JSON) -> SearchData {
        
        let model = SearchData()
        model.bid = json["bid"].string
        model.book_level = json["book_level"].string
        model.book_name = json["book_name"].string
        model.picture_url = json["picture_url"].string
        return model
    }
}
