//
//  ItemsVC.swift
//  To-Do App
//
//  Created by Ananth Desai on 18/02/22.
//

import UIKit

class ItemsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var index: Int
    
    init(_ index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceData[index].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = returnRootView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sourceData[index].items[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    
    let returnRootView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(returnRootView)
        returnRootView.dataSource = self
        returnRootView.delegate = self
        print(sourceData[index].items)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(newItem)
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        returnRootView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        returnRootView.frame = view.bounds
    }
    
    @objc func newItem() {
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: {[alert] _ in
            sourceData[self.index].addItem(alert.textFields![0].text!)
            self.returnRootView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
}
