//
//  StationViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 08.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit

class StationViewController: UIViewController {    
    var cities = [City]()
    var selectedStation = "", selectedDetailStation = "", direction = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = AllCities.loadCities(direction)
    }
}

extension StationViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath)
        let city = cities[indexPath.row]
        
        cell.textLabel?.text = "\(city.countryTitle), \(city.title)"
        
        if let station = city.stations.first {
            cell.detailTextLabel?.text = "\(station.title)"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        
        self.selectedStation = currentCell.textLabel!.text!
        self.selectedDetailStation = currentCell.detailTextLabel!.text!
        performSegueWithIdentifier("SelectedStation", sender: self)
    }
}







