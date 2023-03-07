//
//  APIService.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import Foundation

final class APIService{
    
    static let shared = APIService()
    
    private init() {}
    
    public func execute(_ request: APIRequest, completion: @escaping () -> Void){
        
    }
    
}
