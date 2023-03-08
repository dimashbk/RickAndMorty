//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation

final class CharacterListViewModel{
    
    func fetchCharacters(){
        APIService.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success (let model):
                print("Total: " + String(model.info.pages))
                print ("Page result count: " + String(model.results.count))
            case .failure(let error):
                print(String (describing: error))
            }
        }
    }
}
