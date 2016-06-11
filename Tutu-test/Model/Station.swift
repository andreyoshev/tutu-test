//
//  Station.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 09.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import Foundation

class Station {
    var title = ""
    weak var city: City?
    func fillWithDict(dict: [String : AnyObject]?) {
        if let d = dict {
            self.title = d["stationTitle"] as! String
        }
    }
}