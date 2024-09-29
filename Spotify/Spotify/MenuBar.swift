//
//  MenuBar.swift
//  Spotify
//
//  Created by Harold Davidson on 9/29/24.
//

import UIKit

class MenuBar: UIView {
    let playlistsButton: UIButton!
    let artistsButton: UIButton!
    let albumsButton: UIButton!
    var buttons: [UIButton]!
    
    override init(frame: CGRect) {
        playlistsButton = makeButton(withText: "Playlists")
        artistsButton = makeButton(withText: "Playlists")
        albumsButton = makeButton(withText: "Playlists")
        
        buttons = [playlistsButton, artistsButton, albumsButton]
        super.init(frame: .zero)
        
        playlistsButton.addTarget(nil, action: #selector(playlistsButtonTapped), for: .primaryActionTriggered)
        artistsButton.addTarget(nil, action: #selector(artistsButtonTapped), for: .primaryActionTriggered)
        albumsButton.addTarget(nil, action: #selector(albumsButtonTapped), for: .primaryActionTriggered)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        for view in buttons {
            addSubview(view)
        }
        NSLayoutConstraint.activate([
            playlistsButton.topAnchor.constraint(equalTo: topAnchor),
            playlistsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            artistsButton.topAnchor.constraint(equalTo: topAnchor),
            artistsButton.leadingAnchor.constraint(equalTo: playlistsButton.trailingAnchor, constant: 36),
            
            albumsButton.topAnchor.constraint(equalTo: topAnchor),
            albumsButton.leadingAnchor.constraint(equalTo: artistsButton.trailingAnchor, constant: 36),
        ])
    }
    
}


extension MenuBar {
    @objc func playlistsButtonTapped() {
        
    }
    
    @objc func artistsButtonTapped() {
        
    }
    
    @objc func albumsButtonTapped() {
        
    }
}
func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    return button
}
