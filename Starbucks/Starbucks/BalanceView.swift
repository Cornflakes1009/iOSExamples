//
//  BalanceView.swift
//  Starbucks
//
//  Created by Harold Davidson on 12/31/24.
//

import UIKit

class BalanceView: UIView {
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointsLabel.text = "12"
        pointsLabel.textColor = .black
        
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .black
        starBalanceLabel.text = "Star balance"
    }
    
    func layout() {
        let views = [pointsLabel, starView, starBalanceLabel]
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),
            
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
