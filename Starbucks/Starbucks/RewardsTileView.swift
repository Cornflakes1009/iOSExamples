//
//  RewardsTileView.swift
//  Starbucks
//
//  Created by Harold Davidson on 12/30/24.
//

import UIKit

class RewardsTileView: UIView {
    let balanceView = BalanceView()
    var rewardsButton = UIButton()
    let rewardsGraphView = RewardsGraphView()
    let starRewardsView = UIView()
    var detailsButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
    
    
}

extension RewardsTileView {
    func style() {
        rewardsButton.titleLabel?.text = "Rewards options"
        detailsButton.titleLabel?.text = "Details"
        
        makeRewardsOptionButton()
        
        detailsButton = makeClearButton(withText: "Details")
    }
    
    func makeRewardsOptionButton() {
        //rewardsButton.addTarget(nil, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        
        rewardsButton.setImage(image, for: .normal)
        rewardsButton.imageView?.tintColor = .black
        rewardsButton.imageView?.contentMode = .scaleAspectFit
        
        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.setTitleColor(.black, for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft // this forces the image to the right of the button instead of the default left side.
        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func layout() {
        let views = [balanceView, rewardsGraphView, starRewardsView, rewardsButton, detailsButton]
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsButton.trailingAnchor, multiplier: 3),
            
            rewardsGraphView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 1),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            rewardsGraphView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsGraphView.trailingAnchor, multiplier: 2),
            
            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphView.bottomAnchor, constant: 8),
            starRewardsView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            detailsButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardsView.bottomAnchor, multiplier: 2),
            detailsButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailsButton.bottomAnchor, multiplier: 2),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
}
