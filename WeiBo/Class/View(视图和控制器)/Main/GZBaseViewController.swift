//
//  GZBaseViewController.swift
//  WeiBo
//
//  Created by guGuangZhou on 2017/7/7.
//  Copyright © 2017年 guGuangZhou. All rights reserved.
//

import UIKit

class GZBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - 设置界面
extension GZBaseViewController {

    func setupUI() {

        view.backgroundColor = UIColor.cz_random()
    }
}
    
