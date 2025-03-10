//
//  TitleBarController.swift
//  Spotify
//
//  Created by Harold Davidson on 9/25/24.
//

import UIKit

class TitleBarController: UIViewController {
    var musicBarButtonItem: UIBarButtonItem!
    var podcastBarButtonItem: UIBarButtonItem!
    
    let container = Container()
    let viewControllers: [UIViewController] = [HomeController(), HomeController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        musicBarButtonItem = makeBarButtonItem(text: "Music", selector: #selector(musicTapped))
        podcastBarButtonItem = makeBarButtonItem(text: "Podcasts", selector: #selector(podcastTapped))
    }
    
    // this is only needed here for storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItems = [musicBarButtonItem, podcastBarButtonItem]
        
        // hide bottom shade pixel
        let img = UIImage()
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupViews() {
        guard let containerView = container.view else { return }
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2), // each multiplier is 8pts
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        musicTapped() // just to make it by default when the app opens
    }
    
    func makeBarButtonItem(text: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: selector, for: .primaryActionTriggered)
        let attributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle).withTraits(traits: [.traitBold]),
            NSAttributedString.Key.foregroundColor: UIColor.label
        ]
        
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button.configuration = configuration
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    @objc func musicTapped() {
        if container.children.first == viewControllers[0] { return } // this means that it's already showing it. Do nothing
        container.add(viewControllers[0])
        animateTransition(fromVC: viewControllers[1], toVC: viewControllers[0]) { success in
            self.viewControllers[1].remove()
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.musicBarButtonItem.customView?.alpha = 1.0
            self.podcastBarButtonItem.customView?.alpha = 0.5
        })
    }
    
    @objc func podcastTapped() {
        if container.children.first == viewControllers[1] { return } // this means that it's already showing it. Do nothing
        container.add(viewControllers[1])
        animateTransition(fromVC: viewControllers[0], toVC: viewControllers[1]) { success in
            self.viewControllers[0].remove()
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.musicBarButtonItem.customView?.alpha = 0.5
            self.podcastBarButtonItem.customView?.alpha = 1.0
        })
    }
    
    func animateTransition(fromVC: UIViewController, toVC: UIViewController, completion: @escaping ((Bool) -> Void)) {
        guard
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
        else {
            return
        }
        
        let frame = fromVC.view.frame
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart
        
        UIView.animate(withDuration: 0.5, animations: {
            fromView.frame = fromFrameEnd
            toView.frame = frame
        }, completion: { success in
            completion(success)
        })
    }
    
    func getIndex(forViewController vc: UIViewController) -> Int? {
        for (index, thisVC) in viewControllers.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)!
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func bold() -> UIFont {
        withTraits(traits: .traitBold)
    }
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
