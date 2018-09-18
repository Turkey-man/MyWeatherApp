//
//  createLabel.swift
//  MyWeatherApp
//
//  Created by 1 on 11.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func createLabel(view: UIView, label: UILabel, alignment: NSTextAlignment, topAnchorConstant: CGFloat, width: CGFloat, height: CGFloat, font: String, fontSize: CGFloat, text: String) -> UILabel{
    label.textAlignment = alignment
    //MARK:- Constraints for cityLabel
    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false //Enables autolayout for label
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    label.topAnchor.constraint(equalTo: view.topAnchor, constant: topAnchorConstant).isActive = true
    label.widthAnchor.constraint(equalToConstant: width).isActive = true
    label.heightAnchor.constraint(equalToConstant: height).isActive = true
    label.font = UIFont(name: font, size: fontSize)
    label.text = text
    return label
    }
}
