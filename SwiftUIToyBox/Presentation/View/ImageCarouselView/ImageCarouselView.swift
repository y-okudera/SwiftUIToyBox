//
//  ImageCarouselView.swift
//  SwiftUIToyBox
//
//  Created by okudera on 2021/02/15.
//

import SwiftUI
import Combine

struct ImageCarouselView<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content

    @State private var currentIndex: Int = 0
    private let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()

    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                HStack(spacing: 0) {
                    content
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                .offset(x: CGFloat(currentIndex) * -geometry.size.width, y: 0)
                .animation(.spring())
                .onReceive(timer) { _ in
                    currentIndex = (currentIndex + 1) % (numberOfImages == 0 ? 1 : numberOfImages)
                }
                HStack(spacing: 3) {
                    ForEach(0..<numberOfImages, id: \.self) { index in
                        Circle()
                            .frame(width: index == currentIndex ? 10 : 8, height: index == currentIndex ? 10 : 8)
                            .foregroundColor(index == currentIndex ? Color.blue : .white)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            .padding(.bottom, 8)
                            .animation(.spring())
                    }
                }
            }
        }
    }
}
