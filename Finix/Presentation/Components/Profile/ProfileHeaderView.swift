// Created by Valerie N. Prinz on 20/11/2024.

import SwiftUI

extension ProfileHeaderView {
    struct Model {
        enum Size {
            case small, big
        }
        
        let size: Size
        let name: String
        let imageName: String?
        
        @ViewBuilder
        var avatar: some View {
            AvatarView(
                model: .init(
                    imageName: imageName, size: avatarSize
                )
            )
        }
        
        private var avatarSize: AvatarView.Model.Size {
            switch size {
            case .small: .small
            case .big: .big
            }
        }
        
        init(
            size: Size,
            name: String,
            imageName: String? = nil
        ) {
            self.size = size
            self.name = name
            self.imageName = imageName
        }
    }
}

struct ProfileHeaderView: View {
    let model: Model
    
    var body: some View {
        HStack(spacing: 16) {
            model.avatar
            VStack(alignment: .leading, spacing: 4) {
                Text("greetingText, \(model.name)")
                    .font(.titleMedium)
                    .foregroundStyle(Color.textPrimary)
                if model.size == .big {
                    Text("tapToEditProfileText")
                        .font(.smallTextRegular)
                        .foregroundStyle(Color.textTertiary)
                }
            }
        }
    }
}

#Preview {
    let avatarSmallModel = ProfileHeaderView.Model(
        size: .small,
        name: "Angelica",
        imageName: "angelica"
    )
    
    let avatarBigModel = ProfileHeaderView.Model(
        size: .big,
        name: "Angelica",
        imageName: "angelica"
    )
    
    let defaultAvatarSmallModel = ProfileHeaderView.Model(
        size: .small,
        name: "Angelica"
    )
    
    let defaultAvatarBigModel = ProfileHeaderView.Model(
        size: .big,
        name: "Angelica"
    )
    
    VStack(alignment: .leading) {
        ProfileHeaderView(model: avatarSmallModel)
        ProfileHeaderView(model: avatarBigModel)
    }
    
    VStack(alignment: .leading) {
        ProfileHeaderView(model: defaultAvatarSmallModel)
        ProfileHeaderView(model: defaultAvatarBigModel)
    }
    .padding(.top, 20)
}
