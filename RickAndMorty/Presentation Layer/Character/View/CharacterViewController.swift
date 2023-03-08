//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 07.03.2023.
//

import UIKit
import SnapKit

final class CharacterViewController: UIViewController {
    
    var delegate: CharacterCoordinator?
    
    let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(characterListView)
        makeConstraints()
    }
    
    private func makeConstraints(){
        characterListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
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
