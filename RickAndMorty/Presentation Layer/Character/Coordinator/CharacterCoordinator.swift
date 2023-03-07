//
//  CharacterCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation
import UIKit
class CharacterCoordinator: Coordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let characterVC = CharacterViewController()
        characterVC.delegate = self
        navigationController.pushViewController(characterVC, animated: true)
    }
}
