//
//  LoginVC.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 18.05.24.
//

import UIKit

class LoginVC: UIViewController {

    let backImage = UIImageView()
    let logoImage = UIImageView()
    let nameLabel = UILabel()
    let stackView = UIStackView()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let registerButton = UIButton()
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    

    func build() {
        configureBackImage()
        configureLogoImage()
        configureNameLabel()
        configureStackView()
        configureStackElements()
    }
    
    func configureBackImage() {
        backImage.image = UIImage(named: "launchBackground")        
        view.addSubview(backImage)
        
        backImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureLogoImage() {
        logoImage.image = UIImage(named: "logo")
        
        view.addSubview(logoImage)

        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 160),
            logoImage.heightAnchor.constraint(equalToConstant: 180)
        ])

    }
    
    func configureNameLabel() {
        nameLabel.text = "driveit"
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 64, weight: .black)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            nameLabel.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    func configureStackElements() {
        emailTextField.placeholder = "email"
        emailTextField.textAlignment = .center
        emailTextField.layer.cornerRadius = 26
        emailTextField.backgroundColor = .white
        stackView.addArrangedSubview(emailTextField)
        
        passwordTextField.placeholder = "password"
        passwordTextField.textAlignment = .center
        passwordTextField.layer.cornerRadius = 26
        passwordTextField.backgroundColor = .white
        stackView.addArrangedSubview(passwordTextField)
        
        loginButton.layer.cornerRadius = 26
        loginButton.backgroundColor = .black
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("Login", for: .normal)
        stackView.addArrangedSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        registerButton.layer.cornerRadius = 10
        registerButton.backgroundColor = .clear
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        stackView.addArrangedSubview(registerButton)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "email and password can not be empty")
            return
        }
        userDefaults.setValue(true, forKey: "loginPassed")
        let controller = TabbarVC()
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        navigation.modalTransitionStyle = .flipHorizontal
        present(navigation, animated: true)
    }
    
    @objc func registerButtonTapped() {
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default))
        present(alert, animated: true)
    }
    

}

#Preview() {
    LoginVC()
}

