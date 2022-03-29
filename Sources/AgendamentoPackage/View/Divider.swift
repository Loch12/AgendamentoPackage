//
//  Divider.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 17/03/22.
//

import UIKit

public class Divider: UIView {
  //MARK: - Properties
  var separationSize = CGFloat()
  lazy var lineView: UIView = {
    let view = UIView()
    view.backgroundColor = .gray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  //MARK: - Override Methods
  override init(frame: CGRect){
    super.init(frame: CGRect())
  }

  public init(separation: CGFloat) {
    super.init(frame: CGRect())
    self.separationSize = separation
    addSubview(lineView)
    applyConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Methods
  public func applyConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -self.separationSize).isActive = true
    lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.separationSize).isActive = true
  }
}
