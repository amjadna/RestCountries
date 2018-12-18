//
//  CountryViewController.swift
//  RestCountries
//
//  Created by Amjad Nashshibi on 18/12/2018.
//  Copyright © 2018 Amjad Nashshibi. All rights reserved.
//

import UIKit
import MapKit
import Nuke

class CountryViewController: UIViewController {
    
    @IBOutlet private var countryNameLabel: UILabel!
    @IBOutlet private var flagImage: UIImageView!
    @IBOutlet private var populationLabel: UILabel!
    @IBOutlet private var regionLabel: UILabel!
    @IBOutlet private var areaLabel: UILabel!
    @IBOutlet private var nationLabel: UILabel!
    @IBOutlet private var codeLabel: UILabel!
    
    @IBOutlet private var mapView: MKMapView!

    
    var country:Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        
        mapView.layer.borderColor = UIColor.black.cgColor
        mapView.layer.borderWidth = 1.0;
        
        if let _ = country, let _ = country?.coordinate {
            self.title = country?.name
            drawAnnotation()
            
            self.countryNameLabel.text = "\(country?.name ?? ""), \(country?.nativeName ?? "")"
            self.populationLabel.text = "\(country?.population ?? 0) citizens"
            self.areaLabel.text = "\(country?.area ?? 0) km2"
            self.regionLabel.text = "\(country?.region ?? ""), \(country?.subregion ?? "")"
            self.nationLabel.text = "People of \(country?.nationName ?? "No Place")"
            self.codeLabel.text = "Prefix: \(country?.code ?? ""), \(country?.code3 ?? "")"
            
            Nuke.loadImage(with: URL(string: "https://www.countryflags.io/\(country?.code ?? "")/flat/64.png")!, into: flagImage)

        }
    }
    
    func drawAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = country!.name
        
        guard country?.coordinate?.count ?? 0 > 1 else {
            country?.coordinate = [0.0, 0.0]
            print("Location Error")
            return
        }
        
        let coordinate = CLLocationCoordinate2D(latitude: country?.coordinate?[0] ?? 0.0, longitude: country?.coordinate?[1] ?? 0.0)
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        mapView.setCenterCoordinate(coordinate, withZoomLevel: 3, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
