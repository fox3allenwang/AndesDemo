//
//  LoginVC.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/27.
//

import UIKit

class LoginVC: BaseViewController {

    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var confrmBtn: UIButton!
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    
    func setupUI() {
        setBackgroundColor()
        
        confrmBtn.tintColor = .white
        confrmBtn.setTitle("Confirm", for: .normal)
        
        forgetPasswordBtn.setTitle(" ", for: .normal)
        
        loginTitle.text = "Login"
        loginTitle.setCharacterSpacing()
        
        accountTextField.text = "admin"
        passwordTextField.text = "admin"
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func confirm(_ sender: Any) {
        guard let account = accountTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        let request = LoginRequest(account: account, password: password)
        
        NetworkManager.shared.requestData(method: .post, path: .login, parameters: request) { (response: Result<LoginResponse, RequestError>) in
            switch response {
            case .success(let success):
                if success.status == "0" && account == "admin" {
                    DispatchQueue.main.async {
                        let nextVC = MainVC()
                        self.pushViewController(nextVC)
                    }
                } else {
                    print(success.message)
                }
            case .failure(let failure):
                switch failure {
                case .unknownError:
                    print("unknownError")
                case .jsonDecodeFailed:
                    print("jsonDecodeFailed")
                case .badGateway:
                    print("badGateway")
                case .authorizationError:
                    print("authorizationError")
                case .connectionError:
                    print("connectionError")
                case .internalError:
                    print("internalError")
                case .invalidRequest:
                    print("invalidRequest")
                case .invalidResponse:
                    print("invalidResponse")
                case .notFound:
                    print("notFound")
                case .serverUnavailable:
                    print("serverUnavailable")
                case .serverError:
                    print("serverError")
                }
            }
        }
    }
}
