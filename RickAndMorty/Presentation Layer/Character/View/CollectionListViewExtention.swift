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

        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter else  {
            fatalError()
        }
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: FooterLoadingCollectionReusableView.identifier,
                                                                     for: indexPath) as! FooterLoadingCollectionReusableView
        footer.startAnimating()
        return footer
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard viewModel.loadingIndicator else{
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    
}

extension CharacterListView: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        guard viewModel.loadingIndicator,
              !viewModel.isLoading ,
              let nextUrlString = viewModel.apiInfo?.next,
              !viewModel.cellViewModels.isEmpty,
              let url = URL(string: nextUrlString) else{
                  
            return
        }
        
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height
        
        if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
            viewModel.loadMoreCharacters(url: url)
            
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){ [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.viewModel.loadMoreCharacters(url: url)
                
            }
            t.invalidate()
        }
        
        
    }
}


