//
//  ViewController.swift
//  MenuProfile
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModal = MenuProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
        self.viewModal.fetch(.mock)
    }


}

