//
//  ItemsVC.swift
//  To-Do App
//
//  Created by Ananth Desai on 18/02/22.
//

import UIKit

class ItemsVC: UIViewController {
    
    private var index: Int
    private var itemsTableView: UITableView!

    init(_ index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let constraints = setupItemsTableView()
        NSLayoutConstraint.activate(constraints)
        setupNavigationBar()
    }

    private func setupItemsTableView() -> [NSLayoutConstraint] {
        itemsTableView = UITableView()
        itemsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        itemsTableView.frame = view.bounds
        itemsTableView.translatesAutoresizingMaskIntoConstraints = false
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        view.addSubview(itemsTableView)

        return [
            itemsTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            itemsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            itemsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            itemsTableView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: itemsTableViewTopAnchorConstant
            ),
        ]
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: navbarRightButtonTitle,
            style: .plain,
            target: self,
            action: #selector(didTapAddItem)
        )
        let addButton = navigationItem.rightBarButtonItem
        addButton?.setTitleTextAttributes([
            .foregroundColor: UIColor.white,
        ], for: .normal)
    }

    @objc private func didTapAddItem() {
        let alert = UIAlertController(title: alertTitle, message: "", preferredStyle: .alert)
        alert.addTextField{(textfield) in
            textfield.placeholder = textfieldPlaceholder
        }
        alert.addAction(UIAlertAction(title: alertRightButtonTitle, style: .default, handler: { [alert] _ in
            sourceData[self.index].addItem(alert.textFields![0].text!)
            self.itemsTableView?.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension ItemsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return sourceData[index].items.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sourceData[index].items[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
}

// MARK: Constants

private let itemsTableViewTopAnchorConstant: CGFloat = 0
private let navbarRightButtonTitle = "+"
private let alertTitle = "Add New Todo Item"
private let alertLeftButtonTitle = "Cancel"
private let alertRightButtonTitle = "Submit"
private let textfieldPlaceholder = "Create new item"
