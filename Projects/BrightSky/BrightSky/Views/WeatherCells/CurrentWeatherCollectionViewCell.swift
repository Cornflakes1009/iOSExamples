//
//  CurrentWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/24/25.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
