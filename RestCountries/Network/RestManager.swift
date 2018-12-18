//
//  RestManager.swift
//  RestCountries
//
//  Created by Amjad Nashshibi on 17/12/2018.
//  Copyright © 2018 Amjad Nashshibi. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import SVGKit

class RestManager: NSObject {

    class func getAllCountries(completion: @escaping (Bool) -> ()) {
        Alamofire.request(kGetAllRequestURL).responseArray {(response: DataResponse<[Country]>) in
            if let countries = response.result.value {
                CountriesManager.sharedInstance.countries.value = countries
                completion(true)
            }
        }
    }
 
    class func getImage(row: Int, country:Country) {
//        DispatchQueue.main.async(execute: { () -> Void in
        
            URLSession.shared.dataTask(with: NSURL(string: country.flagUrl)! as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error?.localizedDescription ?? "Error Downloading image for \(String(describing: country.name))")
                    return
                }
                
                let anSVGImage: SVGKImage = SVGKImage(data: data!)
                let countryAtRow = CountriesManager.sharedInstance.countries.value[row]
                countryAtRow.image = anSVGImage.uiImage
                CountriesManager.sharedInstance.countries.value[row] = countryAtRow
                
            }).resume()
            
//        })
    }
    
}
