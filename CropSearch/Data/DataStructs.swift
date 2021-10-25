//
//  DataSource.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/16/21.
//

import Foundation
import UIKit

struct Facility {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}


struct FacilityArea {
    let title: String
    var comments: String?
    var facilityCondition: Int
    var addCommentButtonPressed: Bool
    var cellType: String
    
    init(title: String, facilityCondition: Int, buttonPressed: Bool, cellType: String) {
        self.title = title
        self.facilityCondition = facilityCondition
        self.addCommentButtonPressed = buttonPressed
        self.cellType = cellType
    }
    
}

enum CellType {
    static let noComment        = "cellNoComment"
    static let comment          = "cellWithComment"
    static let textField        = "cellwithTextField"
    static let sectionHeader    = "sectionHeader"
}
