// Created by Valerie N. Prinz on 20/11/2024.

import SwiftUI

extension DefaultAvatarView {
    struct Model {
        enum Size {
            case small, big
        }
        
        let size: Size
        
        var imageSize: CGFloat {
            switch size {
            case .small: 20
            case .big: 25
            }
        }
        
        var circleSize: CGFloat {
            switch size {
            case .small: 48
            case .big: 64
            }
        }
    }
}

struct DefaultAvatarView: View {
    let model: Model
    
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: model.imageSize, height: model.imageSize)
                .foregroundStyle(Color.finixGray)
        }
        .frame(width: model.circleSize, height: model.circleSize)
        .background(Color.finixLightGray)
        .clipShape(Circle())
        
    }
}

#Preview {
    let modelSmall = DefaultAvatarView.Model(size: .small)
    let modelBig = DefaultAvatarView.Model(size: .big)
    
    HStack {
        DefaultAvatarView(model: modelSmall)
        DefaultAvatarView(model: modelBig)
    }
}
