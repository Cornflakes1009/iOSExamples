//
//  ProjectTwoController.swift
//  Spotify
//
//  Created by Harold Davidson on 10/6/24.
//

import UIKit

class ProjectTwoController: UIViewController {
    let songs = [
        "Whispers in the Rain", "Starlight Reverie", "Echoes of Tomorrow", "Wild Hearts Run Free", "Midnight in Motion", "Golden Horizon", "Lost in the Night Sky", "Waves of Eternity", "Fading Shadows", "Dancing on the Edge", "Velvet Sunsets", "Chasing Daydreams", "Fragments of Time", "Crimson and Clover", "City Lights, Silent Nights", "Into the Blue", "Electric Pulse", "Silent Serenade", "Ghosts of the Past", "Beneath the Northern Lights"
    ]
    static let headerKind = "header-element-kind"
    var collectionView: UICollectionView! = nil
    var headerView: HeaderView?
    var floatingheaderView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    // MARK: - Layout
    func layout() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.reuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: ProjectTwoController.headerKind, withReuseIdentifier: HeaderView.reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // floating header view
        floatingheaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(floatingheaderView)
        floatingheaderView.track = ProjectTwoTrack(imageNmae: "tron-large")
        floatingheaderView.isFloating = true
        NSLayoutConstraint.activate([
            floatingheaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            floatingheaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // doesn't need leading/trailing constraints due to intrinsicContentSize defined on HeaderView
        ])
    }
    
    func createLayout() -> UICollectionViewLayout {
        // ListCell layout
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        // Header Layout
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize, elementKind: ProjectTwoController.headerKind, alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ProjectTwoController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    // ListCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.reuseIdentifier, for: indexPath) as! ListCell
        cell.label.text = songs[indexPath.item]
        return cell
    }
    
    // HeaderView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
        let track = ProjectTwoTrack(imageNmae: "tron-large")
        headerView.track = track
        self.headerView = headerView
        self.headerView?.isHidden = true
        return headerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        headerView?.scrollViewDidScroll(scrollView)
        floatingheaderView.scrollViewDidScroll(scrollView)
    }
}
