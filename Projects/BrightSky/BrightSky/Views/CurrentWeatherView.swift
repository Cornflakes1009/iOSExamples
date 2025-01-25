//
//  CurrentWeatherView.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/16/25.
//

import UIKit

final class CurrentWeatherView: UIView {

    private var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        createCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func reload() {
        
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.layout(for: sectionIndex)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(CurrentWeatherCollectionViewCell.self, forCellWithReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier)
        cv.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier)
        cv.register(DailyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier)
        self.collectionView = cv
        
        addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: topAnchor),
            cv.leftAnchor.constraint(equalTo: leftAnchor),
            cv.rightAnchor.constraint(equalTo: rightAnchor),
            cv.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func layout(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let section = CurrentWeatherSection.allCases[sectionIndex]
        
        switch section {
        case .current:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
            return NSCollectionLayoutSection(group: group)
        case .hourly:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
            return NSCollectionLayoutSection(group: group)
        case .daily:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
            return NSCollectionLayoutSection(group: group)
        }
    }
}

extension CurrentWeatherView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? CurrentWeatherCollectionViewCell else {
                fatalError()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? DailyWeatherCollectionViewCell else {
                fatalError()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? HourlyWeatherCollectionViewCell else {
                fatalError()
            }
            return cell
        }
    }
}
