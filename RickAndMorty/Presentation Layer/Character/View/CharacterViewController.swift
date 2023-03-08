//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 07.03.2023.
//

import UIKit

final class CharacterViewController: UIViewController {
    
    var delegate: CharacterCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let request = APIRequest(endpoint: .episode)
        print(request.url)
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
