//
//  LocationCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation
import UIKit
class LocationCoordinator: Coordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let locationVC = LocationViewController()
        locationVC.delegate = self
        navigationController.pushViewController(locationVC, animated: true)
    }
}
