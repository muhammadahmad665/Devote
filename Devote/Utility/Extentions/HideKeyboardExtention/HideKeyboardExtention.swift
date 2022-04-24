//
//  HideKeyboardExtention.swift
//  Devote
//
//  Created by Ahmed on 25/04/2022.
//

import SwiftUI
#if canImport(UIKit)
extension View{
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
