//
//  ContentView.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//

import SwiftUI
import HighlightSwift

struct ContentView: View {
    @State private var currentSlide = SlideIndex(slide: 1, section: 1)
    @State private var slideTitle = ""

    var body: some View {
        NavigationStack {
            switch currentSlide.slide {
            case 1:
                IntroView()
            case 2:
                WarumBrauchtManMemoryManagement()
            case 3:
                ManuellOderAutomatisch()
            case 4:
                Einschub()
            case 5:
                Die🗑️Abfuhr()
            case 6:
                ARC()
            case 7:
                GCOderARC()
            case 8:
                MemoryLeak()
            case 9:
                Text("Danke für eure Aufmerksamkeit!")
                    .slideTitle("Ende")
            default:
                Text("""
                    https://clang.llvm.org/docs/AutomaticReferenceCounting.html
                    https://www.oracle.com/technetwork/tutorials/tutorials-1873457.html
                    https://psychminds.org/swift_language_guide/docs.swift.org/swift-book/languageguide/automaticreferencecounting
                    https://toxigon.com/swift-memory-management
                    """)
            }
        }
        .padding()
        .font(.system(size: 50))
        .toolbar{
            ToolbarItem(placement: .status){
                (Text("Folie ") + Text("\(currentSlide.slide).\(currentSlide.section)") + Text(" - \(slideTitle)")
                    .monospacedDigit())
                .contentTransition(.numericText())
            }
            ToolbarItem(placement: .primaryAction) {
                Button("Weiter"){
                    currentSlide.section += 1
                }
                .keyboardShortcut(.defaultAction)
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Zurück"){
                    if currentSlide.section == 1 {
                        if currentSlide.slide > 1 {
                            currentSlide.slide -= 1
                        }
                    } else {
                        currentSlide.section -= 1
                    }
                }
                .keyboardShortcut(.cancelAction)
            }
        }
        .navigationTitle("Memory Management")
        .environment(currentSlide)
        .animation(.smooth, value: currentSlide.section)
        .animation(.smooth, value: currentSlide.slide)
        .onPreferenceChange(SlideTitleKey.self) { title in
            self.slideTitle = title ?? ""
        }
    }
}


#Preview {
    ContentView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
