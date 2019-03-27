//
//  Horoscope.swift
//  HoroscopeSwift WatchKit Extension
//
//  Created by Andres Lopez on 3/18/19.
//  Copyright © 2019 Andres Lopez. All rights reserved.
//

import Foundation

struct Horoscope: Codable {
    var currentDate: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case currentDate = "current_date", description
    }
}
