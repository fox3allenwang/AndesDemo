//
//  BaseViewController.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    public func setNavigationBarStyle() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 68/255, green: 177/255, blue: 188/255, alpha: 1
            )
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9953911901, green: 0.9881951213, blue: 1, alpha: 1)
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.9953911901, green: 0.9881951213, blue: 1, alpha: 1)]
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 68/255, green: 177/255, blue: 188/255, alpha: 1
            )
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9953911901, green: 0.9881951213, blue: 1, alpha: 1)
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.9953911901, green: 0.9881951213, blue: 1, alpha: 1)]
        }
    }
    
    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        if let navigationController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController as? UINavigationController {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public func setBackgroundColor() {
        self.view.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1)
    }
    
}
