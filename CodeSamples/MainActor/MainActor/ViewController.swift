//
//  ViewController.swift
//  MainActor
//
//  Created by Harold Davidson on 11/22/25.
//

import UIKit

@MainActor
class ViewController: UIViewController {

    private let nameLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        Task {
            await loadData()
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Loading..."
        view.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func loadData() async {

        // 1. First network call
        let user = try? await fetchUser()

        // 2. Use result of first call in second call
        let profile = try? await fetchProfile(userID: user?.id ?? "")

        // 3. Use result of second call in third call
        let detailed = try? await fetchDetails(profileID: profile?.id ?? "")

        // 4. Update UI
        updateUI(with: detailed)
    }

    func updateUI(with details: Details?) {
        nameLabel.text = details?.summary ?? "Failed to load details"
    }
}

// MARK: - Fake API
struct User { let id: String }
struct Profile { let id: String }
struct Details { let summary: String }

func fetchUser() async throws -> User {
    try await Task.sleep(nanoseconds: 500_000_000)
    return User(id: "user123")
}

func fetchProfile(userID: String) async throws -> Profile {
    try await Task.sleep(nanoseconds: 500_000_000)
    return Profile(id: "profileABC")
}

func fetchDetails(profileID: String) async throws -> Details {
    try await Task.sleep(nanoseconds: 500_000_000)
    return Details(summary: "Loaded everything successfully!")
}
