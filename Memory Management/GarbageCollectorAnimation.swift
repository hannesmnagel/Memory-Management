//
//  GarbageCollectorAnimation.swift
//  Memory Management
//
//  Created by Hannes Nagel on 4/27/25.
//

import SwiftUI
import HighlightSwift


struct MemoryBlock: Identifiable, Equatable {
    let id = UUID()
    var isAlive: Bool
    var isPromoted: Bool
    var isMarked: Bool = false
}


struct GarbageCollectorAnimation: View {
    @State private var youngGen: [MemoryBlock] = []
    @State private var oldGen: [MemoryBlock] = []
    @State private var timer: Timer?

    let maxYoungBlocks = 10
    let gcInterval = 5.0 // Seconds

    @Namespace var namespace

    var body: some View {
        VStack(spacing: 20) {
            Text("Young Generation (Eden Space)")

            HStack {
                ForEach(youngGen) { block in
                    Rectangle()
                        .fill(block.isMarked ? Color.yellow : (block.isAlive ? (block.isPromoted ? Color.purple : Color.green) : Color.red))
                        .frame(width: 80, height: 80)
                        .matchedGeometryEffect(id: block.id, in: namespace)
                        .animation(.smooth, value: youngGen)
                        .transition(.scale)
                }
            }
            .frame(height: 80)
            
            Text("Old Generation (Tenured Generation)")

            HStack {
                ForEach(oldGen) { block in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                        .matchedGeometryEffect(id: block.id, in: namespace)
                        .animation(.smooth, value: oldGen)
                        .transition(.scale)
                }
            }
            .frame(height: 80)


            Text("(+ Metaspace und Survivor Space)")
        }
        .animation(.smooth, value: oldGen)
        .padding()
        .onAppear {
            startSimulation()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    func startSimulation() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation{
                simulateMemoryUsage()
            }
        }
    }

    func simulateMemoryUsage() {
        // Add new block
        if youngGen.count < maxYoungBlocks {
            youngGen.append(MemoryBlock(isAlive: true, isPromoted: false))
            for index in youngGen.indices {
                if Bool.random() && !youngGen[index].isMarked && youngGen[index].isAlive && Double.random(in: 0..<1) > 0.7 {
                    youngGen[index].isAlive = false
                }
            }
        } else {
            runGarbageCollection()
        }
    }

    func runGarbageCollection() {
        // Phase 1: Mark
        for index in youngGen.indices {
            if youngGen[index].isAlive {
                youngGen[index].isMarked = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Phase 2: Promote and Sweep
            for index in youngGen.indices {
                if youngGen[index].isAlive {
                    var promoted = youngGen[index]
                    promoted.isPromoted = true
                    oldGen.append(promoted)
                }
            }

            youngGen.removeAll()

            // Simulate aging of old generation
            if oldGen.count > 15 {
                oldGen.removeFirst(5)
            }
        }
    }
}


#Preview {
    GarbageCollectorAnimation()
        .applyPreviewData()
}
