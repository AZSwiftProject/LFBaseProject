//
//  SwiftViewController.swift
//  LFBaseProject
//
//  Created by admin on 2022/10/1.
//

import UIKit
import JJCarouselView
import Kingfisher
class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

                view.backgroundColor = .white
                let carouselView = JJWebImageCarouselView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 200))
                carouselView.config.display = { cell, object in
                    cell.clipsToBounds = true
                    cell.contentMode = .scaleAspectFill
                    cell.kf.setImage(with: object,placeholder:UIImage(named: "code_scanner_photo.png") )
                }
                carouselView.pageView = JJCarouselDotPageView()
                view.addSubview(carouselView)
                carouselView.datas = [URL.init(string: "http://r0k.us/graphics/kodak/kodak/kodim01.png")!]

    }

}
