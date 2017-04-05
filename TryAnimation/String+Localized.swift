//
//  String+Localized.swift
//  TryAnimation
//
//  Created by 劉韋呈 on 2017/3/30.
//  Copyright © 2017年 劉韋呈. All rights reserved.
//

import Foundation

extension String {
    func localized(withTabelName: String) -> String {
        return NSLocalizedString(self, tableName: withTabelName, bundle: .main, value: "", comment: "")
    }
}
