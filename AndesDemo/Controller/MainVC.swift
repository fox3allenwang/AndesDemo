//
//  MainVC.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/6/8.
//

import UIKit
import UserNotifications

class MainVC: BaseViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var showButton: CustomButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    var dataSource: [String] = ["顯示項目1", "顯示項目2", "顯示項目3", "顯示項目4", "顯示項目5"]
    
    var cabinetList: [Int] = []
    var cabinetA_NameList: [String] = ["Panadol", "Needle", "Band_Aid", "Hydrocolloid_Dressing"]
    var cabinetB_NameList: [String] = ["Gauze", "Cotton_Swab", "Ear_Thermometer", "Normal_Saline"]
    
    var currentCabinet: Cabinet = .cabinetA
    var timerA: Timer!
    var timerB: Timer!
    
    enum Cabinet {
        case cabinetA
        case cabinetB
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        listTableView.reloadData()
        setupUI()
        createNoti()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MainVC.test),
                                               name: NSNotification.Name("Test123"),
                                               object: nil)
        
    }
    @objc private func test() {
        print("Hello Test!")
    }
    func createNoti() {
        let content = UNMutableNotificationContent()
        content.title = "警告！"
        
        content.body = "A櫃子櫃子未關閉"
        
        content.badge = 1
        
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    @objc func runAPI(cabinet: String){
        let requset = CabinetBRequset(cabinet: cabinet)
        NetworkManager.shared.requestData(method: .post, path: .cabinet, parameters: requset) { (response: Result<CabinetBResponse, RequestError>) in
            switch response {
            case .success(let success):
                
                self.currentCabinet = (cabinet == "A") ? (.cabinetA) : (.cabinetB)
                
                self.cabinetList = []
                self.cabinetList = [
                    success.Gauze, success.Cotton_Swab, success.Ear_Thermometer, success.Normal_Saline
                ]
            
                DispatchQueue.main.async { [self] in
                    if success.Ear_Thermometer < 50 {
                        print("doakdoad")
                    }
                    self.listTableView.reloadData()
                    self.showButton.setTitle("當前櫃子是\(cabinet)", for: .normal)
                    createNotification()
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
    
    func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(TitleLabelTableViewCell.loadFromNib(), forCellReuseIdentifier: TitleLabelTableViewCell.identifier)
        listTableView.register(DemoTableViewCell.loadFromNib(), forCellReuseIdentifier: DemoTableViewCell.identifier)
        listTableView.layer.cornerRadius = 20
        
        setBackgroundColor()
        
        logOutButton.setTitle("登出", for: .normal)
        
        showButton.showsMenuAsPrimaryAction = true
        showButton.setTitle(NSLocalizedString("櫃子：", comment: ""), for: .normal)
        showButton.tintColor = .white
//
//        let requset = CabinetARequset(cabinet: "A")
//        NetworkManager.shared.requestData(method: .post, path: .cabinet, parameters: requset) { (response: Result<CabinetAResponse, RequestError>) in
//            switch response {
//            case .success(let success):
//                self.currentCabinet = .cabinetA
//
//                self.cabinetList = []
//                self.cabinetList = [
//                    success.Panadol, success.Needle, success.Band_Aid, success.Hydrocolloid_Dressing
//                ]
//
//                DispatchQueue.main.async {
//                    self.listTableView.reloadData()
//                    self.showButton.setTitle("當前櫃子是 A", for: .normal)
//                    NotificationCenter.default.post(name: NSNotification.Name("Test123"), object: nil)
//                }
//            case .failure(let failure):
//                switch failure {
//                case .unknownError:
//                    print("unknownError")
//                case .jsonDecodeFailed:
//                    print("jsonDecodeFailed")
//                case .badGateway:
//                    print("badGateway")
//                case .authorizationError:
//                    print("authorizationError")
//                case .connectionError:
//                    print("connectionError")
//                case .internalError:
//                    print("internalError")
//                case .invalidRequest:
//                    print("invalidRequest")
//                case .invalidResponse:
//                    print("invalidResponse")
//                case .notFound:
//                    print("notFound")
//                case .serverUnavailable:
//                    print("serverUnavailable")
//                case .serverError:
//                    print("serverError")
//                }
//            }
//        }
        showButton.menu = UIMenu(children: [
            UIAction(title: "櫃子 A", handler: { action in
                self.requestCabinetA()
                self.timerB?.invalidate()
            }),
            UIAction(title: "櫃子 B", handler: { action in
                self.requestCabinetB()
                self.timerA?.invalidate()
            })
        ])
    }
    
    
    func createNotification(){
        let content = UNMutableNotificationContent()
        content.title = "請補充！"
        
        content.body = "B櫃 Ear Thermometer 數量不足"
        
        content.badge = 1
        
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

   func requestCabinetA(){
        self.timerA = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { timer in
            let requset = CabinetARequset(cabinet: "A")
            NetworkManager.shared.requestData(method: .post, path: .cabinet, parameters: requset) { (response: Result<CabinetAResponse, RequestError>) in
                switch response {
                case .success(let success):
                    self.currentCabinet = .cabinetA
                    
                    self.cabinetList = []
                    self.cabinetList = [
                        success.Panadol, success.Needle, success.Band_Aid, success.Hydrocolloid_Dressing
                    ]
                    
                    DispatchQueue.main.async {
                        self.listTableView.reloadData()
                        self.showButton.setTitle("當前櫃子是 A", for: .normal)
                        NotificationCenter.default.post(name: NSNotification.Name("Test123"), object: nil)
                        self.listTableView.reloadData()
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
        })
    }
    
   func requestCabinetB(){
        self.timerB = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { timer in
            let requset = CabinetBRequset(cabinet: "B")
            NetworkManager.shared.requestData(method: .post, path: .cabinet, parameters: requset) { (response: Result<CabinetBResponse, RequestError>) in
                switch response {
                case .success(let success):
                    self.currentCabinet = .cabinetB
                    
                    self.cabinetList = []
                    self.cabinetList = [
                        success.Gauze, success.Cotton_Swab, success.Ear_Thermometer, success.Normal_Saline
                    ]
                
                    DispatchQueue.main.async { [self] in
                        if success.Ear_Thermometer < 15 {
                            print("doakdoad")
                            createNotification()
                        }
                        self.listTableView.reloadData()
                        self.showButton.setTitle("當前櫃子是 B", for: .normal)
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
        })
    }
    
    @IBAction func logOutBtnClicked(_ sender: UIButton) {
        let request = LogoutRequest()
        NetworkManager.shared.requestData(method: .post, path:.logout, parameters: request) { (response: Result<LogoutResponse, RequestError>) in
            switch response {
            case .success(_):
                DispatchQueue.main.async {
                    let nextVC = LoginVC()
                    self.pushViewController(nextVC)
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

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cabinetList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = listTableView.dequeueReusableCell(withIdentifier: TitleLabelTableViewCell.identifier, for: indexPath) as! TitleLabelTableViewCell
            return cell
            
        } else {
            let cell = listTableView.dequeueReusableCell(withIdentifier: DemoTableViewCell.identifier, for: indexPath) as! DemoTableViewCell
            
            if currentCabinet == .cabinetA {
                cell.nameLabel.text = cabinetA_NameList[indexPath.row - 1]
            } else {
                cell.nameLabel.text = cabinetB_NameList[indexPath.row - 1]
            }
            cell.numberLabel.text = "\(cabinetList[indexPath.row - 1])"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
