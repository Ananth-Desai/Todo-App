//
//  ViewController.swift
//  To-Do App
//
//  Created by Ananth Desai on 07/02/22.
//

import UIKit

struct Item {
    var title: String
    var items: [String]
    
    init(category title: String, array list: [String]) {
        self.title = title
        self.items = list
    }
    
    mutating func addItem(_ item: String) {
        self.items.append(item)
    }
}

var sourceData: [Item] = [Item(category: "Shopping", array: ["Bread", "Butter", "Jam"]),
                          
                          Item(category: "Sports", array: ["Shoes", "Raquet", "Ball"]),
                                          
                          Item(category: "School", array: ["Books", "Pens"])]

class ViewController: UIViewController {
    
    let returnButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didStart), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        view.addSubview(returnButton)
        setupLayout()
     }
    
    @objc func setupLayout(){
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        returnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        returnButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tappedAdd()
    }
    
    @objc func didStart(){
        let rootVC = RootViewController(sourceData)
        rootVC.title = "Todo"
        let navController = UINavigationController(rootViewController: rootVC)
        navController.modalPresentationStyle = .fullScreen
        rootVC.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(tappedAdd)
        )
        present(navController, animated: true)
    }
    
    @objc func tappedAdd(vc: UIViewController) {
        print("Add new Category: ")
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: {_ in }))
        navigationController?.pushViewController(alert, animated: true)
        vc.present(alert, animated: true)
        //        sourceData.append(Item(category: "New Category", array: []))
    }
}





