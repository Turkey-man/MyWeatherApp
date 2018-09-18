//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by 1 on 04.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import UIKit
import Foundation

class ViewControllerForView: UIViewController {
    
    var modelController: CoordinatesModelController!
    var mainView: UIViewController!
    var button = UIButton()
    var label = UILabel()
    var cityLabel = UILabel()
    var temperatureLabel = UILabel()
    var backgroundImage = UIImageView()
    var forecastService: ForecastService!
    let forecastAPIKey = "529d3f1e740aaca7df6d866b1ad9af15"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        mainView = UIViewController()
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let currentTime = Int(formatter.string(from: now))
        
        button.createButton(button: self.button,
                            backgroundColor: .white,
                            text: "Cities",
                            cornerRadius: 30,
                            view: self.view,
                            bottomAnchorConstant: -30,
                            widthAnchorConstant: 100,
                            heightAnchorConstant: 50)
        button.addTarget(self, action: #selector(buttonPushed), for: .touchDown)
        
        label.createLabel(view: self.view,
                          label: self.cityLabel,
                          alignment: .center,
                          topAnchorConstant: 30,
                          width: 130,
                          height: 60,
                          font: "Helvetica",
                          fontSize: 36,
                          text: " ")
        
        label.createLabel(view: self.view,
                          label: self.temperatureLabel,
                          alignment: .center,
                          topAnchorConstant: 120,
                          width: 200,
                          height: 220,
                          font: "Helvetica",
                          fontSize: 90,
                          text: " ")
        
        //MARK:- Filling
        //modelController = CoordinatesModelController()
        let model = modelController.cityCoordinates
        let coordinate = model.coords
        cityLabel.text = model.name
        cityLabel.outLine(oulineColor: .gray)
        
        
        backgroundImage.createBGImage(view: self.view, backgroundImage: self.backgroundImage, city: cityLabel.text!, currentTime: currentTime!)
        view.bringSubview(toFront: button)
        view.bringSubview(toFront: cityLabel)
        view.bringSubview(toFront: temperatureLabel)
        view.sendSubview(toBack: backgroundImage)
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longtitude: coordinate.long) { (currentWeather) in
             //MARK:- Back to main thread in case of success
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        self.temperatureLabel.text = "\(temperature)°"
                    } else {
                      self.temperatureLabel.text = "-"
                    }
                    self.temperatureLabel.outLine(oulineColor: .gray)
                }
            }
        }
    }
    
    @objc func buttonPushed(target: UIButton) {
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let svc = CityList()
        svc.modelController = modelController
        svc.modalTransitionStyle = modalStyle
        present(svc, animated: true, completion: nil)
    }
}
