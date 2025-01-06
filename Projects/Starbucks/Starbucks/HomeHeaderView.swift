//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/19/24.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject {
    func didTapHistoryButton(_ sender: HomeHeaderView)
}

class HomeHeaderView: UIView {
    let greetingLbl = UILabel()
    let inboxBtn = UIButton()
    let historyBtn = UIButton()
    weak var delegate: HomeHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        backgroundColor = .white
        greetingLbl.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greetingLbl.text = "Good afternoon, Harold ☀️"
        greetingLbl.textColor = .black
        greetingLbl.numberOfLines = 0
        greetingLbl.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
        makeHistoryButton()
        
        historyBtn.addTarget(nil, action: #selector(historyBtnTapped(sender:)), for: .primaryActionTriggered)
    }
    
    func layout() {
        let views = [greetingLbl, inboxBtn, historyBtn]
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
            
            historyBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: inboxBtn.trailingAnchor, multiplier: 2),
            historyBtn.centerYAnchor.constraint(equalTo: inboxBtn.centerYAnchor),
            historyBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
        ])
    }
}

extension HomeHeaderView {
    func makeHistoryButton() {
        makeButton(button: historyBtn, systemName: "calendar", text: "History")
    }
    
    func makeInboxButton() {
        makeButton(button: inboxBtn, systemName: "envelope", text: "Inbox")
    }
    
    func makeButton(button: UIButton, systemName: String, text: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemName, withConfiguration: configuration)
        
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension HomeHeaderView {
    @objc func historyBtnTapped(sender: UIButton) {
        delegate?.didTapHistoryButton(self)
    }
}
