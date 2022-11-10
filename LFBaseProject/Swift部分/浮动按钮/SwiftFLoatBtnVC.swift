//
//  SwiftFLoatBtnVC.swift
//  LFBaseProject
//
//  Created by admin on 2022/10/8.
//

import UIKit

class SwiftFLoatBtnVC: UIViewController {

    @IBAction func handerBtn(_ sender: UIButton) {
        view.addSubview(HoverView.init())
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
