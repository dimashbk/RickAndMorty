//
//  TabBarCoordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 07.03.2023.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let tabBarVC = TabBarViewController()
    
    private let characterVC = UINavigationController()
    private let locationVC = UINavigationController()
    private let episodeVC = UINavigationController()
    private let settingsVC = UINavigationController()
   
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showTabBarView()
        
    }
    
    private func showTabBarView() {
        tabBarVC.coordinatorDelegate = self
        navigationController.pushViewController(tabBarVC, animated: true)
        
        //character
        characterVC.tabBarItem.image = UIImage(named: "Character")
        characterVC.tabBarItem.title = "Character"
        
        //location
        locationVC.tabBarItem.image = UIImage(named: "Location")
        locationVC.tabBarItem.title = "Location"
        
        //episode
        episodeVC.tabBarItem.image = UIImage(systemName: "tv")
        episodeVC.tabBarItem.title = "Location"
        
        //settings
        settingsVC.tabBarItem.image = UIImage(systemName: "gear")
        settingsVC.tabBarItem.title = "Settings"
        
        
        // coordinators
        let characterCoordinator = CharacterCoordinator(navigationController: characterVC)
        let locationCoordinator = LocationCoordinator(navigationController: locationVC)
        let episodeCoordinator = EpisodeCoordinator(navigationController: episodeVC)
        let settingsCoordinator = SettingsCoordinator(navigationController: settingsVC)
        

        
        tabBarVC.viewControllers = [characterVC, locationVC, episodeVC, settingsVC]
        
        [characterVC, locationVC, episodeVC, settingsVC].forEach {
            $0.navigationBar.isHidden = true
        }
        
        coordinate(to: characterCoordinator)
        coordinate(to: locationCoordinator)
        coordinate(to: episodeCoordinator)
        coordinate(to: settingsCoordinator)
        
    }
}
