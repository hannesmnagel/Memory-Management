//
//  Einschub.swift
//  Memory Management
//
//  Created by Hannes Nagel on 5/6/25.
//

import SwiftUI
import HighlightSwift

struct Einschub: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                CodeText("""
                    String a = new String("1")
                    String b = new String("1")
                    
                    if (a != b) { 
                        if (a.equals(b)) {
                            
                        }
                    }
                    """)
            default:
                TransitionSlide()
            }
        }
        .slideTitle("Einschub")
    }
}
