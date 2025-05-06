//
//  MemoryLeak.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/26/25.
//


import SwiftUI
import HighlightSwift

struct MemoryLeak: View {
    @Environment(SlideIndex.self) var slide
    @State private var task : Task<Void, Never>?

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                CodeText("""
                    var i = ["hello"]
                    
                    while !Task.isCancelled {
                        i.append("hello")
                        try? await Task.sleep(nanoseconds: 10)
                    }
                    """)
                HStack {
                    Button("Execute"){
                        let path = "/System/Applications/Utilities/Activity Monitor.app"
                        NSWorkspace.shared.open(URL(fileURLWithPath: path))

                        task = Task.detached {
                            var i = ["hello"]

                            while !Task.isCancelled {
                                i.append("hello")
                                try? await Task.sleep(nanoseconds: 10)
                            }
                        }
                    }
                    if let task {
                        Button("Stop memory \"leak\"") {
                            task.cancel()
                            self.task = nil
                        }
                    }
                }

            default:
                TransitionSlide()
            }
        }
        .slideTitle("Memory Leak Simulation")
    }
}
