//
//  BeersTableViewCellViewModel.swift
//  TestBeersMVVM
//
//  Created by Линар Нигматзянов on 01/09/2022.
//

import Foundation

protocol BeersTableViewCellViewModelProtocol {
    var beerName: String {get}
    var brewedName: String {get}
    var foodPairing: String {get}
    var abvNumber: String {get}
    var imageURL: String {get}
    init (beerElement: BeerElement)
    
}

final class BeersTableViewCellViewModel: BeersTableViewCellViewModelProtocol {
    var beerName: String {
        beerElement.name
    }
    
    var brewedName: String {
        beerElement.firstBrewed
    }
    
    var foodPairing: String {
        beerElement.foodPairing.first ?? ""
    }
    
    var abvNumber: String {
        String(beerElement.abv)
    }
    
    var imageURL: String {
        beerElement.imageURL
    }
    
    private let beerElement: BeerElement
    
    required init(beerElement: BeerElement) {
        self.beerElement = beerElement
    }
    
    
    
}
