//
//  Trip.swift
//  Traveler2
//
//  Created by Ash Mahein on 1/20/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import Foundation

class Trip {
    
    var destinationName: String
    var startDate: Date
    var endDate: Date
    var imageFileName: String?
    
    init(destinationName: String, startDate: Date, endDate: Date, imageFileName: String?) {
        self.destinationName = destinationName
        self.startDate = startDate
        self.endDate = endDate
        self.imageFileName = imageFileName
    }
    
}
