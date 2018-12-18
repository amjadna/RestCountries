//
//  CountriesViewController.swift
//  RestCountries
//
//  Created by Amjad Nashshibi on 17/12/2018.
//  Copyright © 2018 Amjad Nashshibi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CountriesViewController: UITableViewController {

    var countries = CountriesManager.sharedInstance.countries
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = nil
        tableView.delegate = nil
        
        setupCellConfiguration()
        setupCellTapHandling()
        setupCartObserver()

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == kCountrySegue) {
            let controller = segue.destination as! CountryViewController
            let row = (sender as! NSIndexPath).row;
            let country = CountriesManager.sharedInstance.countries.value[row]
            controller.country = country
        }
    }
    
    //MARK: Rx Setup
    
    private func setupCellConfiguration() {
        //Equivalent of cell for row at index path
        
        countries.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: kCountryCell, cellType: CountryCell.self)) {
            row, country, cell in
            cell.configureCountry(country: country, row: row)

            }.disposed(by: disposeBag)
        
    }
    
    private func setupCellTapHandling() {
        //Equivalent of did select row at index path
        self.tableView
            .rx
            .modelSelected(Country.self)
            .subscribe(onNext: {
                country in
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                    self.performSegue(withIdentifier: kCountrySegue, sender: selectedRowIndexPath);

                }
            })
            .disposed(by: disposeBag)
    }
    
    private func setupCartObserver() {
        CountriesManager.sharedInstance.countries.asObservable()
            .subscribe({
                countries in
                print("Change Observed")
            })
            .disposed(by: disposeBag)
    }

}
