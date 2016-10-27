//
//  PinAnnotation.swift
//  IMMessage
//
//  Created by ZhongMing on 21/10/16.
//  Copyright © 2016 ZhongMing. All rights reserved.
//

import Foundation
import GoogleMaps


class PinAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coord: CLLocationCoordinate2D, title: String, subtitle:String) {
        self.coordinate = coord
        self.title = title
        self.subtitle = subtitle
    }
    
    
}
