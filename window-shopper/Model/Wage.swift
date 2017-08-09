//
//  Wage.swift
//  window-shopper
//
//  Created by Benjamin Budian on 8/9/17.
//  Copyright © 2017 ThisGuyMagic. All rights reserved.
//

import Foundation

class Wage{
    // class func == static function
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int{
        return Int(ceil(price / wage))
    }
}
