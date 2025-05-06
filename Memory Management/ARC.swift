//
//  ARC.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/26/25.
//


import SwiftUI
import HighlightSwift

struct ARC: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                (Text("A") + Text("utomatic ").font(.title) + Text("R") + Text("eference ").font(.title) + Text("C") + Text("ounting").font(.title))
                    .font(.system(size: 150))
            case 2:
                CodeText("""
                do {
                    var i = Object() //i ist einmal referenziert
                }
                //scope wird verlassen, i wird released
                """)
            case 3:
                CodeText("""
                var a = Optional(Objekt())      //1. Referenz
                var b = a                       //2. Referenz
                
                a = nil                         //1. Löschung
                b = nil                         //2. Löschung
                """)
            case 4:
                Text("Problem: Zyklische Referenzen")
                Spacer()
                CodeText("""
                class A { var b: B? }
                class B { var a: A? }
                
                let a = A()
                a.b = B()
                b.a = a
                """)
                Spacer()
            case 5:
                Text("Lösung: weak und unowned")
                Spacer()
                CodeText("""
                class A { var b: B? }
                class B { weak var a: A? }
                
                let a = A()
                a.b = B()
                b.a = a
                """)
                Spacer()
            default:
                TransitionSlide()
            }
        }
        .slideTitle("Automatic Reference Counting")
    }
}

#Preview {
    ARC()
        .applyPreviewData(slide: .init(section: 3))
}
