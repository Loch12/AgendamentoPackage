//
//  InformationView.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation
import UIKit

public class InformationView: UIView {
  //MARK: - Properties
  var recomendacao = String()
  
  //MARK: - 
  lazy var textLabel: UILabel = {
    let label = UILabel()
    label.attributedText = self.recomendacao.htmlToAttributedString
    label.font = UIFont.systemFont(ofSize: 18)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //MARK: - Override Methods
  override init(frame: CGRect) {
    super.init(frame: CGRect())
  }
  
  init(returnModel: ReturnViewModel){
    super.init(frame: CGRect())
    self.recomendacao = returnModel.recomendacao
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Methods
  public func setupView() {
    addSubview(textLabel)
    applyConstraints()
  }
  
  public func applyConstraints() {
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: topAnchor),
      textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

//MARK: - Extensions
extension String {
  var htmlToAttributedString: NSAttributedString? {
    guard let data = data(using: .utf8) else { return nil }
    do {
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
      return nil
    }
  }
  var htmlToString: String {
    return htmlToAttributedString?.string ?? ""
  }
}
