//
//  GCOderARC.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/26/25.
//


import SwiftUI
import HighlightSwift

struct GCOderARC: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                VSView(title: "Memory Management", leading: "ARC", trailing: "GC ")
            case 2:
                Grid{
                    GridRow {
                        Text("Eigenschaft")
                        Text("GC")
                        Text("ARC")
                    }
                    Divider()
                    GridRow {
                        Text("Speicherfreigabe")
                        Text("Hintergrundprozess")
                        Text("Sofort bei 0 Referenzen")
                    }
                    Divider()
                    GridRow {
                        Text("Entwicklerarbeit")
                        Text("Minimal")
                        Text("Aufpassen bei Zyklen")
                    }
                    Divider()
                    GridRow {
                        Text("Laufzeitpausen")
                        Text("Möglich")
                        Text("Keine")
                    }
                }
            case 3:
                Text("Wann was und was wo?")
                Spacer()
                Text("GC bei großen, komplexen Programmen")
                Text("ARC bei Echtzeitanwendungen und performance kritischen Anwendungen")
                Spacer()
            default:
                TransitionSlide()
            }
        }
        .slideTitle("Vergleich ARC und GC")
    }
}
