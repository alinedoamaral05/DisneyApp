//
//  ViewController.swift
//  Disney App
//
//  Created by Aline do Amaral on 10/04/23.
//

import UIKit

class LandingViewController: UIViewController {
// MARK: - Properties
        private let background: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFill
            image.image = UIImage(named: "disney")
            
            return image
        }()
        
        private let appNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Disney App"
            label.font = UIFont(name: "Arial", size: 30)
            label.textColor = .white
            label.textAlignment = .center
            
            return label
        }()
        
        private let buttonStackView: UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 8
            
            return stack
        }()
        
        lazy var signInButton: DisneyButton = {
            let button = DisneyButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.type = .primary
            button.setTitle("Login", for: .normal)
            button.addAction(UIAction(handler: { UIAction in
                self.signInButtonPressed()
            }), for: .touchUpInside)

            return button
        }()
        
        lazy var signUpButton: DisneyButton = {
            let button = DisneyButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.type = .secondary
            button.setTitle("Register", for: .normal)
            button.addAction(UIAction(handler: { UIAction in
                self.signUpButtonPressed()

            }), for: .touchUpInside)
            return button
        }()
        
        //MARK: - Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            appSetup()
        }
        
        private func appSetup() {
            setupHierarchy()
            setupConstraints()
            configureNavigationController()
        }
        
        //MARK: - Configure Layout
        private func setupHierarchy() {
            self.view.addSubview(background)
            self.view.addSubview(appNameLabel)
            self.view.addSubview(buttonStackView)
            buttonStackView.insertArrangedSubview(signInButton, at: 0)
            buttonStackView.insertArrangedSubview(signUpButton, at: 1)
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                background.topAnchor.constraint(equalTo: view.topAnchor),
                background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                background.leadingAnchor.constraint(equalTo: view.leadingAnchor),

                appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
                appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
                buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
                
                signInButton.heightAnchor.constraint(equalToConstant: 52),
                signUpButton.heightAnchor.constraint(equalToConstant: 52)
            ])
        }
        
        //MARK: - Actions
        private func signInButtonPressed() {
            let controller = LoginViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
        
        private func signUpButtonPressed() {
            print("entrei no inscricao")
        }
        
        //MARK: - Configure NavigationItem
        private func configureNavigationController() {
            navigationItem.backButtonTitle = " "
        }
    }

