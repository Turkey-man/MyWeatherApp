//
//  createButton.swift
//  MyWeatherApp
//
//  Created by 1 on 04.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import UIKit

extension UIButton {
    func createButton(button: UIButton, backgroundColor: UIColor, text: String, cornerRadius: CGFloat, view: UIView, bottomAnchorConstant: CGFloat, widthAnchorConstant: CGFloat, heightAnchorConstant: CGFloat){
        button.backgroundColor = backgroundColor
        button.titleLabel?.textColor = UIColor.black
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false //Enables autolayout for button
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomAnchorConstant).isActive = true
        button.widthAnchor.constraint(equalToConstant: widthAnchorConstant).isActive = true
        button.heightAnchor.constraint(equalToConstant: heightAnchorConstant).isActive = true
        button.layer.cornerRadius = cornerRadius
        button.alpha = 0.5
    }
}

