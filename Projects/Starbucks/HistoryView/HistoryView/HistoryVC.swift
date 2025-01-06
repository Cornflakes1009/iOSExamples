//
//  HistoryVC.swift
//  HistoryView
//
//  Created by Harold Davidson on 1/5/25.
//

import UIKit

struct HistorySection {
    let title: String
    let transactions: [Transaction]
}

struct History: Codable {
    let transactions: [Transaction]
}

struct Transaction: Codable {
    let id: Int
    let type: String
    let amount: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case amount
        case date = "processed_at"
    }
}

class HistoryVC: UITableViewController {
    
    //var sections = [HistorySection]()
    
    var viewModel: HistoryViewModel?
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
//        data()
        fetchTransactions()
    }
    
    func fetchTransactions() {
        HistoryService.shared.fetchTransactions { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case.success(let transactions):
                self.viewModel?.transactions = transactions
                self.tableView.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func style() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        navigationItem.title = "History"
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: cellId)
        
        viewModel = HistoryViewModel()
    }
    
//    func data() {
//        let txt1 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        let txt2 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        let txt22 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        let txt3 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        let txt33 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        let txt333 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        
//        let firstSection = HistorySection(title: "July", transactions: [txt1])
//        let secondSection = HistorySection(title: "June", transactions: [txt2, txt22])
//        let thirdSection = HistorySection(title: "May", transactions: [txt3, txt33, txt333])
//        
//        sections.append(firstSection)
//        sections.append(secondSection)
//        sections.append(thirdSection)
//    }
}

extension HistoryVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vm = viewModel else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HistoryViewCell else {
            return UITableViewCell()
        }
        
        let section = indexPath.section
        var transaction: Transaction
        switch section {
        case 0:
            transaction = vm.sections[0].transactions[indexPath.row]
        case 1:
            transaction = vm.sections[1].transactions[indexPath.row]
        case 2:
            transaction = vm.sections[2].transactions[indexPath.row]
        default:
            return UITableViewCell()
        }
        
        cell.transaction = transaction
        
        return cell
    }
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = viewModel else { return 0 }
        switch section {
        case 0:
            return vm.sections[0].transactions.count
        case 1:
            return vm.sections[1].transactions.count
        case 2:
            return vm.sections[2].transactions.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let vm = viewModel else { return nil }
        switch section {
        case 0:
            return vm.sections[0].title
        case 1:
            return vm.sections[1].title
        case 2:
            return vm.sections[2].title
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = viewModel?.sections else { return 0}
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .tileBrown
    }
}
