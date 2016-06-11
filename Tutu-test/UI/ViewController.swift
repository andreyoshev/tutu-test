//
//  ViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 07.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var buttonIdentifier = ""
    var button = UIButton()
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveSelectedStation(segue:UIStoryboardSegue) {
        let t = segue.sourceViewController as! StationViewController
        
        button = buttonIdentifier == "From" ? (fromButton) : (toButton)
        
        button.setTitle("\(t.selectedStation) \n \(t.selectedDetailStation)", forState: .Normal)
        button.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    
    @IBAction func fromButtonA(sender: UIButton) {
        buttonIdentifier = sender.restorationIdentifier!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let stationVC = segue.destinationViewController as! StationViewController
        stationVC.direction = buttonIdentifier
    }
}



