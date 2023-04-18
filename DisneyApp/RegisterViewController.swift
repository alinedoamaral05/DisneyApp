//
//  RegisterViewController.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 18/04/23.
//

import UIKit
import FirebaseCore

class RegisterViewController: UIViewController {
    //MARK: - Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    private let nameAndGreetingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30
        
        return stackView
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Disney App"
        label.font = UIFont(name: "Arial", size: 30)
        label.tintColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.font = UIFont(name: "Arial", size: 15)
        label.tintColor = .black
        
        return label
    }()
    
    private let textfieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 11
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let emailTextField: DisneyTextField = {
        let txf = DisneyTextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        txf.customTextField(type: .email)
        
        return txf
    }()
    
    private let passwordTextField: DisneyTextField = {
        let txf = DisneyTextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        txf.customTextField(type: .password)
        
        return txf
    }()
    
    lazy var signInButton: DisneyButton = {
        let button = DisneyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonEnable()
        button.type = .primary
        button.setTitle("Login", for: .normal)
        
        return button
    }()
    
    private let footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 3
        
        return stackView
    }()
    
    //MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        appSetup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        refreshNavigation()
    }
    
    //MARK: - Gesture
    private func appSetup() {
        self.view.backgroundColor = .white
        setupUI()
        setupLayout()
        setupGesture()
        setupNavigationItem()
    }
    
    private func setupGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Navigation
    private func setupNavigationItem() {
        navigationItem.backButtonTitle = " "
    }
    
    private func refreshNavigation() {
        navigationItem.hidesBackButton = true
        self.dismiss(animated: false)
        self.removeFromParent()
    }
    
    //MARK: - Setup Layout
    
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupLayout() {
        setTextFieldDelegate()
    }
    
    private func setTextFieldDelegate() {
        emailTextField.textField.delegate = self
        passwordTextField.textField.delegate = self
    }
    
    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameAndGreetingsStackView)
        nameAndGreetingsStackView.addArrangedSubview(appNameLabel)
        nameAndGreetingsStackView.addArrangedSubview(welcomeLabel)
        contentView.addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(signInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            nameAndGreetingsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameAndGreetingsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameAndGreetingsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameAndGreetingsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            textfieldStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -55),
            textfieldStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            textfieldStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textfieldStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            
            signInButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 52),
            signInButton.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 55),
            signInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55)
        ])
    }
    
    private func redirectToHome() {
        let controller = HomeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - Extensions
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}
