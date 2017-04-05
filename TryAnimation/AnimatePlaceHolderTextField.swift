//
//  AnimatePlaceHolderTextField.swift
//  TryAnimation
//
//  Created by 劉韋呈 on 2017/3/31.
//  Copyright © 2017年 劉韋呈. All rights reserved.
//

import UIKit
import SnapKit

class AnimatePlaceHolderTextField: UIView {
    let placeholderLabel = UILabel()
    let textfield = UITextField()
    let clearButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholderText: String) {
        self.init(frame: .zero)
        placeholderLabel.text = placeholderText
        textfield.placeholder = placeholderText
    }
}

extension AnimatePlaceHolderTextField {
    fileprivate func setupView() {
        placeholderLabel.font = UIFont(name: "Helvetica", size: 20)
        placeholderLabel.sizeToFit()
        self.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.bottom.equalTo(2)
        }
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: textfield.frame.size.height - width, width: textfield.frame.size.width, height: textfield.frame.size.height)
        border.borderWidth = width
        textfield.layer.addSublayer(border)
        textfield.layer.masksToBounds = true
        self.addSubview(textfield)
        textfield.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self)
        }
        
        clearButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 10, height: 10))
            make.centerY.equalTo(placeholderLabel)
            make.trailing.equalTo(self).offset(2)
        }
    }
}
