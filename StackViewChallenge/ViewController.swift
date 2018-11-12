//
//  ViewController.swift
//  StackViewChallenge
//
//  Created by Jackson Ho on 11/11/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultButton()
        defaultStackView()
    }
    
    // Creating the button and add the action to it as well
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("VERTICAL", for: .normal)
        button.addTarget(self, action: #selector(changeTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    // Action function to animate the change of orientation of the stack view
    @objc func changeTapped(sender: UIButton){
        if stack.axis == .horizontal{
            button.setTitle("HORIZONTAL", for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.stack.axis = .vertical
            }
        }else{
            button.setTitle("VERTICAL", for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.stack.axis = .horizontal
            }
        }
    }
    
    // Creating a function that will handle the constraints of the button to avoid poluting the viewDidLoad function
    func defaultButton() {
        // Adding and setting the constraints for the button
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    // Create a empty stackView to be reference in the button's action function
    var stack = UIStackView(arrangedSubviews: [])
    
    // Creating a function that will handle the constraints of the stack view
    func defaultStackView() {
        // Creating the views for the stack view
        let blueView = UIView()
        blueView.backgroundColor = .blue
        let redView = UIView()
        redView.backgroundColor = .red
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        // Adding the stack view with three views
        stack.addArrangedSubview(blueView)
        stack.addArrangedSubview(redView)
        stack.addArrangedSubview(greenView)
        // Make sure that the views inside the stack are distributed equally
        stack.distribution = .fillEqually
        // Allow the stack view to conform to constaints
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        // Stack view constraint
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: button.topAnchor)
            ])
    }
}

