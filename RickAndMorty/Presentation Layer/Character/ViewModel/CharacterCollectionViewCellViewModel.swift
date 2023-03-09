//
//  CharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation

final class CharacterCollectionViewCellViewModel {
    let characterName: String
    private let characterStatus: Status
    private let characterImageUrl: URL?
    
    
    init(characterName: String,
         characterStatus: Status,
         characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
  
    
    func fetchImage(completion: @escaping (Result<Data, Error>) -> Void){
        
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }.resume()
        
        
        
    }
    
}
