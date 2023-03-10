//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 10.03.2023.
//

import Foundation
import UIKit
class CharacterDetailCoordinator: Coordinator{
    
    
    let viewModel: CharacterDetailViewModel?
    private let navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController, viewModel: CharacterDetailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel

    }
    
    func start() {
        let characterDetailVC = CharacterDetailViewController(viewModel: viewModel!)
        navigationController.pushViewController(characterDetailVC, animated: true)
    }
   
}

