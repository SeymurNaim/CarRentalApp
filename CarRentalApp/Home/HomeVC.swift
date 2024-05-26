//
//  HomeVC.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 19.05.24.
//

import UIKit

class HomeVC: UIViewController {

    let searchBar = UISearchBar()
    let collectionView: UICollectionView
    
    var selectedIndexPath: IndexPath?
    let manager = ApiManager()
    var datas: [Categories] = []

    init() {
        let layout = HomeVC.createLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Car Rental"
        setupSearchBar()
        setupCollectionView()
        setupConstraints()
        manager.fetchData { fetchedPosts, error in
            if let fetchedPosts = fetchedPosts {
                self.datas = fetchedPosts
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    print(self.datas)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    private func setupSearchBar() {
        searchBar.placeholder = "Search for a car"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray6
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(ContentCell.self, forCellWithReuseIdentifier: "ContentCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    static func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(180))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(180))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 36, bottom: 0, trailing: 36)
                section.interGroupSpacing = 46

                return section
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16)
                section.interGroupSpacing = 16

                return section
            }
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return datas.count
        } else {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.layer.cornerRadius = 20
            cell.categoryImage.image = UIImage(named: "car_\(indexPath.row + 1)")
            cell.categoryLabel.text = "\(datas[indexPath.item].name)"
            cell.backgroundColor = (indexPath == selectedIndexPath) ? .blue : .white
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
            cell.layer.cornerRadius = 20
            cell.carImage.image = UIImage(named: "car_\(indexPath.row + 1)")
            cell.carNameLabel.text = "\(datas[indexPath.row].cars[indexPath.item].brand)"
            cell.carPriceLabel.text = "$\(indexPath.row * 100 + 50) / month"
            return cell
        }
    }


    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath {
            selectedIndexPath = nil
            collectionView.reloadItems(at: [previousIndexPath])
        }
        
        selectedIndexPath = indexPath
        collectionView.reloadItems(at: [indexPath])
    }
}




#Preview() {
    TabbarVC()
}
