//
//  ReturnModel.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation

public struct ReturnModel: Codable {
  let id: String
  let agendamento_proprio: Bool
  let nome, cpf, data_nascimento, telefone: String
  let tempo_atendimento: Int
  let data, data_limite_confirmacao, data_confirmacao: String
  let tipo, status: Status
  let unidade: Unidade
  let servico: Servico
}

// MARK: - Servico
public struct Servico: Codable {
  let id, nome, descricao, orientacoes: String
  let ativo: Bool
  let tipos: [Status]
}

// MARK: - Status
public struct Status: Codable {
  let id: Int
  let descricao: String
}

// MARK: - Unidade
public struct Unidade: Codable {
  let id, nome: String
  let telefone: String?
  let ativo: Bool
  let endereco: Endereco
}

// MARK: - Endereco
public struct Endereco: Codable {
  let id: Int
  let logradouro, numero, complemento, bairro: String
  let cidade, cep, ponto_referencia: String
  let uf: Uf
}

// MARK: - Uf
public struct Uf: Codable {
  let uf, descricao: String
}

