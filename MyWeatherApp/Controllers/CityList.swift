//
//  CityList.swift
//  MyWeatherApp
//
//  Created by 1 on 04.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import UIKit
import Foundation


class CityList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var modelController: CoordinatesModelController!
    var secondView: UIViewController!
    var tableView = UITableView()
 
    struct CityPlace {
        var coords: (lat: Double, long: Double)
        var name: String
    }
    
    let kyiv = CityPlace(coords: (lat: 50.4547, long: 30.5238), name: "Kyiv")
    let kharkiv = CityPlace(coords: (lat: 49.9883, long: 36.2328), name: "Kharkiv")
    let lviv = CityPlace(coords: (lat: 49.8383, long: 24.0232), name: "Lviv")
    
    var cities = [CityPlace]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities.append(kyiv)
        cities.append(kharkiv)
        cities.append(lviv)
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newName = cities[indexPath.row].name
        let newCoordinates = cities[indexPath.row].coords
        modelController.cityCoordinates = City(coords: newCoordinates, name: newName) //nil
        dismiss(animated: true, completion: nil)
    }
    
}
