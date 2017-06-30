//
//  ViewController.swift
//  NetworkTool
//
//  Created by JOE on 2017/6/30.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "http://54.223.77.112/read_api/index.php?s=Home/Teacher/getLevelBooksPaging&level=0&tid=54&type=2&start_id=0&num=0&book_name="
        
        NetworkTool.requestData(.get, URLString: urlString) { (data) in
            let searchModel = SearchModel.parseData(data: data as! Data)
            print("第一本书书名是：\(searchModel.data![0].book_name!)")
            print("第一本书书ID是：\(searchModel.data![0].bid!)")
            print("第一本书等级是：\(searchModel.data![0].book_level!)")
            print("第一本书图片是：\(searchModel.data![0].picture_url!)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

