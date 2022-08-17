import SwiftUI
import shared

struct ListView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.searchResults){ city in
                        Button( action: {
                            viewModel.searchListAction(city.name)
                        }){ Text(city.name)}}
                                        
                    if viewModel.searchText == "" {
                        ForEach(viewModel.arrayOfCitysAddToList){ city in
                            HStack {
                                NavigationLink(destination: DetailView(oneCityDataForDetailView: city), label: {
                                    Text(city.name)
                                    Spacer()
                                    Text("\(Int(city.main.temp))°C")
                                    Rectangle()
                                        .frame(width: 1, height: 50, alignment: .center)
                                        .foregroundColor(.clear)
                                })
                            }
                        }.onDelete { IndexSet in viewModel.deleteCityFromList(IndexSet)}
                    }
                }.background(.clear)
                 .navigationTitle("Country list")
                 .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
                 .buttonStyle(PlainButtonStyle())
                
                if viewModel.arrayOfCitysAddToList.isEmpty && viewModel.searchText == "" {
                    VStack{
                        Text("Your list is empty")
                            .bold()
                        Text("Search and select the city you want to add to the list")
                            .fontWeight(.thin)
                            .padding(.horizontal, 70)
                            .padding(.top, 5)
                            .multilineTextAlignment(.center)
                    }
                }
                
                if viewModel.searchResults.isEmpty && viewModel.searchText != "" {
                    VStack{
                        Text("City ​​not found").bold()
                        Text("Search for another city")
                            .fontWeight(.thin)
                            .padding(.horizontal, 70)
                            .padding(.top, 5)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .onAppear{viewModel.allAviableCites = viewModel.parseData()}
        }
    }
}
