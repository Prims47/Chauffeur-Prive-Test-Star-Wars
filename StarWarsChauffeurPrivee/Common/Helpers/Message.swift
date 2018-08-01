//
//  Message.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftMessages

struct Message {
    static func show(theme: Theme, title: String, body: String) {
        var config = SwiftMessages.Config()
        config.duration = .seconds(seconds: 3)
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        
        let view = MessageView.viewFromNib(layout: .messageViewIOS8)
        view.configureTheme(theme, iconStyle: .subtle)
        view.configureContent(title: title, body: body)
        
        SwiftMessages.show(config: config, view: view)
    }
}
