//
//  IntroView.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//


import SwiftUI
import HighlightSwift

struct IntroView: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        switch slide.section {
        case 1:
            VSView(title: "Memory Management", leading: "ARC", trailing: "GC ")
                .slideTitle("Hello World!")
                .transition(.slide)
        default:
            TransitionSlide()
        }
    }
}



