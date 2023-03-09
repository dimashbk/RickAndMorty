//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation

protocol CharacterDelegate: AnyObject{
    
    func didLoadInitialCharatcers()
    func didSelectCharacter(_ character: Character)
    
}
final class CharacterListViewModel{
    
    weak var delegate: CharacterDelegate?
    
    var characters: [Character] = [] {
        didSet {
            print("Creating viewModels")
            for character in characters {
                let viewModel = CharacterCollectionViewCellViewModel(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
    
    var cellViewModels: [CharacterCollectionViewCellViewModel] = []
    
    func fetchCharacters(){
        APIService.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let resultsModel):
                let results = resultsModel.results
//                let info = resultsModel.info
                self?.characters = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharatcers()
                    print("hui")
                }
                
                //                self?.apiInfo = info
                //                DispatchQueue.main.async {
                //                    self?.delegate?.didLoadInitialCharacters()
                //                }
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
}
