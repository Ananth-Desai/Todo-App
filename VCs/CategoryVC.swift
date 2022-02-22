//
//  CategoryVC.swift
//  To-Do App
//
//  Created by Ananth Desai on 18/02/22.
//

import UIKit

class CategoryVC: UIViewController {
    private var selectedIndex: Int = 0
    private var categoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setupNavigationBar()
        let constraints = setupCategoryTableView()
        NSLayoutConstraint.activate(constraints)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoryTableView.frame = view.bounds
    }

    private func setupCategoryTableView() -> [NSLayoutConstraint] {
        categoryTableView = UITableView()
        categoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTableView)
        categoryTableView.dataSource = self
        categoryTableView.delegate = self

        return [
            categoryTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            categoryTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoryTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            categoryTableView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: categoryTableViewTopAnchorConstant
            ),
        ]
    }
    
    private func setupNavigationBar() {
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navbarAppearance.backgroundColor = UIColor.systemCyan
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: navbarRightButtonTitle,
            style: .plain,
            target: self,
            action: #selector(didTapAddCategory)
        )
        let addButton = navigationItem.rightBarButtonItem
        addButton?.setTitleTextAttributes([
            .foregroundColor: UIColor.white,
        ], for: .normal)
    }

    @objc private func didTapAddCategory() {
        let alert = UIAlertController(title: alertTitle, message: "", preferredStyle: .alert)
        alert.addTextField{(textfield) in
            textfield.placeholder = textfieldPlaceholder
        }
        alert.addAction(UIAlertAction(title: alertRightButtonTitle, style: .default, handler: { [alert] _ in
            sourceData.append(Item(category: alert.textFields![0].text!, array: []))
            self.categoryTableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return sourceData.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sourceData[indexPath.row].title
        cell.backgroundColor = .white
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = ItemsVC(indexPath.row)
        selectedIndex = indexPath.row
        newVC.title = sourceData[indexPath.row].title
        navigationController?.pushViewController(newVC, animated: true)
    }
}

// MARK: Constants

private let categoryTableViewTopAnchorConstant: CGFloat = 0
private let navbarRightButtonTitle = "+"
private let alertTitle = "Add New Todo Item"
private let alertRightButtonTitle = "Add"
private let textfieldPlaceholder = "Add a new category"

