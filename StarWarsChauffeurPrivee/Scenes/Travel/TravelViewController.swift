//
//  TravelViewController.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController {
    @IBOutlet weak var backImageView: UIImageView!

    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - Setup UI
extension TravelViewController {
    func setupUI() {
        self.setupNavigationBar()
    }
    
    fileprivate func setupNavigationBar() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(goBack))
        tap.numberOfTapsRequired = 1
        
        self.backImageView.isUserInteractionEnabled = true
        self.backImageView.addGestureRecognizer(tap)

        //@todo: use swiftGen
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self,
                                                                action: #selector(goBack))
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
