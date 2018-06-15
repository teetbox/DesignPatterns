//
//  Decorator.swift
//  Decorator
//
//  Created by Tong Tian on 2018/6/12.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

protocol MacBook {
    var cost: Double { get }
    var description: String { get }
}

class MacBookAir: MacBook {
    var cost: Double {
        return 999
    }
    
    var description: String {
        return "MacBook Air"
    }
}

class MacBookPro: MacBook {
    var cost: Double {
        return 1599
    }
    
    var description: String {
        return "MacBook Pro"
    }
}

class MacBookRegular: MacBook {
    var cost: Double {
        return 1099
    }
    
    var description: String {
        return "MacBook"
    }
}

class MacBookDecorator: MacBook{
    
    let macBook: MacBook
    
    init(macBook: MacBook) {
        self.macBook = macBook
    }
    
    var cost: Double {
        return macBook.cost
    }
    
    var description: String {
        return macBook.description
    }
}

final class ProcessorUpgrade: MacBookDecorator {
    
    override var cost: Double {
        return macBook.cost + 499
    }
    
    override var description: String {
        return macBook.description + ", i7 Processor"
    }
    
}

final class SSDUpgrade: MacBookDecorator {
    
    override var cost: Double {
        return macBook.cost + 299
    }
    
    override var description: String {
        return macBook.description + ", 512gb SSD"
    }
    
}

final class TouchBarUpgrade: MacBookDecorator {
    
    override var cost: Double {
        return macBook.cost + 199
    }
    
    override var description: String {
        return macBook.description + ", w/ TouchBar"
    }
    
}

















