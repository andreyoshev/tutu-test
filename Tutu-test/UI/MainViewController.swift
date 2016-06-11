//
//  ViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 07.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, StationViewControllerDelegate {
    var button = UIButton()
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    
    @IBAction func actionShowStationsVC(sender: UIButton) {
        self.performSegueWithIdentifier("ShowStationsVC", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fromButton.titleLabel?.textAlignment = .Center
        self.toButton.titleLabel?.textAlignment = .Center
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowStationsVC") {
            let stationVC = segue.destinationViewController as! StationViewController
            stationVC.delegate = self
            if (sender as? UIButton == self.fromButton) {
                stationVC.direction = .From
            } else if (sender as? UIButton == self.toButton) {
                stationVC.direction = .To
            }
        }
    }
    
    func stationViewController(stationController: StationViewController, didSelectStation station: Station) {
        let title = "\(station.city!.title), \(station.city!.countryTitle) \n \(station.title)"
        switch stationController.direction {
        case .From:
            self.fromButton.setTitle(title, forState: .Normal)
        case .To:
            self.toButton.setTitle(title, forState: .Normal)
        }
    }
}



