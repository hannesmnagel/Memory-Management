//
//  WarumBrauchtManMEMoryManagement.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/24/25.
//


import SwiftUI
import HighlightSwift

struct WarumBrauchtManMemoryManagement: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                Text("Speicher reservieren")
                Spacer()
                CodeText("int i = 10;")
                Spacer()
            case 2:
                Text("Speicher reservieren")
                Spacer()
                CodeText("Objekt o = new Objekt();")
                Spacer()
            case 3:
                Text("Speicher freigeben")
                Spacer()
                CodeText("""
                    void foo() {
                        int i = 10;
                    }
                    //...
                    foo()
                    //Was ist mit i?
                    """)
                Spacer()
            case 4:
                Text("Im Extremfall")
                Spacer()
                CodeText("""
                    void foo() {
                        while(true) {
                            int i = 10;
                            //i wird für irgendwas benutzt...
                        }
                    }
                    """)
                Spacer()
            case 5:
                CodeText("""
                    public class Leak {
                        static List<byte[]> leakyList = new ArrayList<>();
                    
                        public static void main(String[] args) {
                            while (true) {
                                leakyList.add(new byte[1024 * 1024]);
                            }
                        }
                    }
                    """)
            default:
                TransitionSlide()
            }
        }
        .slideTitle("Warum Braucht man Memory Management?")
    }
}


#Preview {
    WarumBrauchtManMemoryManagement()
        .applyPreviewData()
}
