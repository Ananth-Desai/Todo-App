//
//  RootViewController.swift
//  To-Do App
//
//  Created by Ananth Desai on 08/02/22.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex: Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = returnTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sourceData[indexPath.row].title
        cell.backgroundColor = .systemGreen
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = ItemsViewController(indexPath.row)
        selectedIndex = indexPath.row
        newVC.title = sourceData[indexPath.row].title
        navigationController?.pushViewController(newVC, animated: true)
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(tappedAdd)
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        returnTableView.reloadData()
        print("Root View appeared")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        returnTableView.frame = view.bounds
    }
    
    @objc func tappedAdd(vc: UIViewController) {
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: {[alert] _ in
            sourceData.append(Item(category: alert.textFields![0].text!, array: []))
            self.returnTableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    
}