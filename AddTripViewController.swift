//
//  AddTripViewController.swift
//  Traveler2
//
//  Created by Ash Mahein on 2/1/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    var newTrip : Trip!
    var numberOfNewTrip: Int = 0
    var flag: Bool = false
    
    @IBOutlet weak var addTripNumLabel: UILabel!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var destinationText: UITextField!
    @IBOutlet weak var startDateText: UITextField!
    @IBOutlet weak var endDateText: UITextField!
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationText.delegate = self
        startDateText.delegate = self
        endDateText.delegate = self
        errorMessage.text = ""

        // Do any additional setup after loading the view.
        addTripNumLabel.text = "Add New Trip #\(numberOfNewTrip)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func saveNewTrip(_ sender: UIButton) {
        
        addTripNumLabel.text = "Add New Trip #\(numberOfNewTrip + 1)"
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if destinationText.text == ""{
            errorMessage.text = "Missing Destination"
            return
        }
        else if (dateFormatter.date(from: startDateText.text!) == nil) {
            errorMessage.text = "Invalid Start Date"
            return
        }
        else if (dateFormatter.date(from: endDateText.text!) == nil){
            errorMessage.text = "Invalid End Date"
            return
        }
        else{
            errorMessage.text = ""
        }
        
        newTrip = Trip(destinationName: destinationText.text!, startDate: dateFormatter.date(from: startDateText.text!)!, endDate: dateFormatter.date(from: endDateText.text!)!, imageFileName: "")
        
        
        
        numberOfNewTrip += 1
        addTripNumLabel.text = "Add New Trip #\(numberOfNewTrip)"

        //After new trip is saved we want to clear the text fields for a new entry.
        destinationText.text = ""
        startDateText.text = ""
        endDateText.text = ""
        
        flag = true
        performSegue(withIdentifier: "UnwindSegueFromSave", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
