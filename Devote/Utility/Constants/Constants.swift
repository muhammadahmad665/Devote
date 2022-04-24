//
//  Constants.swift
//  Devote
//
//  Created by Ahmed on 25/04/2022.
//

import Foundation
import SwiftUI

//MARK: Formatter

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//MARK: UI
var backgroundGradient: LinearGradient{
    return LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
//MARK: UX
