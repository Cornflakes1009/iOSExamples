//
//  DailyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/24/25.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: DailyWeatherCollectionViewCellViewModel) {
        
    }
}
