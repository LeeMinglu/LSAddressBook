//
//  LSContact.swift
//  LSAddressBook
//
//  Created by 李明禄 on 2017/1/20.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSContact: NSObject {
    var name: String?
    var phone: String?
    
//    let properties = ["name", "phone"]
//    override var description: String {
//        let dict = dictionaryWithValues(forKeys: properties)
//        return ("\(dict)")
//    }
    // MARK: - 构造函数
//    init(dict: [String: AnyObject]) {
//        super.init()
//        setValuesForKeys(dict)
//    }
    
    
    
//    override func  setValue(_ value: Any?, forUndefinedKey key: String) { }
    
//    class func dictModel(list: [[String: AnyObject]]) -> [Weibo] {
//        
//        var models = [Weibo]()
//        for dict in list {
//            models.append(Weibo(dict: dict))
//        }
//        return models
//    }
    
     init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
    
    
}
