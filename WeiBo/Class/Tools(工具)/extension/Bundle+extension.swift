//
//  Bundle+extension.swift
//  daoge_sineweibo
//
//  Created by 伍禄林 on 16/9/26.
//  Copyright © 2016年 伍禄林. All rights reserved.
//

import Foundation

extension Bundle {
    
    // 计算型属性类似于函数，没有参数，有返回值
    var namespace: String {
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
