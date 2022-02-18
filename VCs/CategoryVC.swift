//
//  CategoryVC.swift
//  To-Do App
//
//  Created by Ananth Desai on 18/02/22.
//

import UIKit

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex: Int = 0
    let returnTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
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
        let newVC = ItemsVC(indexPath.row)
        selectedIndex = indexPath.row
        newVC.title = sourceData[indexPath.row].title
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        view.addSubview(returnTableView)
        returnTableView.dataSource = self
        returnTableView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "+ Add",
            style: .plain,
            target: self,
            action: #selector(didTapAddCategory)
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        returnTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        returnTableView.frame = view.bounds
    }
    
    @objc func didTapAddCategory() {
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
