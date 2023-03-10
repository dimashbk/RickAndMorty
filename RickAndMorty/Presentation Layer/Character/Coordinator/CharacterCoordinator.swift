//
//  CharacterCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation
import UIKit
protocol ShowDetail{
    func showDetail(_ viewModel: CharacterDetailViewModel)
}
final class CharacterCoordinator: Coordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let characterVC = CharacterViewController()
        characterVC.coordinator = self
        navigationController.pushViewController(characterVC, animated: true)
    }
}
extension CharacterCoordinator: ShowDetail{
    func showDetail(_ viewModel: CharacterDetailViewModel) {
        let detailCoordinator = CharacterDetailCoordinator(navigationController: navigationController, viewModel: viewModel)
        coordinate(to: detailCoordinator)
    }
    

    
   
}
