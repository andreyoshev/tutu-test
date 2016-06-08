//
//  AllCities.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 08.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import Foundation

class AllCities {
    var countryTitle = ""
    var cityTitle = ""
    var stationTitle = ""
    
    init(countryTitle: String, cityTitle: String, stationTitle: String) {
        self.countryTitle = countryTitle
        self.cityTitle = cityTitle
        self.stationTitle = stationTitle
    }
    
    init(stnDictionary: [String : AnyObject]) {
        countryTitle = stnDictionary["countryTitle"] as! String
        cityTitle = stnDictionary["cityTitle"] as! String
    }
    
    init(stationDictionary: [String : AnyObject]) {
        stationTitle = "" //new Dictionary
    }
    
    static func downloadAllCitiesFrom() -> [AllCities] {
        var station = [AllCities]()
        
        let jsonFile = NSBundle.mainBundle().pathForResource("allStations", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        if let jsonDictionary = parseJSONFromDate(jsonData) {
            let stnDictionaries = jsonDictionary["citiesFrom"] as! [[String : AnyObject]]
            for stnDictionary in stnDictionaries {
                let newCity = AllCities(stnDictionary: stnDictionary)
                station.append(newCity)
            }
        }
        return station
    }
    static func downloadAllCitiesTo() -> [AllCities] {
        var station = [AllCities]()
        
        let jsonFile = NSBundle.mainBundle().pathForResource("allStations", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        if let jsonDictionary = parseJSONFromDate(jsonData) {
            let stnDictionaries = jsonDictionary["citiesTo"] as! [[String : AnyObject]]
            for stnDictionary in stnDictionaries {
                let newCity = AllCities(stnDictionary: stnDictionary)
                station.append(newCity)
            }
        }
        return station
    }
    
    static func parseJSONFromDate(jsonDate: NSData?) -> [String : AnyObject]? {
        if let data = jsonDate {
            do {
                let jsonDic = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String : AnyObject]
                return jsonDic
            } catch let error as NSError {
                print("Error: \(error.localizedDescription)")
            }
        }
        return nil
    }
}