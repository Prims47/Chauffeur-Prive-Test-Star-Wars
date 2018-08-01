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
    @IBOutlet weak var pilotImageView: UIImageView!
    @IBOutlet weak var pilotLabel: UILabel!
    @IBOutlet weak var pickupPlanetLabel: UILabel!
    @IBOutlet weak var pickupPlanetDate: UILabel!
    @IBOutlet weak var dropOffPlanetLabel: UILabel!
    @IBOutlet weak var dropOffPlanetDate: UILabel!
    @IBOutlet weak var tripDistanceLabel: UILabel!
    @IBOutlet weak var tripDurationLabel: UILabel!
    @IBOutlet weak var pilotNotRatingLabel: UILabel!
    
    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
        
        //@todo: usecase for travel id ?
        //@todo: improve this
        if let travel = self.travel {
            if let pilot = self.travel?.pilot {
                self.customizePilotName(pilotName: pilot.name)
                self.handlePilotImage(avatar: pilot.avatar)
                
                
                self.pilotNotRatingLabel.isHidden = pilot.hasRating()
            }
            
            self.customizeLabel(label: self.pickupPlanetLabel, text: travel.pickup.planetName.uppercased(),
                                color: UIColor(white: 1.0, alpha: 1.0))
            self.customizeLabel(label: self.dropOffPlanetLabel, text: travel.dropOff.planetName.uppercased(),
                                color: UIColor(white: 1.0, alpha: 1.0))
            
            self.customizeLabel(label: self.pickupPlanetDate, text: travel.pickup.formatDate(),
                                color: UIColor(white: 129.0 / 255.0, alpha: 1.0))
            self.customizeLabel(label: self.dropOffPlanetDate, text: travel.dropOff.formatDate(),
                                color: UIColor(white: 129.0 / 255.0, alpha: 1.0))
            
            self.customizeLabel(label: self.tripDistanceLabel, text: travel.distance.formatDistance(),
                                color: UIColor(white: 1.0, alpha: 1.0))
        }
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
        self.customizeLabel(label: self.pilotNotRatingLabel, text: "user didn’t rate yet".uppercased(),
                            color: UIColor(white: 129.0 / 255.0, alpha: 1.0))
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
    
    fileprivate func customizePilotName(pilotName: String) {
        let nameCount = pilotName.count
        var fontSize: CGFloat = 32.0
        
        if nameCount > 12 {
            fontSize = 28.0
        }
        
        let attributedString = NSMutableAttributedString(string: pilotName.uppercased(), attributes: [
            .font: UIFont.systemFont(ofSize: fontSize, weight: .heavy),
            .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
            .kern: 10.0
        ])
        attributedString.addAttribute(.kern, value: 0.0, range: NSRange(location: nameCount - 1,
                                                                        length: 1))
        
        self.pilotLabel.attributedText = attributedString
    }
    
    fileprivate func customizeLabel(label: UILabel, text: String, color: UIColor) {
        let attributedString = NSMutableAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
            .foregroundColor: color,
            .kern: 3.0
            ])
        attributedString.addAttribute(.kern, value: 0.0, range: NSRange(location: text.count - 1, length: 1))
        
        label.attributedText = attributedString
    }
    
    fileprivate func handlePilotImage(avatar: String) {
        guard let url = URL(string: "http://starwars.chauffeur-prive.com\(avatar)") else { return }
        self.pilotImageView.kf.setImage(with: url)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
