//
//  GetAllCharacterResponse.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [Character]
}
