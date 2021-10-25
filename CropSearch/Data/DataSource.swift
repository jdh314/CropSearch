//
//  DataSource.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/16/21.
//

import Foundation


public class DataSource {
    
    let facilities: [Facility] = [ Facility.init(title: "Cooler Facility")]
    
    let facilityAreaTitle: [String] = ["Surrounding Areas / Adjacent Activities", "Building Grounds", "Building Structure", "Water System", "Other"]
    
    var facilityAreas: [FacilityArea] = []
    
    func populateData() {
        for area in facilityAreaTitle {
            facilityAreas.append(FacilityArea.init(title: area, facilityCondition: -1, buttonPressed: false, cellType: CellType.noComment))
        }
    }
}
