//
//  StationViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 08.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit

class StationViewController: UIViewController, UISearchBarDelegate {
    weak var delegate: StationViewControllerDelegate?
    var cities: [City] = []
    var filteredCities: [City] = []
    var direction: RouteDirection = .From
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = DataManager.loadCities(direction)
        self.filterStationsWithQuery("")
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(keyboardWillShow),
                                                         name: UIKeyboardWillShowNotification,
                                                         object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(keyboardWillHide),
                                                         name: UIKeyboardWillHideNotification,
                                                         object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(keyboardWillChange),
                                                         name: UIKeyboardWillChangeFrameNotification,
                                                         object: nil)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterStationsWithQuery(searchText)
        self.tableView.reloadData()
    }
    
    @IBAction func didSelectCell(segue:UIStoryboardSegue) {
    }
    
    // Создаем копию массива городов без станций и фильтруем по тексту из строки поиска
    func filterStationsWithQuery(query: String) {
        filteredCities.removeAll()
        for city in self.cities {
            let filteredCity = city.copyWithoutStations()
            var shouldAddCity = false
            for station in city.stations {
                if (query.characters.count == 0 || station.title.uppercaseString.containsString(query.uppercaseString)) {
                    filteredCity.stations.append(station)
                    shouldAddCity = true
                }
            }
            if (shouldAddCity) {
                filteredCities.append(filteredCity)
            }
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, CGRectGetHeight(keyboardFrame), 0)
        self.tableView.scrollIndicatorInsets = self.tableView.contentInset
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.tableView.contentInset = UIEdgeInsetsZero
        self.tableView.scrollIndicatorInsets = self.tableView.contentInset
    }
    
    func keyboardWillChange(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, CGRectGetHeight(keyboardFrame), 0)
        self.tableView.scrollIndicatorInsets = self.tableView.contentInset
    }
}

protocol StationViewControllerDelegate: NSObjectProtocol {
    func stationViewController(stationController: StationViewController, didSelectStation station: Station)
}

extension StationViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return filteredCities.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let city = filteredCities[section]
        return city.stations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath)

        let city = filteredCities[indexPath.section]
        cell.textLabel?.text = "\(city.stations[indexPath.row].title)"
        
        cell.detailTextLabel!.text = "\(city.title!), \(city.countryTitle!)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.stationViewController(self, didSelectStation: filteredCities[indexPath.section].stations[indexPath.row])
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let city = filteredCities[section]
        return "\(city.title!), \(city.countryTitle!)"
    }
}







