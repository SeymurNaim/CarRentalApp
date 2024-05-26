//
//  ProfileVC.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 19.05.24.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        title = "Account"
    }
    

  

}

//
//import UIKit
//
//class HomeVC: UIViewController {
//
//    let searchBar = UISearchBar()
//    let searchButton = UIButton(type: .system)
//    let collectionView: UICollectionView
//
//    init() {
//        let layout = HomeVC.createLayout()
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Vehicles"
//
//        setupSearchBar()
//        setupSearchButton()
//        setupCollectionView()
//        setupConstraints()
//    }
//
//    private func setupSearchBar() {
//        searchBar.placeholder = "Search"
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchBar)
//    }
//
//    private func setupSearchButton() {
//        searchButton.setTitle("Search", for: .normal)
//        searchButton.translatesAutoresizingMaskIntoConstraints = false
//        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
//        view.addSubview(searchButton)
//    }
//
//    @objc private func searchButtonTapped() {
//        print("Search button tapped")
//    }
//
//    private func setupCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = .systemGray6
//        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
//        collectionView.register(ContentCell.self, forCellWithReuseIdentifier: "ContentCell")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(collectionView)
//    }
//
//    private func setupConstraints() {
//        let searchStackView = UIStackView(arrangedSubviews: [searchBar, searchButton])
//        searchStackView.axis = .horizontal
//        searchStackView.spacing = 8
//        searchStackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchStackView)
//
//        NSLayoutConstraint.activate([
//            searchStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//            searchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//
//            collectionView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 8),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -84)
//        ])
//    }
//
//    static func createLayout() -> UICollectionViewLayout {
//        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
//            if sectionIndex == 0 {
//                // categories
//                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(180))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(200))
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 56, bottom: 0, trailing: 56)
//                section.interGroupSpacing = 56
//
//                return section
//            } else {
//                // cars
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
//                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 26, bottom: 0, trailing: 26)
//                section.interGroupSpacing = 26
//
//                return section
//            }
//        }
//    }
//}
//
//extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2 // first for categories, second for cars
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0 {
//            return 3 // category
//        } else {
//            return 10 // car
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//            cell.categoryImage.image = UIImage(named: "car_\(indexPath.row + 1)")
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
//            cell.backgroundColor = .blue
//        } else {
//            // handle selection for cars
//        }
//    }
//}
