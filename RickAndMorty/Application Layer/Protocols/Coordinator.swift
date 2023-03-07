//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 07.03.2023.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func coordinate(to coordinate: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
