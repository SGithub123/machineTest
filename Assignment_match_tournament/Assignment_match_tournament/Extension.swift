//
//  Extension.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 04/07/23.
//

import Foundation
import UIKit

extension UIViewController {

    
    func dateFormatter(date:String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        let date: NSDate? = dateFormatterGet.date(from: "2016-02-29 12:24:26") as NSDate?
        print(dateFormatterPrint.string(from: date! as Date))
        return dateFormatterPrint.string(from: date! as Date)
    }
    
}
