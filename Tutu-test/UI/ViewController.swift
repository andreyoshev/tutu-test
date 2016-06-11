//
//  ViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 07.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit


class ViewController: UIViewController, StationViewControllerDelegate {
    var buttonIdentifier = ""
    var button = UIButton()
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveSelectedStation(segue:UIStoryboardSegue) {
        button = buttonIdentifier == "From" ? (fromButton) : (toButton)                
        button.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    
    @IBAction func fromButtonA(sender: UIButton) {
        buttonIdentifier = sender.restorationIdentifier!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let stationVC = segue.destinationViewController as! StationViewController
        stationVC.delegate = self
        stationVC.direction = buttonIdentifier
    }
    
    func stationViewControllerDidSelectStation(station: Station) {
        button.setTitle("\(station.city!.title), \(station.city!.countryTitle) \n \(station.title)", forState: .Normal)
    }
}



