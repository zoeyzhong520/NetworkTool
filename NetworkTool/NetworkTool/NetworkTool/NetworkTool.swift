//
//  NetworkTool.swift
//  NetworkTool
//
//  Created by JOE on 2017/6/30.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTool {
    
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ result : Any) -> ()) {
        
        //获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        //发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).validate().responseData { (response) in
            
            //获取结果
            switch response.result {
            case .success:
                guard let data = response.data else {
                    print(response.result.error!)
                    return
                }
                
                //将结果回调出去
                finishedCallback(data)
            case .failure(let nserror):
                print("error: \(nserror)")
            }
        }
    }
}
