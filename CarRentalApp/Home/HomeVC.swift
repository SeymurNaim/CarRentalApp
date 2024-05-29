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
    var filteredCategories: [Categories] = []

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
        searchBar.delegate = self
        manager.fetchData { fetchedPosts, error in
            if let fetchedPosts = fetchedPosts {
                self.datas = fetchedPosts
                self.filteredCategories = fetchedPosts
                DispatchQueue.main.async {
                    if !self.filteredCategories.isEmpty {
                        self.selectedIndexPath = IndexPath(item: 0, section: 0)
                    }
                    self.collectionView.reloadData()
                    self.collectionView.reloadSections(IndexSet(integer: 1))
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
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
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
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(340), heightDimension: .absolute(300))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(300))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 26, bottom: 24, trailing: 26)
                section.interGroupSpacing = 26
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(64))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]

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
            return filteredCategories.count
        } else {
            if let selectedIndexPath = selectedIndexPath {
                return filteredCategories[selectedIndexPath.item].cars.count
            } else {
                return 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.layer.cornerRadius = 20
            cell.categoryImage.image = UIImage(named: "car_\(indexPath.row + 1)")
            cell.categoryLabel.text = "\(filteredCategories[indexPath.item].name)"
            cell.carCountLabel.text = "\(filteredCategories[indexPath.item].cars.count)"
            if indexPath == selectedIndexPath {
                cell.backgroundColor = .blue
                cell.categoryLabel.textColor = .white
                cell.carCountLabel.textColor = .white
            } else {
                cell.backgroundColor = .white
                cell.categoryLabel.textColor = .black
                cell.carCountLabel.textColor = .black
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
            cell.layer.cornerRadius = 20
            
            if let selectedIndexPath = selectedIndexPath {
                let car = filteredCategories[selectedIndexPath.item].cars[indexPath.item]
                cell.configureCell(withImage: "\(car.image)")
                cell.carNameLabel.text = car.brand
                cell.carModelLabel.text = car.model
                cell.carEngineLabel.text = car.engine
                cell.carPriceLabel.text = "$\(indexPath.row * 100 + 50)"
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if selectedIndexPath == indexPath {
                selectedIndexPath = nil
            } else {
                selectedIndexPath = indexPath
            }
            collectionView.reloadData()
            collectionView.reloadSections(IndexSet(integer: 1))
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader, indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: collectionView.bounds.width, height: 50)
        } else {
            return CGSize.zero
        }
    }
}


extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCategories = datas
        } else {
            filteredCategories = datas.map { category in
                var newCategory = category
                newCategory.cars = category.cars.filter { $0.brand.lowercased().contains(searchText.lowercased()) }
                return newCategory
            }.filter { !$0.cars.isEmpty }
        }
        if !filteredCategories.isEmpty {
            selectedIndexPath = IndexPath(item: 0, section: 0)
        } else {
            selectedIndexPath = nil
        }
        collectionView.reloadData()
        collectionView.reloadSections(IndexSet(integer: 1))
    }
}


#Preview() {
    TabbarVC()
}
