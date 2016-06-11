//
//  StationViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 08.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit

protocol StationViewControllerDelegate: NSObjectProtocol {
    func stationViewControllerDidSelectStation(station: Station)
}

class StationViewController: UIViewController {
    weak var delegate: StationViewControllerDelegate?
    var cities = [City]()
    var direction = ""
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = DataManager.loadCities(direction)
    }
}

extension StationViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let city = cities[section]
        return city.stations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath)

        let city = cities[indexPath.section]
        cell.textLabel?.text = "\(city.stations[indexPath.row].title)"
        
        cell.detailTextLabel?.text = "\(city.title), \(city.countryTitle)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.stationViewControllerDidSelectStation(cities[indexPath.section].stations[indexPath.row])
        performSegueWithIdentifier("SelectedStation", sender: self)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let city = cities[section]
        return "\(city.title), \(city.countryTitle)"
    }
}







