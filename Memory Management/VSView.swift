//
//  VSView.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//


import SwiftUI
import HighlightSwift

struct VSView: View {
    let title: String
    let leading: String
    let trailing: String

    var body: some View {
        VStack {
            Text(title)
                .padding(.top)
            HStack {
                Text(leading)
                    .monospaced()
                    .frame(maxWidth: .infinity, alignment: .trailing)

                ZStack {
                    Image(systemName: "bolt.fill")
                        .imageScale(.large)
                        .font(.system(size: 200))
                    Text("VS")
                        .font(.largeTitle)
                        .colorInvert()
                }

                Text(trailing)
                    .monospaced()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.system(size: 80))
        }
        .minimumScaleFactor(0.4)
    }
}
