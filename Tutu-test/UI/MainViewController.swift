//
//  ViewController.swift
//  Tutu-test
//
//  Created by Андрей Ошев on 07.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, StationViewControllerDelegate {
    var datePickerViewStatus = false
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func datePickerAction(sender: UIDatePicker) {
        let dateForamtter = NSDateFormatter()
        dateForamtter.dateStyle = .MediumStyle
        let strDate = dateForamtter.stringFromDate(datePicker.date)
        dateButton.setTitle(strDate, forState: .Normal)
    }
    
    @IBAction func actionShowStationsVC(sender: UIButton) {
        self.performSegueWithIdentifier("ShowStationsVC", sender: sender)
    }
    
    @IBAction func actionShowDatePicker(sender: UIButton) {
        if !datePickerViewStatus {
            datePickerViewStatus = true
            UIView.animateWithDuration(0.3, animations: {
                self.datePicker.alpha = 1.0
//                self.datePicker.frame = CGRect(x: 0,y: 0,width: 0,height: 0)
            })
        } else {
            datePickerViewStatus = false
            UIView.animateWithDuration(0.1, animations: {
                self.datePicker.alpha = 0.0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromButton.titleLabel?.textAlignment = .Center
        toButton.titleLabel?.textAlignment = .Center
        let currentDate = NSDateFormatter.localizedStringFromDate(NSDate(),
                                                                  dateStyle: .MediumStyle,
                                                                  timeStyle: .NoStyle)
        dateButton.setTitle((currentDate), forState: .Normal)
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
        let title = "\(station.city!.title!), \(station.city!.countryTitle!) \n \(station.title)"
        switch stationController.direction {
        case .From:
            self.fromButton.setTitle(title, forState: .Normal)
        case .To:
            self.toButton.setTitle(title, forState: .Normal)
        }
    }
}



