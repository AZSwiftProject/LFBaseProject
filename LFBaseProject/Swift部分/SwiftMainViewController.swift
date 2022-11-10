//
//  SwiftMainViewController.swift
//  LFBaseProject
//
//  Created by admin on 2022/10/8.
//

import UIKit
import Toaster
class SwiftMainViewController: UIViewController {

    @IBAction func handerBtn(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "浮动按钮":
            do {
                navigationController?.pushViewController(SwiftFLoatBtnVC(nibName: "SwiftFLoatBtnVC", bundle: nil), animated: true)
            }
            break
        case "富文本":
            do {
                navigationController?.pushViewController(TextVC(nibName: "TextVC", bundle: nil), animated: true)
            }
            break
        case "弹窗":
            do {
                Toast(text: "Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!").show()
            }
            break
        case .none: break
        case .some(_): break
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
