//
//  CountriesManager.swift
//  RestCountries
//
//  Created by Amjad Nashshibi on 17/12/2018.
//  Copyright © 2018 Amjad Nashshibi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CountriesManager {
    
    static let sharedInstance = CountriesManager()
    
    var countries = Variable<[Country]>([])
        
}
