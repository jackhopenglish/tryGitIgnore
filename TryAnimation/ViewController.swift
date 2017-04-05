//
//  ViewController.swift
//  TryAnimation
//
//  Created by 劉韋呈 on 2017/3/31.
//  Copyright © 2017年 劉韋呈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topView = UIView()
    let loginButton = UIButton()
    let bottomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController {
    fileprivate func setupView() {
        self.view.backgroundColor = UIColor.white
        loginButton.setTitle("login_button_title".localized(withTabelName: "FirstViewController"),
                             for: .normal)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        loginButton.backgroundColor = UIColor.black
        loginButton.layer.cornerRadius = 20
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(40)
            make.height.equalTo(40)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.bottom.equalTo(loginButton.snp.top).offset(-10)
        }
        
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.bottom.left.right.equalTo(0)
        }
    }
}
