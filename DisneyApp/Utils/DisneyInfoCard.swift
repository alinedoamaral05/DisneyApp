//
//  DisneyInfoCard.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//

import UIKit

class DisneyInfoCard: UITableViewCell {
    
    var filmsArray: [String] = []
    var shortFilmsArray: [String] = []
    var tvShowsArray: [String] = []
    var parkAttractionsArray: [String] = []
    var alliesArray: [String] = []
    var enemiesArray: [String] = []
    
    //MARK: - Components
    let characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //colocar imagem que retorna da API
        return image
    }()
    
    let stackViewForInfos: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let films: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
  
        return label
    }()
    
    let shortFilms: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tvShows: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let parkAttractions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let allies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enemies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
