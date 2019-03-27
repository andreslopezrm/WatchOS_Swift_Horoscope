//
//  InterfaceController.swift
//  HoroscopeSwift WatchKit Extension
//
//  Created by Andres Lopez on 3/18/19.
//  Copyright © 2019 Andres Lopez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    
    let zodiac = [
        ("♈", "Aries"),
        ("♉", "Taurus"),
        ("♊", "Gemini"),
        ("♋", "Cancer"),
        ("♌", "Leo"),
        ("♍", "Virgo"),
        ("♎", "Libra"),
        ("♏", "Scorpio"),
        ("♐", "Sagittarius"),
        ("♑", "Capricorn"),
        ("♒", "Aquarius"),
        ("♓", "Pisces")
    ]

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        
        table.setNumberOfRows(zodiac.count, withRowType: "Row")
        
        for (index, sign) in zodiac.enumerated() {
            guard let row = table.rowController(at: index) as? Row else { return }
            row.lblIcon.setText(sign.0)
            row.lblZodiac.setText(sign.1)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(zodiac[rowIndex].1)
        
        let context = ["sing": zodiac[rowIndex].1]
        
        presentController(withName: "Results", context: context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
