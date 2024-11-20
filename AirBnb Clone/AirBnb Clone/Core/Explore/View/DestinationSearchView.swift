//
//  DestinationSearchView.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/12/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var show: Bool

    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        // MARK: - destination view
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }

            }
            .padding()
            
            // where to
            VStack(alignment: .leading, content: {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray))
                    }
                } else {
                    CollapsedPickerView(title: "Where to?", description: "Add destination")
                }
                
            })
            .modifier(CollapsibleDestintionViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
        }
        
        // MARK: - date selection view
        VStack(alignment: .leading) {
            if selectedOption == .dates {
                Text("When's your trip?")
                    .font(.title2)
                    .fontWeight(.semibold)
                VStack {
                    DatePicker("From", selection: $startDate, displayedComponents: .date)
                    Divider()
                    DatePicker("To", selection: $endDate, displayedComponents: .date)
                }
                .foregroundStyle(.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
            } else {
                CollapsedPickerView(title: "When", description: "Add dates")
            }
        }
        .modifier(CollapsibleDestintionViewModifier())
        .frame(height: selectedOption == .dates ? 180 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .dates }
        }
        
        
        
        // MARK: - number of guests view
        VStack {
            if selectedOption == .guests {
                Text("Who's coming?")
                    .font(.title2)
                    .fontWeight(.semibold)
                VStack(alignment: .leading) {
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                }
            } else {
                CollapsedPickerView(title: "Who", description: "Add guests")
            }
        }
        .modifier(CollapsibleDestintionViewModifier())
        .frame(height: selectedOption == .guests ? 120 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .guests }
        }
        
        Spacer()
    }
    
}

#Preview {
    DestinationSearchView(viewModel: ExploreViewModel(service: ExploreService()), show: .constant(false))
}

// this is a view modifier - it works a bit like a CSS class.
struct CollapsibleDestintionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
