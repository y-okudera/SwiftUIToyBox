//
//  TopView.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 13/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import SwiftUI

struct TopView: View {

    @ObservedObject var viewModel: TopViewModel

    var body: some View {
        NavigationView {

            GeometryReader { geometry in
                ZStack {
                    destinationList
                    StatefulNavigationLinkBuilder.build(
                        destination: viewModel.output.navigationTrigger.view,
                        isActive: viewModel.output.navigationTrigger.trigger
                    )
                }
                .navigationBarImage(uiImage: Assets.topLogo.image, geometryProxy: geometry)
            }
        }
        // ナビゲーションのルートに設定する
        .environment(\.rootPresentationMode, viewModel.output.navigationTrigger.trigger)
    }
}

extension TopView {
    var destinationList: some View {
        Form {
            ForEach(viewModel.output.viewData.titles.indices) { index in
                Button(action: {
                    viewModel.input.tappedAtIndex.send(index)
                }, label: {
                    Text(viewModel.output.viewData.titles[index])
                        .foregroundColor(Color(UIColor.label))
                })
            }
        }
    }
}

// MARK: - PreviewProvider
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopBuilder.build()
    }
}
