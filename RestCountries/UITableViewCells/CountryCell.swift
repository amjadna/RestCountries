//
//  CountryCell.swift
//  RestCountries
//
//  Created by Amjad Nashshibi on 17/12/2018.
//  Copyright © 2018 Amjad Nashshibi. All rights reserved.
//

import UIKit
import Nuke
import SVGKit

class CountryCell: UITableViewCell {
 
    static let Identifier = kCountryCell
    
    @IBOutlet private var countryNameLabel: UILabel!
    @IBOutlet private var countryLocalNameLabel: UILabel!
    @IBOutlet private var flagImage: UIImageView!
    @IBOutlet private var populationLabel: UILabel!
    
    func configureCountry(country: Country,row: Int) {
        countryNameLabel.text = country.name
        countryLocalNameLabel.text = country.nativeName
        populationLabel.text = "\(country.population ?? 0)"
        
        Nuke.loadImage(with: URL(string: "https://www.countryflags.io/\(country.code ?? "")/flat/64.png")!, into: flagImage)

// there are little frameworks converts svg data to uiimage, Using SVGKit, we can download the svg image data and convert it to UIImage, using SVGKit on multiple images while scrolling the tableview will produce SVGKit framework fails, therefore it is better to use a different image type than svg
//        if (country.image == nil)
//        {
//            self.flagImage.image = UIImage(named: "flagPlaceHolder")
//            RestManager.getImage(row: row, country: country)
//        }
//        else {
//            self.flagImage.image = country.image
//        }
    }
}
