//
//  SettingsView.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/16/25.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func settingsView(_ settingsView: SettingsView, didTap option: SettingOption)
}

final class SettingsView: UIView, UITableViewDelegate, UITableViewDataSource {

    weak var delegate: SettingsViewDelegate?
    
    private var viewModel: SettingsViewViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: SettingsViewViewModel) {
        self.viewModel = viewModel
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewModel else { return }
        let option = viewModel.options[indexPath.row]
        
        delegate?.settingsView(self, didTap: option)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let viewModel {
            cell.textLabel?.text = viewModel.options[indexPath.row].title
        }
        
        return cell
    }

}
