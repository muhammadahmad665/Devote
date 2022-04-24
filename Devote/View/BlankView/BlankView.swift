//
//  BlankView.swift
//  Devote
//
//  Created by Ahmed on 25/04/2022.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth:  0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .opacity(0.5)
        .ignoresSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
