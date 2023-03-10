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
    
    var isLoading = false
    
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
    
    var apiInfo: GetAllCharactersResponse.Info? = nil
    
    func fetchCharacters(){
        APIService.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let resultsModel):
                let results = resultsModel.results
                let info = resultsModel.info
                self?.apiInfo = info
                self?.characters = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharatcers()
                }
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    func loadMoreCharacters(url: URL){
        
        guard !isLoading else{
            return
        }
        isLoading = true
        
        guard let request = APIRequest(url: url) else {
            isLoading = false
            return
        }
        APIService.shared.execute(request,
                                  expecting: GetAllCharactersResponse.self){  [weak self] result in
            switch result {
            case .success(_):
                print("1")
            case .failure(_):
                print("2")
            }
            
        }
    }
    var loadingIndicator: Bool{
        return apiInfo?.next != nil
    }
}

