//
//  RootViewController.swift
//  To-Do App
//
//  Created by Ananth Desai on 08/02/22.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [Item]
    
    init(_ lists: [Item]){
        data = lists
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let returnTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        view.addSubview(returnTableView)
        returnTableView.dataSource = self
        returnTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        returnTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items?.count ?? 0
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = returnTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = "\(items[indexPath.row])"
        cell.textLabel?.text = data[indexPath.row].title
        cell.backgroundColor = .systemGreen
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = ItemsViewController(data[indexPath.row].items)
        newVC.title = data[indexPath.row].title
        newVC.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(newItem)
        )
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    @objc func newItem() {
        print("Add new item")
    }
}
