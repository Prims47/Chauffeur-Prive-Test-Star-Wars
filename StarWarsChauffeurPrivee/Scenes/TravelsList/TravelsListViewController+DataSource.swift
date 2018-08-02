//
//  TravelsListViewController+DataSource.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit

// MARK: - UITableViewDelegate
extension TravelsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = self.travels[indexPath.row]
        
        var dataStore = self.router?.dataStore
        dataStore?.travelID = travel.id
        
        self.router?.detailTravel()
    }
}

// MARK: - UITableViewDataSource
extension TravelsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.travels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: travelTableViewCellIdentifier, for: indexPath)
            as? TravelTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(travel: self.travels[indexPath.row])
        
        return cell
    }
}
