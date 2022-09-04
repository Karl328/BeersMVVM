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
    //private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    
    public var viewModel: DetailsViewModelProtocol! 
    
    init (viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        imageBeerConfig()
        labelsConfig()
        closeButtonConfig()
        setupUI()
    }
    
    private func setupUI() {
        beerNameLabel.text = viewModel.beerName
        descriptionTextView.text = viewModel.beerDescription
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
        view.addSubview(imageBeer)
        view.addSubview(beerNameLabel)
        imageBeer.translatesAutoresizingMaskIntoConstraints = false
        imageBeer.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageBeer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageBeer.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: 50).isActive = true
        imageBeer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      
        
    }
    private func labelsConfig () {
        beerNameLabel.textColor = .white
        beerNameLabel.font = .boldSystemFont(ofSize: 30)
        beerNameLabel.textAlignment = .center
        beerNameLabel.adjustsFontSizeToFitWidth = true
        beerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        beerNameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        beerNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        beerNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        descriptionTextView.textColor = .white
        descriptionTextView.textAlignment = .left
        descriptionTextView.backgroundColor = .black
        descriptionTextView.font = .systemFont(ofSize: 20)
        descriptionTextView.frame = CGRect(x: 5, y: 450, width: view.bounds.width, height: 200)
        view.addSubview(descriptionTextView)
    }
    

}
