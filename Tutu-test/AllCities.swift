//
//  AllCities.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 08.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import Foundation
enum Direction: String {
    case From = "From"
    case To = "To"
}
class AllCities {
    static func loadCities(direction: Direction) -> [City] {
        var cities = [City]()
        
        let jsonFile = NSBundle.mainBundle().pathForResource("allStations", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        if let jsonDictionary = parseJSONFromData(jsonData) {
            let stnDictionaries = jsonDictionary["cities\(direction.rawValue)"] as! [[String : AnyObject]]
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
                let jsonDic = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String : AnyObject]
                return jsonDic
            } catch let error as NSError {
                print("Error: \(error.localizedDescription)")
            }
        }
        return nil
    }
}