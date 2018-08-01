//
//  ViewController.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit

protocol TravelsListDisplayLogic: class {
    func displayTravels(viewModel: TravelsListModel.ViewModel.DisplayTravels)
    func displayError(viewModel: TravelsListModel.ViewModel.DisplayError)
}

class TravelsListViewController: UIViewController {
    @IBOutlet weak var travelTableView: UITableView!

    var interactor: TravelsListBusinessLogic?
    var router: (TravelsListRoutingLogic & TravelsListDataPassing)?
    var travels: [Travel] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshView), for: .valueChanged)
        
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.fetchTravels()
        
        self.travelTableView.dataSource = self
        self.travelTableView.delegate = self
        self.travelTableView.refreshControl = refreshControl
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setupVIP()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupVIP()
    }
    
    func fetchTravels() {
        self.interactor?.fetchTravels()
    }
    
    @objc func refreshView() {
        self.fetchTravels()
    }
    
    // MARK: - Setup VIP
    
    private func setupVIP() {
        let viewController = self
        let useCase = TravelUseCase(network: Network())
        let presenter = TravelsListPresenter()
        presenter.viewController = viewController
        let interactor = TravelsListInteractor(useCase: useCase, presenter: presenter)
        viewController.interactor = interactor
        let router = TravelsListRouter()
        router.viewController = viewController
        router.dataStore = interactor
        viewController.router = router
    }
}

// MARK: - Setup UI
extension TravelsListViewController {
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

// MARK: - TravelsListDisplayLogic
extension TravelsListViewController: TravelsListDisplayLogic {
    func displayTravels(viewModel: TravelsListModel.ViewModel.DisplayTravels) {
        self.travels = viewModel.travels
        self.travelTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func displayError(viewModel: TravelsListModel.ViewModel.DisplayError) {
        Message.show(theme: .error, title: "Error", body: viewModel.error)
    }
}
