//
//  CategoryCell.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 20.05.24.
//

import UIKit


class CategoryCell: UICollectionViewCell {
    let categoryImage = UIImageView()
    let categoryLabel = UILabel()
    let carCountLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(carCountLabel)
        categoryLabel.textAlignment = .center
        carCountLabel.textAlignment = .center
        categoryLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        carCountLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        carCountLabel.textColor = .systemGray

        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        carCountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -30),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -44),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            categoryImage.heightAnchor.constraint(equalToConstant: 140),

            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.heightAnchor.constraint(equalToConstant: 24),
            
            carCountLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            carCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        contentView.clipsToBounds = false
    }
}

#Preview() {
    HomeVC()
}
