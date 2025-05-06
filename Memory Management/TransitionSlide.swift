//
//  TransitionSlide.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//


import SwiftUI
import HighlightSwift

struct TransitionSlide: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        VStack{}
            .task {
                withAnimation {
                    slide.next()
                }
            }
            .slideTitle("...")
    }
}
