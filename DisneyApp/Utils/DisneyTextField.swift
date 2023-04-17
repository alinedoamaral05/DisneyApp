//
//  DisneyTextField.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//
import UIKit

class DisneyTextField: UIView {
    //MARK: - Components
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView
            .axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let textFieldView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let viewForImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.backgroundColor = UIColor(named: "disneyNavy")?.cgColor
        
        return view
    }()
    
    private let imageFromTextField: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let textField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Arial", size: 12)
        textField.borderStyle = .none
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        appSetup()
    }
    
    private func appSetup() {
        setupHierarchy()
        setupConstraints()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(textFieldView)
        textFieldView.addSubview(viewForImage)
        viewForImage.addSubview(imageFromTextField)
        textFieldView.addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textFieldView.heightAnchor.constraint(equalToConstant: 52),
            
            viewForImage.widthAnchor.constraint(equalToConstant: 42),
            viewForImage.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 5),
            viewForImage.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -5),
            viewForImage.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 5),
            
            imageFromTextField.centerXAnchor.constraint(equalTo: viewForImage.centerXAnchor),
            imageFromTextField.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            
            textField.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -4),
            textField.trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor, constant: -4),
        ])
    }
    
    func setupLayout() {
        textFieldView.layer.borderColor = UIColor.systemGray.cgColor
        textFieldView.layer.masksToBounds = true
        textFieldView.layer.borderWidth = 1
        textFieldView.layer.cornerRadius = 26
    }
    
    func customTextField(type: TextFieldType) {
        textField.returnKeyType = .continue
        switch type {
        case .email:
            textField.text = nil
            textField.keyboardType = .emailAddress
            textField.autocapitalizationType = .none
            textField.placeholder = "Email"
            imageFromTextField.image = UIImage(systemName: "person")
        case .password:
            textField.text = nil
            textField.isSecureTextEntry = true
            textField.textContentType = .oneTimeCode
            textField.placeholder = "Password"
            imageFromTextField.image = UIImage(systemName: "lock")
        }
    }
}

enum TextFieldType {
    case email
    case password
}
