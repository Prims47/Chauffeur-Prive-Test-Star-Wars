//
//  TravelTableViewCell.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit
import Kingfisher

let travelTableViewCellIdentifier = "TravelTableViewIdentifier"

class TravelTableViewCell: UITableViewCell {
    @IBOutlet weak var pilotImageView: UIImageView!
    @IBOutlet weak var pilotLabel: UILabel!
    @IBOutlet weak var pickupLabel: UILabel!
    @IBOutlet weak var dropOffLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(travel: Travel) {
        self.customizePilotName(pilotName: travel.pilot.name)
        self.pickupLabel.text = travel.pickup.planetName
        self.dropOffLabel.text = travel.dropOff.planetName
        self.handlePilotAvatar(pilotAvatar: travel.pilot.avatar)
    }
    
    private func customizePilotName(pilotName: String) {
        let attributedString = NSMutableAttributedString(string: pilotName.uppercased(), attributes: [
            .font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
            .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
            .kern: 3.0
        ])
        attributedString.addAttribute(.kern, value: 0.0, range: NSRange(location: 5, length: 1))
        
        self.pilotLabel.attributedText = attributedString
    }
    
    private func handlePilotAvatar(pilotAvatar: String) {
        guard let url = URL(string: "http://starwars.chauffeur-prive.com\(pilotAvatar)") else { return }
        self.pilotImageView.kf.setImage(with: url)
    }
}
