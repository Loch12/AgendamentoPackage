//
//  InitialViewController.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 17/03/22.
//

import UIKit

public class InitialViewController: UIViewController {
  //MARK: -
  lazy var confirmationButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 25
    button.setTitle("Confirmar Agendamento", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.backgroundColor = #colorLiteral(red: 0.114436962, green: 0.7574731846, blue: 0.3423004705, alpha: 1)
    return button
  }()
  
  //MARK: - Override Methods
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  //MARK: - Methods
  public func setupView(){
    view.backgroundColor = .white
    view.addSubview(confirmationButton)
    applyConstraints()
  }
  
  public func applyConstraints() {
    if #available(iOS 11.0, *) {
      NSLayoutConstraint.activate([
        confirmationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        confirmationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        confirmationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        confirmationButton.heightAnchor.constraint(equalToConstant: 50)
      ])
    } else {
      // Fallback on earlier versions
    }
  }
  
  @objc public func buttonPressed(_ sender: UIButton) {
    self.confirmationButton.setTitle("Carregando...", for: .normal)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      let newViewController = ViewController()
      let returnViewModel = ReturnViewModel(filename: "Teste")
      self.setupNextView(nextView: newViewController, model: returnViewModel)
      if #available(iOS 13.0, *) {
        newViewController.isModalInPresentation = true
      } else {
        // Fallback on earlier versions
      }
      self.navigationController?.present(newViewController, animated: true, completion: nil)
      self.confirmationButton.setTitle("Confirmar Agendamento", for: .normal)
    }
  }
  
  public func setupNextView(nextView: ViewController, model: ReturnViewModel) {
    nextView.returnViewModel = model
  }
}
