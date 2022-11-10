//
//  Text1VC.swift
//  LFBaseProject
//
//  Created by admin on 2022/10/17.
//

import UIKit

class Text1VC: UIViewController {
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test3()
    }
    
    func test(){
        let str = "@今宵杯中 映着明月 物华天宝人杰地灵"
        if str.hasPrefix("@") && str.contains(" ") {
            let arr = str.components(separatedBy: " ")
            let attrStr = NSMutableAttributedString.init(string: str)
            attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.orange, range:NSRange.init(location:0, length:arr.first!.count))
            label1.attributedText = attrStr
        }
    }
    func test2(){
        let title = "已有\(0)人打赏合计\("0")元"
        let str2:String =  "\("0")"
//        let range = title.range(of: str2) //从头查询
        let range = title.range(of: str2,options: .backwards ) // 从尾查询
        let converrange = NSRange(range!,in: title)
        let attrStr = NSMutableAttributedString.init(string: title)
        attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.orange, range:converrange)
        label1.attributedText = attrStr
    }
    func test3(){
        let str: String = "我最爱北京天安门！"
        let range: Range = str.range(of: "北京")!
        let location: Int = str.distance(from: str.startIndex,
                                         to: range.lowerBound)
        /* location = 3 */
        
        let keyLength: Int = str.distance(from: range.lowerBound,
                                          to: range.upperBound)
        // let key = "北京"; let keyLength = key.count;  //count = 2
        /* keyLength = 2 */
        
        print("location = \(location), length = \(keyLength)")
        /* location = 3, length = 2 */
        
        // SubString
        let frontStr: Substring = str[str.startIndex ..< range.lowerBound]
        print("frontSubStr = \(frontStr)")
        /* 我最爱 */
        
        let frontStr2: Substring = str[str.startIndex ..< range.upperBound]
        print("frontSubStr2 = \(frontStr2)")
        /* 我最爱北 */
        

        // MARK: 下面这几个方法，可以自己试一下
        /*
         func index(after: String.Index)
         Returns the position immediately after the given index.
         
         func formIndex(after: inout String.Index)
         Replaces the given index with its successor.
         
         
         func index(before: String.Index)
         Returns the position immediately before the given index.
         
         func formIndex(before: inout String.Index)
         Replaces the given index with its predecessor.
         */
        let frontTest_before: Substring = str[str.startIndex ..< str.index(before: range.lowerBound)]
        let frontTest_after: Substring = str[str.startIndex ..< str.index(after: range.lowerBound)]
        print("before = \(frontTest_before), after = \(frontTest_after)")
        /* before = 我最, after = 我最爱北 */
    }
     
//    func indexOf(key:String,TempString)->Int{
//
//    }
}
///  颜色替换
extension Text1VC{
    func hander1(){
        let str = "今宵杯中映着明月 物华天宝人杰地灵"
        let attrStr = NSMutableAttributedString.init(string: str)
        attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.orange, range:NSRange.init(location:0, length: 8))
        attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.red, range:NSRange.init(location:9, length: 8))
        self.label1.attributedText = attrStr
    }
}
