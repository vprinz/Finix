// Created by Valerie N. Prinz on 20/11/2024.

import SwiftUI

extension AvatarView {
    struct Model {
        enum Size {
            case small, big
        }
        
        let imageName: String
        let size: Size
        
        var imageSize: CGFloat {
            switch size {
            case .small: 48
            case .big: 64
            }
        }
    }
}

struct AvatarView: View {
    let model: Model
    
    var body: some View {
        Image(model.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: model.imageSize, height: model.imageSize)
    }
}

#Preview {
    let modelSmall = AvatarView.Model(imageName: "angelica", size: .small)
    let modelBig = AvatarView.Model(imageName: "angelica", size: .big)
    
    HStack {
        AvatarView(model: modelSmall)
        AvatarView(model: modelBig)
    }
}
