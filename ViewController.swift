//
//  ViewController.swift
//  Traveler2
//
//  Created by Ash Mahein on 1/18/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var trips = [Trip]()
    var tripIndex: Int  = 0
    
    @IBOutlet weak var TripNumberLabel: UILabel!
    @IBOutlet weak var Destination: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var tripImage: UIImageView!

    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeTrips(tripArray: trips)
        displayTrips(tripArray: trips, index: tripIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeTrips(tripArray: [Trip]){
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let firstTrip = Trip(destinationName: "Huntington Beach", startDate: dateFormatter.date(from: "01/17/2018")!, endDate: dateFormatter.date(from: "01/20/2018")!, imageFileName: "Huntington-Beach.jpg")
        let secondTrip = Trip(destinationName: "Paris", startDate: dateFormatter.date(from: "02/14/2018")!, endDate: dateFormatter.date(from: "02/20/2018")!, imageFileName: "paris.jpg")
        let thirdTrip = Trip(destinationName: "United Kingdom", startDate: dateFormatter.date(from: "10/01/2018")!, endDate: dateFormatter.date(from: "12/01/2018")!, imageFileName: "")
        
        trips.append(firstTrip)
        trips.append(secondTrip)
        trips.append(thirdTrip)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        tripIndex += 1
        if tripIndex == trips.count {
            tripIndex = 0
        }
        displayTrips(tripArray: trips, index: tripIndex)
        
    }
    
    func displayTrips(tripArray: [Trip], index: Int) {
            if index < tripArray.count {
                Destination.text = "Destination: " + tripArray[index].destinationName
                
                startDate.text = "Start Date: " + dateFormatter.string(from: tripArray[index].startDate)
                
                endDate.text = "End Date: " + dateFormatter.string(from: tripArray[index].endDate)
                
                TripNumberLabel.text = "Trip \(index + 1) of \(tripArray.count)"
                
                if tripArray[index].imageFileName! == ""{
                    if tripImage.isHidden == false{
                        tripImage.isHidden = true
                    }
                }
                else{
                    if tripImage.isHidden == true{
                        tripImage.isHidden = false
                    }
                    
                tripImage.image = UIImage(named: tripArray[index].imageFileName!)
                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewTripPage" {
            guard let page2VC = segue.destination as? AddTripViewController else {return }
            page2VC.numberOfNewTrip = trips.count + 1
        }
    }

    @IBAction func saveNewTrip (sender: UIStoryboardSegue){
        let page2VC = sender.source as? AddTripViewController
        if(page2VC?.flag)!
        {
            trips.append((page2VC?.newTrip)!)
        }
        
        TripNumberLabel.text = "Trip 1 of \(trips.count)"
        
    }

}

