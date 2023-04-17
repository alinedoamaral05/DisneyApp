//
//  ViewModel.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//
/*
 Features:
 
  - Login ( com firebase, pode ser usuário e senha ou gmail )
 
  - Cadastro de usuário, com nome, email, e uma foto de perfil. ( também pelo firebase )
 
  - Utilizar ao menos 1 feature flag ( tbm do firebase remote config )
 
  - salvar ao menos 1 informação no user defaults
 */
import UIKit

protocol ViewModelDelegate {
    func getOptions() -> [Characters]
    func errorMessage(_ message: String)
}
class ViewModel {
    var delegate: ViewModelDelegate?
    var charactersList: [Characters] = []
    
    var requestDelegate: ViewModelDelegate?
    
    func request() {
        guard let url = URL(string: "https://api.disneyapi.dev/characters") else {
            self.delegate?.errorMessage("Something went wrong on api")
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.delegate?.errorMessage("Something went wrong on task")
                }
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let response = try JSONDecoder().decode(ApiModel.self, from: data)
                         self.charactersList = response.data
                    print(response.data)
                    }
                catch {
                    self.delegate?.errorMessage("Something went wrong on decode")
                }
            }
        }
        task.resume()
    }
}



