//
//  SwiftTool_Array.swift
//  LFBaseProject
//
//  Created by admin on 2022/9/28.
//

import Foundation
import HandyJSON

//MARK - 数组模型去重
protocol TypeVerifyProtocol {
    
    associatedtype VerifyType: Hashable
    var verifyValue: VerifyType { get }
}
extension Array where Element: TypeVerifyProtocol {
    
    func removeDuplicates() -> [Element] {
        
        var set = Set<Element.VerifyType>()
        
        return filter({ set.update(with: $0.verifyValue) == nil })
    }
}




class Person:HandyJSON{
    
    var name: String = ""
    
    var age: Int = 0
    
    required init() {}
}

//如果以年龄作为唯一标识
extension Person: TypeVerifyProtocol {
        
    typealias VerifyType = Int
    
    var verifyValue: Int { age }
}


func foo() {
    var arr = [Person]()
    for i in 0..<5 {
        var person = Person()
        person.name = "我\(i)"
        person.age = i
        arr.append(person)
    }
    
    //插入重复数据
    for i in 1..<3 {
        var person = Person()
        person.name = "我2"
        person.age = 2
        arr.insert(person, at: i)
    }
    //执行去重
    print(arr.removeDuplicates())
}
