//
//  ViewController.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit

class TripListController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
}

// MARK: - Setup UI
extension TripListController {
    func setupUI() {
        self.setupNavigationBar()
        self.setupTitle()
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    fileprivate func setupTitle() {
        let attributedString = NSMutableAttributedString(string: "LAST TRIPS", attributes: [
            .font: UIFont.systemFont(ofSize: 17.0, weight: .semibold),
            .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
            .kern: 3.0
            ])
        attributedString.addAttribute(.kern, value: 0.0, range: NSRange(location: 9, length: 1))
        
        let navLabel = UILabel()
        navLabel.attributedText =  attributedString
        
        self.navigationItem.titleView = navLabel
    }
}