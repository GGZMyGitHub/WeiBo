//
//  GZNavigationController.swift
//  WeiBo
//
//  Created by guGuangZhou on 2017/7/7.
//  Copyright © 2017年 guGuangZhou. All rights reserved.
//

import UIKit

class GZNavigationController: UINavigationController {

    // 重写 push 方法，所有的 push 动作 都会调用此方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        // 如果不是栈底控制器，才需要隐藏，根控制器不需要处理
        // 隐藏底部的 tabbar
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
        }

        super.pushViewController(viewController, animated: true)
        
    }
}
