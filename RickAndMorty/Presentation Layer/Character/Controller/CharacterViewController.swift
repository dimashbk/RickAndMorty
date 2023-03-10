//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 07.03.2023.
//

import UIKit
import SnapKit

final class CharacterViewController: UIViewController, CharacterListViewDelegate{
    
    let characterListView = CharacterListView()
    
    var coordinator: CharacterCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        makeConstraints()
        
    }
    
    private func makeConstraints(){
        characterListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setUp(){
        view.backgroundColor = .yellow
        view.addSubview(characterListView)
        characterListView.delegate = self
        
    }
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        let viewModel = CharacterDetailViewModel(character: character)
        self.coordinator?.showDetail(viewModel)
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
