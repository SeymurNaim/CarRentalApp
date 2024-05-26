////
////  MainVC.swift
////  CarRentalApp
////
////  Created by Seymur Naim on 18.05.24.
////
//
//import UIKit
//
//
//class MainVC: UIViewController {
//    
//    let searchBar = UISearchBar()
//    let searchButton = UIButton(type: .system)
//    let collectionView: UICollectionView
//    let tabBar = UITabBar()
//    
//    var cars = ["car_1", "car_2", "car_3"]
//    
//    init() {
//        // Collection view layout
//        let layout = MainVC.createLayout()
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        
//        setupSearchBar()
//        setupSearchButton()
//        setupCollectionView()
//        setupTabBar()
//        setupConstraints()
//    }
//    
//    private func setupSearchBar() {
//        searchBar.placeholder = "Search for a car"
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchBar)
//    }
//    
//    private func setupSearchButton() {
//        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
//        searchButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchButton)
//    }
//    
//    private func setupCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
//        collectionView.register(CarCell.self, forCellWithReuseIdentifier: "CarCell")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(collectionView)
//    }
//    
//    private func setupTabBar() {
//        let vehiclesItem = UITabBarItem(title: "Vehicles", image: UIImage(systemName: "car"), tag: 0)
//        let searchItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
//        let accountItem = UITabBarItem(title: "Account", image: UIImage(systemName: "person"), tag: 2)
//        tabBar.items = [vehiclesItem, searchItem, accountItem]
//        tabBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tabBar)
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            // Search bar constraints
//            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            searchBar.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8),
//            
//            // Search button constraints
//            searchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
//            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            searchButton.widthAnchor.constraint(equalToConstant: 24),
//            searchButton.heightAnchor.constraint(equalToConstant: 24),
//            
//            // Collection view constraints
//            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
//            
//            // Tab bar constraints
//            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//    
//    static func createLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
//            if sectionIndex == 0 {
//                // Category section
//                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(180))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                
//                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(200))
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//                
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 36, bottom: 0, trailing: 26)
//                section.interGroupSpacing = 36
//                
//                return section
//            } else {
//                // Car section
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(380))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(400))
//                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//                
//                let section = NSCollectionLayoutSection(group: group)
//                section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16)
//                section.interGroupSpacing = 16
//                
//                return section
//            }
//        }
//        
//        return layout
//    }
//}
//
//extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2 // One for categories, one for cars
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0 {
//            return 3 // Number of categories
//        } else {
//            return 10 // Number of cars
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//            cell.carImage.image = UIImage(named: "\(cars[indexPath.row])")
//            // Configure category cell
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCell
//            // Configure car cell
//            return cell
//        }
//    }
//}
//
//class CategoryCell: UICollectionViewCell {
//    let carImage = UIImageView()
//    
//    // Customize cell with category details
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCell()
//        setupImage()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupCell() {
//        // Setup cell views and layout
//        backgroundColor = .blue
//        layer.cornerRadius = 16
//    }
//    
//    func setupImage() {
//        carImage.contentMode = .scaleAspectFill
//        addSubview(carImage)
//        carImage.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            carImage.topAnchor.constraint(equalTo: topAnchor),
//            carImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
//            carImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -45),
//            carImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
//        ])
//    }
//}
//
//class CarCell: UICollectionViewCell {
//    // Customize cell with car details
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
//        // Setup cell views and layout
//        backgroundColor = .lightGray
//        layer.cornerRadius = 20
//    }
//}
//
//#Preview() {
//    MainVC()
//}
