//
//  UpdateStore.swift
//  LibraryTest
//
//  Created by Catalina Beta on 15/07/2019.
//  Copyright © 2019 Catalina Beta. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: BindableObject {
    var didChange = PassthroughSubject<Void, Never>() // !?!??!?!?
    
    var updates: [Update] {
        didSet {
            didChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
