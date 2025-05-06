//
//  Environment.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//

import SwiftUI

@Observable
class SlideIndex: Hashable, Equatable {
    static func == (lhs: SlideIndex, rhs: SlideIndex) -> Bool {
        lhs.slide == rhs.slide && lhs.section == rhs.section
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(slide)
        hasher.combine(section)
    }
    var slide: Int
    var section: Int

    init(slide: Int = 1, section: Int = 1) {
        self.slide = slide
        self.section = section
    }

    func next() {
        section = 1
        slide += 1
    }
}

struct SlideTitleKey: PreferenceKey {
    static let defaultValue: String? = nil

    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue() ?? value
    }
}

extension View {
    func slideTitle(_ title: String) -> some View {
        preference(key: SlideTitleKey.self, value: title)
    }
}

extension View {
    func applyPreviewData(slide: SlideIndex = .init(slide: 1, section: 1)) -> some View {
        modifier(ApplyPreviewDataModifer(slide: slide))
    }
}

struct ApplyPreviewDataModifer: ViewModifier {
    @State var slide = SlideIndex()

    func body(content: Content) -> some View {
        NavigationStack{
            content
                .environment(slide)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.largeTitle.bold())
                .toolbar{
                    Button("Weiter"){
                        slide.section += 1
                    }
                }
        }
    }
}
