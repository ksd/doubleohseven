//
//  DoubleOhSevenViewController.swift
//  doubleohseven
//
//  Created by ksd on 03/02/2021.
//

import UIKit

class DoubleOhSevenViewController: UIViewController {
    
    @IBOutlet weak var bondImageView: UIImageView!
    
    var selectedBondName: Agent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedBondName = selectedBondName {
            bondImageView.image = UIImage(named: selectedBondName.imageName)
        }
    }
}
