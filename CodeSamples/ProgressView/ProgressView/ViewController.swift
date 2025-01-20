//
//  ViewController.swift
//  ProgressView
//
//  Created by Harold Davidson on 8/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Task", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 9
        button.layer.masksToBounds = true
        button.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 55)
        return button
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .systemBlue
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.center = view.center
        
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 10, y: 200, width: view.frame.size.width-10, height: 20)
        progressView.setProgress(0, animated: false)
//        let progress: Progress = Progress()
//        progressView.observedProgress = progress
    }

    @objc private func didTapButton() {
        for x in 0..<100 {
            DispatchQueue.main.asyncAfter(deadline: .now()+(Double(x) * 0.1), execute: {
                self.progressView.setProgress(Float(x)/100, animated: true)
            })
            
        }
    }

}

