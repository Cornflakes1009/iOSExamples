//
//  StarRewardsRow.swift
//  Starbucks
//
//  Created by Harold Davidson on 1/3/25.
//

import UIKit

class StarRewardsRow: UIView {
    
    let starAndPoints = StarAndPoints()
    let descriptionLabel = UILabel()
    
    init(numberOfPoints: String, description: String) {
        starAndPoints.pointsLabel.text = numberOfPoints
        descriptionLabel.text = description
        
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarRewardsRow {
    func style() {
        starAndPoints.translatesAutoresizingMaskIntoConstraints = false
        starAndPoints.pointsLabel.textColor = .black
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.sizeToFit()
        descriptionLabel.textColor = .black
    }
    
    func layout() {
        addSubview(starAndPoints)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            starAndPoints.topAnchor.constraint(equalTo: topAnchor),
            starAndPoints.bottomAnchor.constraint(equalTo: bottomAnchor),
            starAndPoints.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: starAndPoints.trailingAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        
        starAndPoints.setContentHuggingPriority(.defaultHigh, for: .horizontal) // this means that the starAndPoints isn't going to stretch if it's out of space.
        descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabel.frame.size.height).setActiveBreakable() // this is set so it can be calculated at runtime.
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 10, height: 16)
    }
}
