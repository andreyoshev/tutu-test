//
//  AllCities.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 08.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import Foundation

class DataManager {
    static func loadCities(direction: String) -> [City] {
        var cities = [City]()
        
        let jsonFile = NSBundle.mainBundle().pathForResource("allStations", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        if let jsonDictionary = parseJSONFromData(jsonData) {
            let stnDictionaries = jsonDictionary["cities\(direction)"] as! [[String : AnyObject]]
            for stnDictionary in stnDictionaries {
                let city = City()
                city.fillWithDict(stnDictionary)
                cities.append(city)
            }
        }
        return cities
    }
    
    static func parseJSONFromData(jsonData: NSData?) -> [String : AnyObject]? {
        if let data = jsonData {
            do {
                let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String : AnyObject]
                return jsonDict
            } catch let error as NSError {
                print("Error: \(error.localizedDescription)")
            }
        }
        return nil
    }
}