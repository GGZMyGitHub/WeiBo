
//
//  GZHomeViewController.swift
//  WeiBo
//
//  Created by guGuangZhou on 2017/7/7.
//  Copyright © 2017年 guGuangZhou. All rights reserved.
//

import UIKit

class GZHomeViewController: GZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - 显示好友
    @objc fileprivate func showFriends() {
        
        print(#function)
        
        let VC = GZDemoViewController()
        
        // VC.hidesBottomBarWhenPushed = true
        // push 的动作 是 nav 做的
        navigationController?.pushViewController(VC, animated: true)
    }
    
    // MARK: - 轮播图
    @objc fileprivate func cycleScrollView() {
        
        print(#function)
        
        let VC = GZCycleScrollerController()
        
        // VC.hidesBottomBarWhenPushed = true
        // push 的动作 是 nav 做的
        navigationController?.pushViewController(VC, animated: true)
    }
}

// MARK: - 设置界面
extension GZHomeViewController {
    
    // 重写父类方法
    override func setupUI() {
        super.setupUI()
        
        view.backgroundColor = UIColor.white
        
        // 设置导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "轮播图", style: .plain, target: self, action: #selector(cycleScrollView))

    }
    
}
