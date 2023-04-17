//
//  DisneyButton.swift
//  Disney App
//
//  Created by Aline do Amaral on 10/04/23.
//
import UIKit

final class DisneyButton: UIButton {
    enum ButtonType {
        case primary
        case secondary
        case disabled
    }
    
    var type: ButtonType = .primary {
        didSet {
            setupTheButton()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupTheButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTheButton()
    }
    
    private func setupTheButton() {
        layer.cornerRadius = 22
        layer.masksToBounds = true
        tintColor = .white
        titleLabel?.font = UIFont(name: "Arial", size: 15)
        
        switch type {
        case .primary:
            backgroundColor = UIColor(named: "disneyNavy")
        case .secondary:
            setTitleColor(UIColor(named: "disneyNavy"), for: .normal)
            backgroundColor = .white
        case .disabled:
            backgroundColor = .systemGray
            tintColor = .white
        }
    }
        
    func buttonEnable() {
        isEnabled = true
    }
    
    func buttonDisable() {
        isEnabled = false
        self.type = .disabled
    }
}
