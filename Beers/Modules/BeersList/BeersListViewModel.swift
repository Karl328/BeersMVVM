//
//  BeersListViewModel.swift
//  TestBeersMVVM
//
//  Created by Линар Нигматзянов on 01/09/2022.
//

import Foundation

protocol BeersListViewModelProtocol: AnyObject {
    var beersArray: [BeerElement] {get}
    var filtredBeers: [BeerElement] {get set}
    func fetchBeers(completion: @escaping ()-> Void)
    func filteredBeers (completion: @escaping ()-> Void)
    func numberOfRows () -> Int
    func numberOfRowsFiltered () -> Int
    func cellViewModel (at indexPath: IndexPath) -> BeersTableViewCellViewModelProtocol
    func viewModelSelectedRow (at indexPath: IndexPath) -> DetailsViewModelProtocol
}

final class BeerListViewModel: BeersListViewModelProtocol {
    
    var beersArray: [BeerElement] = []
    
    var filtredBeers: [BeerElement] = []
    
    func fetchBeers(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [unowned self] beersElement in
            self.beersArray = beersElement
            completion()
        }
    }
    
    func filteredBeers(completion: @escaping () -> Void) {
        
    }
    
    func numberOfRows() -> Int {
        beersArray.count
    }
    func numberOfRowsFiltered() -> Int {
        filtredBeers.count
    }
    func cellViewModel(at indexPath: IndexPath) -> BeersTableViewCellViewModelProtocol {
        let beerElement = beersArray[indexPath.row]
        return BeersTableViewCellViewModel(beerElement: beerElement)
    }
    
    func viewModelSelectedRow(at indexPath: IndexPath) -> DetailsViewModelProtocol {
        let beerElement = beersArray[indexPath.row]
        return DetailsViewModel(beerElement: beerElement )
    }
    
}
