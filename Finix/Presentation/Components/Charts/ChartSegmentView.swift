// Created by Valerie N. Prinz on 05/11/2024.

import SwiftUI

extension ChartSegmentView {
    struct Model {
        let segments: [SegmentItem]
        
        struct SegmentItem: Identifiable {
            let id: UUID
            let percentage: Double
            let color: Color
            
            init(
                id: UUID = UUID(),
                percentage: Double,
                color: Color
            ) {
                self.id = id
                self.percentage = percentage
                self.color = color
            }
        }
    }
}

struct ChartSegmentView: View {
    let model: Model
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                let totalWidth = geometry.size.width
     
                Rectangle()
                    .fill(Color.borderStroke)
                    .clipShape(.rect(cornerRadius: 50))
                
                HStack(spacing: 0) {
                    ForEach(model.segments) { segment in
                        let isLast = segment.id == model.segments.last?.id
                        Rectangle()
                            .fill(segment.color)
                            .frame(width: segment.percentage * totalWidth)
                            .clipShape(isLast ? .rect(
                                bottomTrailingRadius: 50,
                                topTrailingRadius: 50) : .rect())
                    }
                }
                .frame(maxWidth: totalWidth, alignment: .leading)
                .background(Color.borderStroke)
                .clipShape(.rect(cornerRadius: 50))
            }
            .frame(height: 16)
        }
    }
}

#Preview {
    let model: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.2, color: Color.lavender
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.1, color: Color.turquise
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.26, color: Color.lemon
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.24, color: Color.pink
        )
    ])
    
    VStack {
        ChartSegmentView(model: model)
            .padding()
    }
}
