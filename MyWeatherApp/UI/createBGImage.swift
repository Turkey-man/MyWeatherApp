//
//  createBGImage.swift
//  MyWeatherApp
//
//  Created by 1 on 11.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func createBGImage(view: UIView, backgroundImage: UIImageView, city: String, currentTime: Int){
        var backgroundImageView = UIImageView()
        var imageName: String
        
        switch (city, currentTime) {
        case ("Kyiv", 00..<05):
            imageName = "KyivNight.jpg"
        case ("Kyiv", 17..<24):
            imageName = "KyivNight.jpg"
        case ("Kyiv", 05..<17):
            imageName = "KyivDay.jpg"

        case ("Kharkiv", 00..<05):
            imageName = "KharkivNight.jpg"
        case ("Kharkiv", 17..<24):
            imageName = "KharkivNight.jpg"
        case ("Kharkiv", 05..<17):
            imageName = "KharkivDay.jpg"

        case ("Lviv", 00..<05):
            imageName = "LvivNight.jpg"
        case ("Lviv", 17..<24):
            imageName = "LvivNight.jpg"
        case ("Lviv", 05..<17):
            imageName = "LvivDay.jpg"

        default: imageName = "Goatmoon.jpg"
        }
        backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = UIImage(named: imageName)
        view.addSubview(backgroundImageView)       
        }
    }
