//
//  ItemsViewController.swift
//  To-Do App
//
//  Created by Ananth Desai on 09/02/22.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [String]
    
    init(_ list: [String]) {
        self.data = list
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        print(data)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        returnRootView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = returnRootView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
}
