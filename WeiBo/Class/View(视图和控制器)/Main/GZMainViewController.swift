//
//  GZMainViewController.swift
//  WeiBo
//
//  Created by guGuangZhou on 2017/7/7.
//  Copyright © 2017年 guGuangZhou. All rights reserved.
//

import UIKit

// 主控制器
class GZMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        setupComposeButton()
    }
    
    // MARK: - 监听方法
    // 撰写微博 
    // FIXME: 没有实现
    // fileprivate 能够保证方法私有，仅在当前对象被访问
    // @objc 允许这个函数在 '运行时' 通过 OC 的消息机制被调用！
   @objc fileprivate func composeStatus() {
        print("撰写微博")
    }
   
    // MARK: - 私有控件
    /// 撰写按钮
    fileprivate lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
}

// extension 类似于 OC 中的分类，在Swift 中还可以来切分代码块
// 可以把逻辑功能的函数，放在一个 extension 中
// 便于代码维护
// 注意：和 OC 的分类一样， extension 中不能定义属性
// MARK: - 设置界面
extension GZMainViewController {
    
    // 撰写按钮
    fileprivate func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        // 计算按钮的宽度
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1

        // CGRectInset 正数向内缩进，负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        // 按钮监听方法
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
    // 设置所有子控制器
    func setupChildControllers() {
        
        let array = [
            
            ["clsName": "GZHomeViewController", "title": "首页", "imageName": "home"],
            ["clsName": "GZMessageViewController", "title": "消息", "imageName": "message_center"],
            ["clsName": "UIViewController"],
            ["clsName": "GZDiscoverViewController", "title": "发现", "imageName": "discover"],
            ["clsName": "GZProfileViewController", "title": "我", "imageName": "profile"]
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            
            arrayM.append(controller(dict: dict))
        }

        viewControllers = arrayM
        
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName, title, imageName]
    /// - Returns: 子控制器
    private func controller(dict: [String: String]) -> UIViewController {
        
        // 1、取的字典内容
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            
            else {
            
                return UIViewController()
        }
        
        // 2、创建视图控制器
        let vc = cls.init()
        
        vc.title = title
        
        // 3、设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        // 4、设置 tabbar 的标题字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        // 系统默认是 12号 字
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: UIControlState(rawValue: 0))
        
        // 实例化导航栏控制器的时候， 会调用 push 方法将 rootVC 压栈
        let nav = GZNavigationController(rootViewController: vc)
        
        return nav
    }
}
