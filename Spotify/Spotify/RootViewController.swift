//
//  RootViewController.swift
//  Spotify
//
//  Created by Harold Davidson on 10/12/24.
//

import UIKit

class RootViewController: UIViewController {

    let spotifyImage = UIImageView(image: UIImage(named: "spotify-logo"))
    let projectOneBtn = UIButton(type: .system)
    let projectTwoBtn = UIButton(type: .system)
    let projectThreeBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    func setupViews() {
        spotifyImage.translatesAutoresizingMaskIntoConstraints = false
        spotifyImage.contentMode = .scaleAspectFit
        view.addSubview(spotifyImage)
        
        let btns = [("Project One", projectOneBtn), ("Project Two", projectTwoBtn), ("Project Three", projectThreeBtn)]
        for btn in btns {
            btn.1.backgroundColor = .spotifyGreen
            btn.1.tintColor = .spotifyBlack
            btn.1.setTitle(btn.0, for: .normal)
            btn.1.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
            btn.1.layer.cornerRadius = 10
            btn.1.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(btn.1)
            btn.1.widthAnchor.constraint(equalToConstant: 150).isActive = true
            btn.1.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.1.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        }
        
        NSLayoutConstraint.activate([
            spotifyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            spotifyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spotifyImage.heightAnchor.constraint(equalToConstant: 300),
            
            projectTwoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            projectTwoBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            projectOneBtn.bottomAnchor.constraint(equalTo: projectTwoBtn.topAnchor, constant: -20),
            projectOneBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            projectThreeBtn.topAnchor.constraint(equalTo: projectTwoBtn.bottomAnchor, constant: 20),
            projectThreeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func btnTapped(_ sender: UIButton) {
        var vc: UIViewController?
        if sender == projectOneBtn {
            vc = TitleBarController() // this transition isn't great
            navigationController?.pushViewController(vc!, animated: false)
            return
        } else if sender == projectTwoBtn {
            vc = ProjectTwoController()
        } else if sender == projectThreeBtn {
            return 
        }
        if let vc = vc {
            navigationController?.pushViewController(vc, animated: false)
        }
    }
 }
