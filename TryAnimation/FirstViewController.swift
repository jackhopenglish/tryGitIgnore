//
//  ViewController.swift
//  TryAnimation
//
//  Created by 劉韋呈 on 2017/3/30.
//  Copyright © 2017年 劉韋呈. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: ViewController {
    lazy var secondViewController: SecondViewController = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.transitioningDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FirstViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HalfWaySpringAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HalfWaySpringAnimator()
    }
}

extension FirstViewController {
    @objc fileprivate func loginButtonClicked() {
        self.present(secondViewController, animated: true, completion: nil)
    }
}

extension FirstViewController {
    fileprivate func setupView() {
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.text = "title_text".localized(withTabelName: "FirstViewController")
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Helvetica", size: 30)
        titleLabel.sizeToFit()
        topView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(topView)
            make.top.equalTo(100)
        }
        
        let tryButton = UIButton()
        tryButton.setTitle("try_button_title".localized(withTabelName: "FirstViewController"),
                           for: .normal)
        tryButton.titleLabel?.textAlignment = .center
        tryButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        tryButton.setTitleColor(UIColor.black, for: .normal)
        tryButton.layer.borderColor = UIColor.black.cgColor
        tryButton.layer.borderWidth = 2
        tryButton.layer.cornerRadius = 20
        bottomView.addSubview(tryButton)
        tryButton.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView)
            make.leading.equalTo(loginButton).offset(2)
            make.trailing.equalTo(bottomView.snp.centerX).offset(-2)
            make.height.equalTo(40)
        }
        
        let introductionButton = UIButton()
        introductionButton.setTitle("introduction_button_title".localized(withTabelName: "FirstViewController"),
                                    for: .normal)
        introductionButton.titleLabel?.textAlignment = .center
        introductionButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        introductionButton.setTitleColor(UIColor.black, for: .normal)
        introductionButton.layer.borderColor = UIColor.black.cgColor
        introductionButton.layer.borderWidth = 2
        introductionButton.layer.cornerRadius = 20
        bottomView.addSubview(introductionButton)
        introductionButton.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView)
            make.trailing.equalTo(loginButton).offset(-2)
            make.leading.equalTo(bottomView.snp.centerX).offset(2)
            make.height.equalTo(40)
        }
        
        let notStudentButton = UIButton()
        notStudentButton.setTitle("notStudentButton_button_title".localized(withTabelName: "FirstViewController"),
                                  for: .normal)
        notStudentButton.titleLabel?.textAlignment = .center
        notStudentButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        notStudentButton.setTitleColor(UIColor.black, for: .normal)
        bottomView.addSubview(notStudentButton)
        notStudentButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(bottomView).offset(-50)
            make.leading.equalTo(bottomView).offset(50)
        }
        
        let contactUsButton = UIButton()
        contactUsButton.setTitle("contactUsButton_button_title".localized(withTabelName: "FirstViewController"),
                                 for: .normal)
        contactUsButton.titleLabel?.textAlignment = .center
        contactUsButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        contactUsButton.setTitleColor(UIColor.black, for: .normal)
        bottomView.addSubview(contactUsButton)
        contactUsButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(bottomView).offset(-50)
            make.trailing.equalTo(bottomView).offset(-50)
        }
    }
}

