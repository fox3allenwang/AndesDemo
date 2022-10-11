////
////  APITimer.swift
////  AndesDemo
////
////  Created by Wang Allen on 2022/10/11.
////
//
//import Foundation
//import UIKit
//func TimerAPI() {
//    var timer: Timer!
//    @objc func requestCabinetA(){
//            timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { timer in
//            let requset = CabinetARequset(cabinet: "A")
//            NetworkManager.shared.requestData(method: .post, path: .cabinet, parameters: requset) { (response: Result<CabinetAResponse, RequestError>) in
//                switch response {
//                case .success(let success):
//                    currentCabinet = .cabinetA
//
//                cabinetList = []
//                cabinetList = [
//                        success.Panadol, success.Needle, success.Band_Aid, success.Hydrocolloid_Dressing
//                    ]
//
//                    DispatchQueue.main.async {
//                        self.listTableView.reloadData()
//                        self.showButton.setTitle("當前櫃子是 A", for: .normal)
//                        NotificationCenter.default.post(name: NSNotification.Name("Test123"), object: nil)
//                        self.listTableView.reloadData()
//                    }
//                case .failure(let failure):
//                    switch failure {
//                    case .unknownError:
//                        print("unknownError")
//                    case .jsonDecodeFailed:
//                        print("jsonDecodeFailed")
//                    case .badGateway:
//                        print("badGateway")
//                    case .authorizationError:
//                        print("authorizationError")
//                    case .connectionError:
//                        print("connectionError")
//                    case .internalError:
//                        print("internalError")
//                    case .invalidRequest:
//                        print("invalidRequest")
//                    case .invalidResponse:
//                        print("invalidResponse")
//                    case .notFound:
//                        print("notFound")
//                    case .serverUnavailable:
//                        print("serverUnavailable")
//                    case .serverError:
//                        print("serverError")
//                    }
//                }
//            }
//        })
//    }
//}
//
