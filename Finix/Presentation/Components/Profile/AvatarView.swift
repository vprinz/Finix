// Created by Valerie N. Prinz on 20/11/2024.

import SwiftUI

extension AvatarView {
    struct Model {
        enum Size {
            case small, big
        }
        
        let imageName: String?
        let size: Size
        
        var imageSize: CGFloat {
            switch size {
            case .small: 48
            case .big: 64
            }
        }
        
        init(
            imageName: String? = nil,
            size: Size
        ) {
            self.imageName = imageName
            self.size = size
        }
    }
}

struct AvatarView: View {
    let model: Model
    
    var body: some View {
        Image(model.imageName ?? "default-avatar")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: model.imageSize, height: model.imageSize)
    }
}

#Preview {
    let modelSmallDefault = AvatarView.Model(size: .small)
    let modelBigDefault = AvatarView.Model(size: .big)
    
    let modelSmall = AvatarView.Model(imageName: "angelica", size: .small)
    let modelBig = AvatarView.Model(imageName: "angelica", size: .big)
    
    VStack {
        HStack {
            AvatarView(model: modelSmallDefault)
            AvatarView(model: modelBigDefault)
        }
        HStack {
            AvatarView(model: modelSmall)
            AvatarView(model: modelBig)
        }
    }
}
