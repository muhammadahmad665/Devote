//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Ahmed on 25/04/2022.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
