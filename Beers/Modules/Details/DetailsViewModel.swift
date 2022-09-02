//
//  DetailsViewModel.swift
//  Beers
//
//  Created by Линар Нигматзянов on 01/09/2022.
//

import Foundation

protocol DetailsViewModelProtocol: AnyObject {
    var beerName: String {get}
    var beerDescription: String {get}
    var imageURL: String {get}
    init(beerElement: BeerElement)
}

class DetailsViewModel: DetailsViewModelProtocol {
    var imageURL: String {
        beerElement.imageURL
    }
    
    var beerDescription: String {
        beerElement.beerDescription
    }
    
    var beerName: String {
        beerElement.name
    }
    
    private let beerElement: BeerElement
    
    required init(beerElement: BeerElement) {
        self.beerElement = beerElement
    }
     
    
}
