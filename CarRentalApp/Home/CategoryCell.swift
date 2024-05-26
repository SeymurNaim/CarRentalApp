//
//  CategoryCell.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 20.05.24.
//

import UIKit

//class CategoryCell: UICollectionViewCell {
//    var categoryImage = UIImageView()
//    
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
//        layer.cornerRadius = 10
//        layer.masksToBounds = true
//
//        setupViews()
//    }
//
//    private func setupViews() {
////        categoryImage.contentMode = .scaleAspectFill
//        addSubview(categoryImage)
//        categoryImage.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            categoryImage.topAnchor.constraint(equalTo: topAnchor, constant: -50),
//            categoryImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
//            categoryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -64),
//            categoryImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12)
//        ])
//        contentView.clipsToBounds = false
//    }
//}


class CategoryCell: UICollectionViewCell {
    let categoryImage = UIImageView()
    let categoryLabel = UILabel()

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
        categoryLabel.textAlignment = .center

        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -30),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -44),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            categoryImage.heightAnchor.constraint(equalToConstant: 140),

            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        contentView.clipsToBounds = false
    }
}

#Preview() {
    HomeVC()
}
