//
//  CurrentWeatherView.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/16/25.
//

import UIKit

final class CurrentWeatherView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
