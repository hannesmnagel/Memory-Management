//
//  ManuellOderAutomatisch.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/26/25.
//


import SwiftUI
import HighlightSwift

struct ManuellOderAutomatisch: View {
    @Environment(SlideIndex.self) var slide

    var body: some View {
        Group {
            switch slide.section {
            case 1:
                VSView(title: "Memory Management", leading: "Manuell", trailing: "Automatisch")
            case 2:
                Text("Manuell in C:")
                Spacer()
                CodeText("""
                int main() {
                    int *ptr = (int *)malloc(sizeof(int));
                    if (ptr == NULL) {
                        printf("Memory allocation failed\\n");
                        return 1;
                    }
                
                    *ptr = 42;
                    printf("Value: %d\\n", *ptr);
                
                    free(ptr); // Free the allocated memory
                    return 0;
                }
                """)
                Spacer()
            case 3:
                Text("Automatisch in Java:")
                Spacer()
                CodeText("""
                public class Main {
                    public static void main(String[] args) {
                        String name = new String("Hallo");
                        System.out.println("Value: " + name);
                        // Speicher wird automatisch freigegeben, kurz nachdem auf 'name' nicht mehr zugegriffen werden kann
                    }
                }
                """)
                Spacer()
            case 4:
                Text("Automatisch in Swift:")
                Spacer()
                CodeText("""
                func main() {
                    let object = Object()
                    print("Value: \\(object)")
                    //Swift gibt den Speicher auf der Stelle frei, sobald dieser nicht mehr benötigt wird
                }
                
                main()
                """)
                Spacer()
            default:
                TransitionSlide()
            }
        }
        .slideTitle("Manuell vs Automatisch")
    }
}

#Preview {
    ManuellOderAutomatisch()
}
