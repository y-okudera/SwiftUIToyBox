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
            VStack {
                imageCarouselView(uiimages: [
                    Assets.fox.image,
                    Assets.iceland.image,
                    Assets.tree.image,
                ])
                Spacer()
            }
        }
        .navigationBarTitle(Text("カルーセル"))
    }
}

extension CarouselView {
    func imageCarouselView(uiimages: [UIImage]) -> some View {
        GeometryReader { geometry in
            ImageCarouselView(numberOfImages: uiimages.count) {
                ForEach(uiimages, id: \.self) { uiimage in
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
    }
}

// MARK: - PreviewProvider
struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBuilder.build()
    }
}
