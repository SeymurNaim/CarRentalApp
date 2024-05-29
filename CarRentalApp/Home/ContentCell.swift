//
//  ContentCell.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 20.05.24.
//

import UIKit


class ContentCell: UICollectionViewCell {
    let carImage = UIImageView()
    let carNameLabel = UILabel()
    let carModelLabel = UILabel()
    let carPriceLabel = UILabel()
    let carEngineLabel = UILabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        carPriceLabel.numberOfLines = 0
        carNameLabel.font = UIFont.systemFont(ofSize: 34, weight: .black)
        carNameLabel.adjustsFontSizeToFitWidth = true
        carPriceLabel.font = UIFont.systemFont(ofSize: 36, weight: .light)
        carPriceLabel.textColor = .blue
        carModelLabel.textColor = .systemGray
        carEngineLabel.textAlignment = .right
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        carPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        carModelLabel.translatesAutoresizingMaskIntoConstraints = false
        carEngineLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(carImage)
        contentView.addSubview(carNameLabel)
        contentView.addSubview(carPriceLabel)
        contentView.addSubview(carModelLabel)
        contentView.addSubview(carEngineLabel)
        
        let engineTitleLabel = UILabel()
        engineTitleLabel.text = "Engine:"
        engineTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        engineTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(engineTitleLabel)
        
        let priceTitleLabel = UILabel()
        priceTitleLabel.text = "/ month"
        priceTitleLabel.textColor = .systemGray
        priceTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        priceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceTitleLabel)

        NSLayoutConstraint.activate([
            carImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            carImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            carImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            carImage.heightAnchor.constraint(equalToConstant: 180),

            carNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            carNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            carNameLabel.widthAnchor.constraint(equalToConstant: 180),
            carNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            carModelLabel.topAnchor.constraint(equalTo: carNameLabel.bottomAnchor),
            carModelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            carModelLabel.widthAnchor.constraint(equalToConstant: 64),
            carModelLabel.heightAnchor.constraint(equalToConstant: 32),
            
            carEngineLabel.topAnchor.constraint(equalTo: carModelLabel.bottomAnchor),
            carEngineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            carEngineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),

            carPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            carPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            carPriceLabel.heightAnchor.constraint(equalToConstant: 44),
            
            engineTitleLabel.topAnchor.constraint(equalTo: carModelLabel.bottomAnchor),
            engineTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            
            priceTitleLabel.topAnchor.constraint(equalTo: carPriceLabel.bottomAnchor),
            priceTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28)
            
        ])
    }
    
    func configureCell(withImage image: String) {
        showImage(image: image, imageView: carImage)
    }
}

#Preview() {
    HomeVC()
}
