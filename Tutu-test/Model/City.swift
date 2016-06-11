//
//  City.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 09.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import Foundation

public class City {
    var countryTitle = ""
    var title = ""
    var stations = [Station]()
    
    func fillWithDict(dict: [String : AnyObject]?) {
        if let d = dict {
            self.countryTitle = d["countryTitle"] as! String
            self.title = d["cityTitle"] as! String
            
            for stationDict in d["stations"] as! NSArray {
                let station = Station()
                station.fillWithDict(stationDict as? [String : AnyObject])
                station.city = self
                stations.append(station)
            }
        }
    }
    
    func copyWithoutStations() -> City {
        let city = City()
        city.title = self.title
        city.countryTitle = self.countryTitle
        return city
    }
}
