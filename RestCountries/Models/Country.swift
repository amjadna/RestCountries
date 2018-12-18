//
//  Country.swift
//  RestCountries
//
//  Created by Amjad Nashshibi on 17/12/2018.
//  Copyright © 2018 Amjad Nashshibi. All rights reserved.
//

import UIKit
import ObjectMapper

class Country: Mappable,Equatable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name
            && lhs.capitalCity == rhs.capitalCity
            && lhs.flagUrl == rhs.flagUrl
            && lhs.population == rhs.population
            && lhs.nativeName == rhs.nativeName
            && lhs.code == rhs.code
            && lhs.code3 == rhs.code3
            && lhs.coordinate == rhs.coordinate
            && lhs.region == rhs.region
            && lhs.subregion == rhs.subregion
            && lhs.nationName == rhs.nationName
            && lhs.area == rhs.area
    }
    
    var name: String! = ""
    var capitalCity: String! = ""
    var flagUrl: String! = ""
    var population: Int? = 0
    var nativeName: String! = ""
    var code: String! = ""
    var code3: String! = ""
    var coordinate: [Double]? = [0.0, 0.0]
    var region: String! = ""
    var subregion: String! = ""
    var nationName: String! = ""
    var area: Int! = 0
    
    var image:UIImage? = nil
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        capitalCity <- map["capital"]
        flagUrl <- map["flag"]
        population <- map["population"]
        nativeName <- map["nativeName"]
        code <- map["alpha2Code"]
        code3 <- map["alpha3Code"]
        coordinate <- map["latlng"]
        region <- map["region"]
        subregion <- map["subregion"]
        nationName <- map["demonym"]
        area <- map["area"]
        
    }
}
