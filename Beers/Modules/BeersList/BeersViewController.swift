//
//  ViewController.swift
//  Beers
//
//  Created by Линар Нигматзянов on 04/08/2022.
//

import UIKit
import Kingfisher

final class  BeersController: UIViewController {
    private let mainTableView = UITableView()
   
    private var viewModel: BeersListViewModelProtocol! {
        didSet {
            viewModel.fetchBeers {
                self.mainTableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        viewModel = BeerListViewModel()
        setupNavControl()
        createTableView()


    }
    
    private func setupNavControl () {
        navigationItem.title = "Beers"
        navigationController?.navigationBar.prefersLargeTitles = true
        guard let nc = self.navigationController else {return}
        setupAppearanceNavigationBar(with: nc)
    }

    private func createTableView () {
        mainTableView.backgroundColor = .black
        mainTableView.register(BeersTableViewCell.self, forCellReuseIdentifier: BeersTableViewCell.identifier)
        mainTableView.frame = view.bounds
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.separatorStyle = .none
        view.addSubview(mainTableView)
        
    }

   
}

extension BeersController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BeersTableViewCell
        cell.selectionStyle = .none
        let view = UIView()
        let arrowImage = UIImageView(image: UIImage( named: "arrow"))
        arrowImage.frame = CGRect(x: 370, y: cell.contentView.bounds.height / 2 - 15, width: 30, height: 30)
        view.addSubview(arrowImage)
        cell.accessoryView = view
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVewModel = viewModel.viewModelSelectedRow(at: indexPath)
        let detailVC = DetailController(viewModel: detailVewModel)
        present(detailVC, animated: true)
      
    }
    
}
