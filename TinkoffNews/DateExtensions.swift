//
//  DateExtensions.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

extension Date {
    
    var longDateString: String {
        let df = DateFormatter()
        df.dateStyle = .long
        return df.string(from: self)
    }
    
}
