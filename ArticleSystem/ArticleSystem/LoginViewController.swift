//
//  LoginViewController.swift
//  ArticleSystem
//
//  Created by 典萱 高 on 2017/11/26.
//  Copyright © 2017年 LostRfounds. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginRegisterSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [
                NSLocalizedString("Login", comment: ""),
                NSLocalizedString("Register", comment: "")
            ])
        segmentedControl.backgroundColor = .gray
        segmentedControl.tintColor = .yellow
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(
            self,
            action: #selector(handleLoginRegisterChange),
            for: .valueChanged
        )
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    @objc func handleLoginRegisterChange() {
        // loginRegisterButton text change
        guard
            let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        else { return }
        loginRegisterButton.setTitle(
            NSLocalizedString(title, comment: ""),
            for: .normal
        )

        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 { //login
            containerViewHeightConstraint.constant = 100
            firstNameTextFieldHeightConstraint.isActive = false
            lastNameTextFieldHeightConstraint.isActive = false
            emailTextFieldHeightConstraint.isActive = false
            passwordTextFieldHeightConstraint.isActive = false

            firstNameTextFieldHeightConstraint = firstNameTextField.heightAnchor.constraint(equalToConstant: 0)
            lastNameTextFieldHeightConstraint = lastNameTextField.heightAnchor.constraint(equalToConstant: 0)
            emailTextFieldHeightConstraint = emailTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2)
            passwordTextFieldHeightConstraint = passwordTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2)

            NSLayoutConstraint.activate([
                firstNameTextFieldHeightConstraint,
                lastNameTextFieldHeightConstraint,
                emailTextFieldHeightConstraint,
                passwordTextFieldHeightConstraint
            ])
        }
    }
    
    let loginRegisterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("your first name", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let firstNameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("your last name", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    let lastNameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("email", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("password", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        view.addSubview(loginRegisterButton)
        view.addSubview(containerView)
        view.addSubview(loginRegisterSegmentedControl)
        
        
        setupLoginRegisterButton()
        setupContainerView()
        setupLoginRegisterSegmentedControl()
    }
    
    func setupLoginRegisterSegmentedControl() {
        
        NSLayoutConstraint.activate([
            loginRegisterSegmentedControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: loginRegisterButton.centerXAnchor),
            loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: loginRegisterButton.widthAnchor),
            loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    
    var containerViewHeightConstraint = NSLayoutConstraint()
    var firstNameTextFieldHeightConstraint = NSLayoutConstraint()
    var lastNameTextFieldHeightConstraint = NSLayoutConstraint()
    var emailTextFieldHeightConstraint = NSLayoutConstraint()
    var passwordTextFieldHeightConstraint = NSLayoutConstraint()
    
    func setupContainerView() {
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 200)
        NSLayoutConstraint.activate([
            // x, y, height, width
            containerViewHeightConstraint,
            containerView.widthAnchor.constraint(equalTo: loginRegisterButton.widthAnchor),
            containerView.topAnchor.constraint(equalTo: loginRegisterSegmentedControl.bottomAnchor, constant: 20),
            containerView.centerXAnchor.constraint(equalTo: loginRegisterButton.centerXAnchor),
        ])
        
        containerView.addSubview(firstNameTextField)
        containerView.addSubview(firstNameSeperatorView)
        containerView.addSubview(lastNameTextField)
        containerView.addSubview(lastNameSeperatorView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(emailSeperatorView)
        containerView.addSubview(passwordTextField)
        
        firstNameTextFieldHeightConstraint = firstNameTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/4)
        lastNameTextFieldHeightConstraint = lastNameTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/4)
        emailTextFieldHeightConstraint = emailTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/4)
        passwordTextFieldHeightConstraint = passwordTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/4)
        
        NSLayoutConstraint.activate([
            // firstNameTextField
            firstNameTextFieldHeightConstraint,
            firstNameTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10),
            firstNameTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            firstNameTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            // firstNameSeparatorView
            firstNameSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            firstNameSeperatorView.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor),
            firstNameSeperatorView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -2),
            firstNameSeperatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            // lastNameTextField
            lastNameTextFieldHeightConstraint,
            lastNameTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10),
            lastNameTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor),
            
            // lastNameSeparatorView
            lastNameSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            lastNameSeperatorView.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor),
            lastNameSeperatorView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -2),
            lastNameSeperatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            // emailTextField
            emailTextFieldHeightConstraint,
            emailTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10),
            emailTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: lastNameSeperatorView.bottomAnchor),
            
            // emailSeparatorView
            emailSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            emailSeperatorView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -2),
            emailSeperatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            // passwordTextField
            passwordTextFieldHeightConstraint,
            passwordTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10),
            passwordTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailSeperatorView.bottomAnchor)
        ])
    }

    
    func setupLoginRegisterButton() {
        NSLayoutConstraint.activate([
            // x, y, height, width
            loginRegisterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            loginRegisterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            loginRegisterButton.heightAnchor.constraint(equalToConstant: 50),
            loginRegisterButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20)
        ])
    }
    
    

    
}
