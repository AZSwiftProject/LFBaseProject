//
//  StringExtession.swift
//  LFBaseProject
//
//  Created by admin on 2022/10/24.
//

import Foundation
extension String{
    func indexOf(key:String)->Int{
        if !self.contains(key) {
            return -1
        }
        
        guard let range:Range<String.Index> = self.range(of: key) else {
            return -1
        }
//        let index = range.lowerBound.encodedOffset
        let index = self.distance(from: self.startIndex, to:range.lowerBound)
        return index
    }
}



