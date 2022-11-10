//
//  TextVC.swift
//  LFBaseProject
//
//  Created by admin on 2022/10/17.
//

import UIKit

class TextVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func handerBtn(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "富文本1":
            do {
                navigationController?.pushViewController(Text1VC(nibName: "Text1VC", bundle: nil), animated: true)
            }
            break
        case "富文本2":
            do {
                navigationController?.pushViewController(TextVC(nibName: "TextVC", bundle: nil), animated: true)
            }
            break
        case .none: break
        case .some(_): break
            
        }
        
        
    }
}
