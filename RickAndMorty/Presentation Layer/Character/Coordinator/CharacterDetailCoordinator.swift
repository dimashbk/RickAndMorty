//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 10.03.2023.
//

import Foundation
import UIKit
class CharacterDetailCoordinator: Coordinator{  
    
    private let navigationController: UINavigationController
    private let character: Character
    
    init(navigationController: UINavigationController, didSelectCharacter character: Character) {
        self.navigationController = navigationController
        self.character = character
    }
    
    func start() {
        let viewModel = CharacterDetailViewModel(character: character)
        let detailVC = CharacterDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailVC, animated: true)
    }
}

