//
//  SecondViewController.swift
//  
//
//  Created by 劉韋呈 on 2017/3/30.
//
//

import UIKit
import SnapKit

class SecondViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// MARK: - 处理UI控件的点击事件
extension SecondViewController {
    func buttonDidClicked() {
        /**
         *  应该由FirstVC执行下面这行代码，为了保持demo简单，突出重点，这里的写法其实是不严格的，请见谅
         */
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension SecondViewController {
    fileprivate func setupView() {
        let loginLabel = UILabel()
        loginLabel.text = "login_text".localized(withTabelName: "SecondViewController")
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont(name: "Helvetica", size: 30)
        loginLabel.sizeToFit()
        topView.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.leading.equalTo(20)
        }
        
        let emailTextfield = AnimatePlaceHolderTextField(placeholderText:
            "email_textfield_placeholder".localized(withTabelName: "SecondViewController"))
        emailTextfield.sizeToFit()
        topView.addSubview(emailTextfield)
        emailTextfield.snp.makeConstraints { (make) in
            make.leading.equalTo(loginLabel)
            make.trailing.equalTo(-20)
            make.top.equalTo(loginLabel.snp.bottom).offset(-50)
            make.height.equalTo(30)
        }
        
        let passwordTextfield = AnimatePlaceHolderTextField(placeholderText:
            "password_textfield_placeholder".localized(withTabelName: "SecondViewController"))
        topView.addSubview(passwordTextfield)
        passwordTextfield.snp.makeConstraints { (make) in
            make.leading.equalTo(loginLabel)
            make.trailing.equalTo(-20)
            make.top.equalTo(emailTextfield.snp.bottom).offset(-5)
        }
        
        loginButton.addTarget(self, action: #selector(SecondViewController.buttonDidClicked), for: .touchUpInside)
        
    }
}
