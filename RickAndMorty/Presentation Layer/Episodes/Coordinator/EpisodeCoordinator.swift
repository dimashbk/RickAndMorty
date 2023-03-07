//
//  EpisodeCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation
import UIKit
class EpisodeCoordinator: Coordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let episodeVC = EpisodeViewController()
        episodeVC.delegate = self
        navigationController.pushViewController(episodeVC, animated: true)
    }
}
