//
//  ViewController.swift
//  CombineIntro
//
//  Created by Harold Davidson on 2/4/25.
//

import UIKit
import Combine

class MyCustomTableCell: UITableViewCell {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let action = PassthroughSubject<String, Never>() // <what we want to return, Never for error>
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 10, y: 3, width: contentView.frame.size.width - 20, height: contentView.frame.size.height - 6)
    }
    
    @objc private func didTapButton() {
        action.send("Cool! Button was tapped!")
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    
    var observers: [AnyCancellable] = []
    private var models = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
        APICaller.shared.fetchCompanies()
            .receive(on: DispatchQueue.main) // this receives on the main thread. receiveValue of .sink will update on main thread. No need to specify UI changes
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finished")
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { [weak self] value in // because we are using .receive(on: DispatchQueue.main), this performs on the main thread
            self?.models = value
            self?.tableView.reloadData()
        }).store(in: &observers) // storing the observer
    }

    func setUpTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyCustomTableCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableCell else {
            return UITableViewCell()
        }
        
        cell.action.sink { string in
            print(string)
        }.store(in: &observers)
        //cell.textLabel?.text = models[indexPath.row]
        return cell
    }
}

