//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/19/24.
//

import UIKit

class HomeHeaderView: UIView {
    let greetingLbl = UILabel()
    let inboxBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        greetingLbl.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greetingLbl.text = "Good afternoon, Harold ☀️"
        greetingLbl.numberOfLines = 0
        greetingLbl.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    func layout() {
        let views = [greetingLbl, inboxBtn]
        for view in views {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            greetingLbl.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greetingLbl.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greetingLbl.trailingAnchor, multiplier: 1),
            
            inboxBtn.topAnchor.constraint(equalToSystemSpacingBelow: greetingLbl.bottomAnchor, multiplier: 2),
            inboxBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxBtn.bottomAnchor, multiplier: 1),
            inboxBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
        ])
    }
}

extension HomeHeaderView {
    func makeInboxButton() {
        inboxBtn.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)
        
        inboxBtn.setImage(image, for: .normal)
        inboxBtn.imageView?.tintColor = .secondaryLabel
        inboxBtn.imageView?.contentMode = .scaleAspectFit
        
        inboxBtn.setTitle("Inbox", for: .normal)
        inboxBtn.setTitleColor(.secondaryLabel, for: .normal)
        
//        inboxBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        inboxBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
