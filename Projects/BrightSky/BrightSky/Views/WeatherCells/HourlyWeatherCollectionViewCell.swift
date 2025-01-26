//
//  HourlyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/24/25.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        
    }
}
