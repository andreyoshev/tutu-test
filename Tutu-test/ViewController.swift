//
//  ViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 07.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var stationTitle = ""
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveSelectedStation(segue:UIStoryboardSegue) {
        let t = segue.sourceViewController as! StationViewController
        self.fromButton.setTitle("\(t.selectedStation) \n \(t.selectedDetailStation)", forState: .Normal)
        fromButton.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    @IBOutlet weak var fromButton: UIButton!
    
    
}

