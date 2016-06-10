//
//  City.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 09.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import Foundation

class City {
    var countryTitle = ""
    var title = ""
    var stations = [Station]()
    let station = Station()
    
    func fillWithDict(dict: [String : AnyObject]?) {
        if let d = dict {
            self.countryTitle = d["countryTitle"] as! String
            self.title = d["cityTitle"] as! String
            
            for stationDict in d["stations"] as! NSArray {
                
                station.fillWithDict(stationDict as? [String : AnyObject])
                stations.append(station)
            }
            stations.append(station)
        }
    }
}
