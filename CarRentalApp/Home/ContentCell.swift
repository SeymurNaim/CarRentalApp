//
//  ContentCell.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 20.05.24.
//

import UIKit

//class ContentCell: UICollectionViewCell {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCell()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupCell() {
//        backgroundColor = .white
//        layer.cornerRadius = 20
//
//        setupViews()
//    }
//
//    private func setupViews() {
//        
//    }
//}


class ContentCell: UICollectionViewCell {
    let carImage = UIImageView()
    let carNameLabel = UILabel()
    let carPriceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        carPriceLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(carImage)
        contentView.addSubview(carNameLabel)
        contentView.addSubview(carPriceLabel)

        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            carImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carImage.heightAnchor.constraint(equalToConstant: 180),

            carNameLabel.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 8),
            carNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            carNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            carPriceLabel.topAnchor.constraint(equalTo: carNameLabel.bottomAnchor, constant: 4),
            carPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            carPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            carPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

//        contentView.layer.cornerRadius = 20
//        contentView.layer.masksToBounds = true
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.shadowColor = UIColor.black.cgColor
//        contentView.layer.shadowOpacity = 0.1
//        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        contentView.layer.shadowRadius = 4
    }
}

#Preview() {
    HomeVC()
}
