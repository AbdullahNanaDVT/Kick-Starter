//
//  UIViewController+Extension.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/07.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String) {
        let alert = UIAlertController(title: alertTitle,
                                      message: alertMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
