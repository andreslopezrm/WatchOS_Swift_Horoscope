//
//  ResultsController.swift
//  HoroscopeSwift WatchKit Extension
//
//  Created by Andres Lopez on 3/18/19.
//  Copyright © 2019 Andres Lopez. All rights reserved.
//

import WatchKit
import Foundation


class ResultsController: WKInterfaceController {
    
    @IBOutlet weak var lblSing: WKInterfaceLabel!
    var sing: String?
    
    @IBOutlet weak var lblDate: WKInterfaceLabel!
    
    @IBOutlet weak var lblDescription: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        guard let context = context as? [String: String] else { return }
        guard let sing = context["sing"] else { return }
        
        lblSing.setText(sing)
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetchData(sing: sing.lowercased())
        }
    }
    
    func fetchData(sing: String) {
        guard let url = URL(string: "https://aztro.sameerkumar.website/?sign=\(sing)&day=today") else { return }
        
        print("https://aztro.sameerkumar.website/?sign=\(sing)&day=today")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                self.parse(data)
            } else {
                print("vacio")
            }
        }.resume()
    }
    
    func parse(_ contens: Data) {
        let decoder = JSONDecoder()
        
        guard let result = try? decoder.decode(Horoscope.self, from: contens) else { return }
        
        DispatchQueue.main.async {
            self.lblDate.setText(result.currentDate)
            self.lblDescription.setText(result.description)
        }
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
