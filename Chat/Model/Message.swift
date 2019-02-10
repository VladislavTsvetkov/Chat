//
//  Message.swift
//  Chat
//
//  Created by Владислав Цветков on 10/02/2019.
//  Copyright © 2019 Владислав Цветков. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
