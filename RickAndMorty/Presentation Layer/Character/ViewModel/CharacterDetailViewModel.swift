//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 10.03.2023.
//

import Foundation

final class CharacterDetailViewModel{
    private let character: Character
    
    init(character: Character){
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
}
