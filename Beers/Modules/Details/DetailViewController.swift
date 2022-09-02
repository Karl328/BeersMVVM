//
//  DetailController.swift
//  Beers
//
//  Created by Линар Нигматзянов on 07/08/2022.
//

import UIKit
import Kingfisher

final class DetailController: UIViewController {
    
    private let imageBeer = UIImageView()
    private let beerNameLabel = UILabel()
    private let closeButton = UIButton()
    private let descriptionLabel = UILabel()
    
    public var viewModel: DetailsViewModelProtocol! 
    
    init (viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        imageBeer.isHidden = false
        imageBeerConfig()
        labelsConfig()
        closeButtonConfig()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
     
    }
    
    private func setupUI() {
        beerNameLabel.text = viewModel.beerName
        descriptionLabel.text = viewModel.beerDescription
        imageBeer.kf.setImage(with: URL(string: viewModel.imageURL))
    }
    
    private func closeButtonConfig () {
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.setTitleColor(.red, for: .highlighted)
        closeButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        closeButton.frame = CGRect(x: 5, y: 5, width: 100, height: 50)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        view.addSubview(closeButton)
    }
    
    @objc func closeButtonAction () {
        imageBeer.isHidden = true
        dismiss(animated: true)
    }
    
    private func imageBeerConfig() {
        imageBeer.kf.indicatorType = .activity
        imageBeer.frame = CGRect(x: view.bounds.width / 2 - 50, y: 150, width: 100, height: 300)
        view.addSubview(imageBeer)
    }
    private func labelsConfig () {
        beerNameLabel.textColor = .white
        beerNameLabel.font = .boldSystemFont(ofSize: 30)
        beerNameLabel.textAlignment = .center
        beerNameLabel.adjustsFontSizeToFitWidth = true
        beerNameLabel.frame = CGRect(x: view.bounds.width / 2 - 150, y: 50, width: 300, height: 100)
        view.addSubview(beerNameLabel)
        
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.frame = CGRect(x: 5, y: 450, width: view.bounds.width, height: 200)
        view.addSubview(descriptionLabel)
    }
    

}
