//
//  outline.swift
//  MyWeatherApp
//
//  Created by 1 on 18.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    func outLine(oulineColor: UIColor){
        let strokeTextAttributes = [
            NSAttributedStringKey.strokeColor : oulineColor,
            NSAttributedStringKey.strokeWidth : -4.0,
            NSAttributedStringKey.font : self.font
            ] as [NSAttributedStringKey : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
}
