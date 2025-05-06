//
//  DerMüllmann.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//


import SwiftUI
import HighlightSwift

struct Die🗑️Abfuhr: View {
    @Environment(SlideIndex.self) var slide
    @State private var x = 0
    @State private var y = 0

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                VStack {
                    Text("In Java räumt die")
                    Text("Müllabfuhr")
                        .font(.system(size: 80))
                    Text("auf")
                }
            case 2:
                VStack {
                    CodeText("""
                    void foo() {
                        while (true) {
                            String name = new String("Bob");
                            //...
                        }
                    }
                    """)
                }
                .navigationTitle("Garbage Collection")
            case 3:
                VStack {
                    Grid {
                        ForEach(0..<5) { x in
                            GridRow {
                                ForEach(0..<5) { y in
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(
                                            (y < self.y || (y == self.y && x <= self.x))
                                            ? Color.red.gradient
                                            : Color.green.gradient
                                        )
                                }
                            }
                        }
                    }
                    .animation(.smooth, value: x)
                    .animation(.smooth, value: y)

                    HStack {
                        Button("Execute some code") {
                            Task {
                                for col in 0..<5 {
                                    for row in 0..<5 {
                                        x = row
                                        y = col
                                        try? await Task.sleep(for: .milliseconds(70))
                                    }
                                }
                            }
                        }
                        Button("Collect") {
                            Task {
                                for col in (0..<5).reversed() {
                                    for row in (0..<5).reversed() {
                                        x = row
                                        y = col
                                        try? await Task.sleep(for: .milliseconds(10))
                                    }
                                }
                            }
                        }
                    }
                }
            case 4:
                Text("Mark and sweep (and compact)")
            case 5:
                CodeText("""
                class Box { byte[] data = new byte[1024 * 1024]; }
                Box b = new Box();
                b = null;
                """)
            case 6:
                Text("Generational GC")
                Text("Junge Objekt sterben schnell")
            case 7:
                GarbageCollectorAnimation()
            case 8:
                Text("Garbage Collection ist bequem. Kann aber zu Problemen führen.")
            case 9:
                Text("nicht deterministische Pausezeiten")
            default:
                TransitionSlide()
            }
        }
        .slideTitle("Garbage Collection in Java")
    }
}


#Preview {
    Die🗑️Abfuhr()
        .applyPreviewData()
}
