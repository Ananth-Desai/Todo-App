//
//  MainVC.swift
//  To-Do App
//
//  Created by Ananth Desai on 18/02/22.
//


import UIKit

class MainVC: UIViewController {
    
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
        let rootVC = CategoryVC()
        rootVC.title = "Todo"
        let navController = UINavigationController(rootViewController: rootVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}






