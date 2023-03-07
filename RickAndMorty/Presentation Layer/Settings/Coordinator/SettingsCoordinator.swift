//
//  SettingsCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation
import UIKit
class SettingsCoordinator: Coordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        navigationController.pushViewController(settingsVC, animated: true)
    }
}
