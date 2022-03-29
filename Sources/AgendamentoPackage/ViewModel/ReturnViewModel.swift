//
//  ReturnViewModel.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation

public class ReturnViewModel {
  //MARK: - Properties
  var name = String()
  var cpf = String()
  var birthday = String()
  var cell = String()
  var local = String()
  var localCell = String()
  var localCep = String()
  var rua = String()
  var numero = String()
  var bairro = String()
  var complemento = String()
  var cidade = String()
  var cep = String()
  var nomeVacina = String()
  var recomendacao = String()
  var date = String()

  var dateFormatted: String {
    return getFormattedDate(inputFormat: "yyyy-MM-dd HH:mm:ss", outputFormat: "dd/MM/yyyy", insertDate: self.date)
  }

  var hourFormatted: String {
    return getFormattedDate(inputFormat: "yyyy-MM-dd HH:mm:ss", outputFormat: "HH:mm", insertDate: self.date)
  }

  var birthdayFormatted: String {
    return getFormattedDate(inputFormat: "yyyy-MM-dd", outputFormat: "dd/MM/yyyy", insertDate: self.birthday)
  }

  var endereco: String {
    return "\(self.rua), \(self.numero) - \(self.bairro), \(self.cidade) - \(self.cep)"
  }

  //MARK: - Override Methods
  init(filename: String){
    fetchData(filename: filename)
  }

  //MARK: - Methods
  public func getFormattedDate(inputFormat: String, outputFormat: String, insertDate: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = inputFormat

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = outputFormat

    if let date = dateFormatterGet.date(from: insertDate) {
      return dateFormatterPrint.string(from: date)
    } else {
      print("There was an error decoding the string")
    }
    return insertDate
  }

  public func fetchData(filename fileName: String) {
      if let url = Bundle.module.url(forResource: fileName, withExtension: "json") {
          do {
              let data = try Data(contentsOf: url)
              let decoder = JSONDecoder()
              let jsonData = try decoder.decode(ReturnModel.self, from: data)
            loadJson(model: jsonData)

          } catch {
              print("error:\(error)")
          }
      }
  }

  public func loadJson(model: ReturnModel) {
    self.name = model.nome
    self.cpf = model.cpf
    self.birthday = model.data_nascimento
    self.date = model.data
    self.cell = model.telefone
    self.local = model.unidade.nome
    self.localCell = model.unidade.telefone ?? ""
    self.localCep = model.unidade.endereco.cep
    self.rua = model.unidade.endereco.logradouro
    self.numero = model.unidade.endereco.numero
    self.bairro = model.unidade.endereco.bairro
    self.complemento = model.unidade.endereco.complemento
    self.cidade = model.unidade.endereco.cidade
    self.cep = model.unidade.endereco.cep
    self.nomeVacina = model.servico.nome
    self.recomendacao = model.servico.orientacoes
  }
}

