//
//  CharacterCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation
import UIKit
final class CharacterCoordinator: Coordinator{
    
    private let navigationController: UINavigationController
    var delegate: CharacterListViewDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let characterVC = CharacterViewController()
        delegate = self
        navigationController.pushViewController(characterVC, animated: true)
    }
}
extension CharacterCoordinator: CharacterListViewDelegate{
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        print("siu")
        let viewModel = CharacterDetailViewModel(character: character)
        let detailVC = CharacterDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailVC, animated: true)
    }
    
   
}
