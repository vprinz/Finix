// Created by Valerie N. Prinz on 02/12/2024.

import SwiftUI

extension DatePickerView {
    class ViewModel: ObservableObject {
        @Published var selectedDate: Date
        @Published var showCalendar: Bool
        
        var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter.string(from: selectedDate)
        }
        
        init(
            selectedDate: Date = Date(),
            showCalendar: Bool = false
        ) {
            self.selectedDate = selectedDate
            self.showCalendar = showCalendar
        }
    }
}

struct DatePickerView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("setDateText")
                .font(.bodyTextMiddleRegular)
                .foregroundStyle(Color.textSecondary)
            HStack {
                TextField("", text: Binding(
                    get: { viewModel.formattedDate },
                    set: { _ in }
                ))
                .foregroundStyle(Color.textSecondary)
                .padding(.leading, 12)
                .disabled(true)
                Spacer()
                Image("calendar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.customPrimary)
                    .padding(.trailing, 12)
            }
            .cardFrame(height: 48)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    viewModel.showCalendar.toggle()
                }
            }
            
            if viewModel.showCalendar {
                DatePicker(
                    "",
                    selection: $viewModel.selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .tint(Color.customPrimary)
                .transition(.scale)
            }
        }
    }
}

#Preview {
    VStack {
        DatePickerView(viewModel: .init())
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.finixBackground)
}
