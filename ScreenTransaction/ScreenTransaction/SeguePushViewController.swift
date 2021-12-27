//
//  SeguePushViewController.swift
//  ScreenTransaction
//
//  Created by gyeongtae on 2021/12/27.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
