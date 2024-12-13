//
//  TrackCell.swift
//  Spotify
//
//  Created by Harold Davidson on 10/7/24.
//

import UIKit

struct Track {
    let imageName: String
    let title: String
    let artist: String
}

protocol TrackCellDelegate: AnyObject {
    func didTapItemInCell()
}

let trackCellHeight: CGFloat = 72
class TrackCell: UICollectionViewCell {
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    weak var delegate: TrackCellDelegate?
    
    var track: Track? {
        didSet {
            guard let track = track else { return }
            let image = UIImage(named: track.imageName) ?? UIImage(named: "placeholder")
            
            imageView.image = image
            titleLabel.text = track.title
            subtitleLabel.text = track.artist
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body).withTraits(traits: .traitBold)
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.alpha = 0.7
        
        let views = [imageView, titleLabel, subtitleLabel]
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let stackView = makeStackView(axis: .vertical)
        stackView.spacing = 6
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        addSubview(imageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: trackCellHeight),
            imageView.widthAnchor.constraint(equalToConstant: trackCellHeight),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 3),
        ])
    }
    
    func someAction() {
        delegate?.didTapItemInCell()
    }
}
