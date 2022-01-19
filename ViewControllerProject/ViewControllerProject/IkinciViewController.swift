//
//  IkinciViewController.swift
//  ViewControllerProject
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class IkinciViewController: UIViewController {

    @IBOutlet weak var ikinciLabel: UILabel!
    @IBOutlet weak var bulunanSifreLabel: UILabel!
    
    var verilenSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bulunanSifreLabel.text = verilenSifre
    }
    


}
