//
//  CarouselView.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 15/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import SwiftUI

struct CarouselView: View {

    @ObservedObject var viewModel: CarouselViewModel

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("ラベル")
                Button("ボタン", action: {
                    print("ボタンタップ")
                })
            }
            .navigationBarTitle(Text("タイトル"))
        }
    }
}

// MARK: - PreviewProvider
struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBuilder.build()
    }
}
