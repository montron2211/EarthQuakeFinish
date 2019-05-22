//
//  EarthQuakeModel.swift
//  EarthQuakeApp
//
//  Created by Monmon on 5/21/19.
//  Copyright © 2019 Monmon. All rights reserved.
//

import Foundation

class EarthQuakeModel {
    var box: [Double] = []
    var features: [Features] = []
    
    init(dict: JSON) {
        
        let bbox = dict["bbox"] as? [Double] ?? []
        for item in bbox {
            box.append(item)
            
        }
        
  
        let featuresData = dict["features"] as? [JSON] ?? []
        for item in featuresData {
            features.append(Features(dict: item))
        }
        let bboxx = dict["bbox"] as? [Double] ?? []
        for item in bboxx {
            box.append(item)
        }
        
        
    }
}

struct Features {
    var id: String?
    var mag: Double?
    var place: String?
    var timeInterval: TimeInterval?
    var timeString: String?
    var dateString: String?
    var url: String?
    var distainsString: String?
    var locationName: String?
    
    init(dict: JSON) {
        id = dict["id"] as? String ?? ""
        let properties = dict["properties"] as? JSON ?? [:]
        mag = properties["mag"] as? Double
        place = properties["place"] as? String ?? ""
        timeInterval = properties["time"] as? TimeInterval
        url = properties["url"] as? String ?? ""
        
        if (place?.contains(" of "))! {
            let placeDetail = place?.components(separatedBy: " of ")
            distainsString = (placeDetail?.first ?? "") + " OF"
            locationName = placeDetail?.last ?? ""
        } else {
            self.distainsString = "NEAR THE"
            self.locationName = place
        }
        
        let dataForMater = DateFormatter()
        dataForMater.timeStyle = .short
        self.timeString = dataForMater.string(from: Date(timeIntervalSince1970: timeInterval!/1000))
        dataForMater.timeStyle = .none
        dataForMater.dateStyle = .medium
        self.dateString = dataForMater.string(from: Date(timeIntervalSince1970: timeInterval!/1000))
    }
}
