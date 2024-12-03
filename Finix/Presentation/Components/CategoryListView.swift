// Created by Valerie N. Prinz on 03/12/2024.

import SwiftUI

extension CategoryListView {
    class ViewModel: ObservableObject {
        @Published var selectedCategory: Category?
        let categories: [Category] = CategoryService.allСategories
    }
}

struct CategoryListView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.categories) { category in
                categoryRow(category)
            }
        }
        .scrollIndicators(.hidden)
    }
    
    func categoryRow(_ category: Category) -> some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.finixLightGray)
                    .opacity(0.2)
                Image(category.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(category.iconColor)
            }
            
            Text(category.name)
            .foregroundStyle(Color.textSecondary)
            .font(.bodyTextNarrowRegular)
            .padding(.leading, 8)
            
            Spacer()
            
            RadioButtonView(model: .init(
                selected: viewModel.selectedCategory == category)
            )
            .padding(.trailing, 10)
        }
        .padding(.vertical, 8)
        .padding(.leading, 20)
        .padding(.trailing, 12)
        .onTapGesture {
            withAnimation {
                viewModel.selectedCategory = category
            }
        }
    }
}

#Preview {
    CategoryListView(viewModel: .init())
    .padding()
}

