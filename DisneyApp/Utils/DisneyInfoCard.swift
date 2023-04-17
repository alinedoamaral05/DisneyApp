//
//  DisneyInfoCard.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//

import UIKit

class DisneyInfoCard: UIView {
    //MARK: - Components
    let characterImage: UIImageView = {
        let image = UIImageView()
        //colocar imagem que retorna da API
        return image
    }()
    
    let stackViewForInfos: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    let name: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let films: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let shortFilms: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let tvShows: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let parkAttractions: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let allies: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let enemies: UILabel = {
        let label = UILabel()
        return label
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
    }
    
    private func setupHierarchy() {
        addSubview(characterImage)
        addSubview(stackViewForInfos)
        stackViewForInfos.addArrangedSubview(name)
        stackViewForInfos.addArrangedSubview(films)
        stackViewForInfos.addArrangedSubview(shortFilms)
        stackViewForInfos.addArrangedSubview(tvShows)
        stackViewForInfos.addArrangedSubview(parkAttractions)
        stackViewForInfos.addArrangedSubview(allies)
        stackViewForInfos.addArrangedSubview(enemies)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            characterImage.heightAnchor.constraint(equalToConstant: 40),
            characterImage.widthAnchor.constraint(equalToConstant: 20),
            stackViewForInfos.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackViewForInfos.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor),
            stackViewForInfos.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            stackViewForInfos.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
  
        ])
    }
}
