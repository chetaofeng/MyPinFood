//
//  Resturant.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/25.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import Foundation

//此处可以使用结构体和类两种方式，推荐用结构体

struct ResutrantStruct1 {
    var name:String
    var type:String
    var location:String
    var image:String
    var isHasVisited:Bool
    var rating:String = ""
}

class ResutrantClass {
    var name:String
    var type:String
    var location:String
    var image:String
    var isHasVisited:Bool
    var rating:String = ""
    
    init(name:String,type:String,location:String,image:String,isHasVisited:Bool,rating:String){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isHasVisited = isHasVisited
        self.rating = rating
    }
}