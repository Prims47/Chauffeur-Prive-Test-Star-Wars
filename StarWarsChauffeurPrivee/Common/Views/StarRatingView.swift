//
//  StarRatingView.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit

class StarRatingView: UIView {
    func configure(pilot: Pilot) {
        var x = 0

        for index in 1...5 {
            var defaultStarImageName = "star_empty"
            
            if index <= pilot.rating {
                defaultStarImageName = "star_filled"
            }
            
            let imageView = UIImageView(image: UIImage(named: defaultStarImageName))

            if index > 1 {
                x += 40
            }
            
            imageView.frame = CGRect(x: x, y: 0, width: 40, height: 40)
            imageView.contentMode = .scaleAspectFit
            
            self.addSubview(imageView)
        }
    }
}
