//
//  ListRowItemView.swift
//  Devote
//
//  Created by Ahmed on 25/04/2022.
//

import SwiftUI

struct ListRowItemView: View {
//MARK: Properties
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item
    //MARK:
    //MARK: Body
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.completion)
        }//: Toggle
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges{
                try? self.viewContext.save()
            }
        })
    }
    
}
