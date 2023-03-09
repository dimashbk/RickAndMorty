//
//  CollectionListViewExtention.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 10.03.2023.
//

import Foundation
import UIKit

extension CharacterListView: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! CharacterCollectionViewCell
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.item]
        viewModel.delegate?.didSelectCharacter(character)
        coordinator?.characterListView(self, didSelectCharacter: character)
        
    }
    
    
}

