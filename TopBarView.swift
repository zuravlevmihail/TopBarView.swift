import SwiftUI

struct TopBarView: View {
    
    @EnvironmentObject private var store: AppStore
    
    @State private var showSaveSheet = false
    @State private var showLoadSheet = false
     
    @State private var data: Data?
    
    var body: some View {
        HStack {
            Button {
                saveCollage()
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            Spacer()
            Button {
                showLoadSheet.toggle()
            } label: {
                Image(systemName: "square.and.arrow.down")
            }
        }
        .padding(.horizontal, 15)
        .font(.title)
        .frame(height: 50)
        .background(.regularMaterial)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .sheet(isPresented: $showSaveSheet) {
            if let data {
                DataExporterView(data: data, fileName: "Collage")
            }
        }
        .sheet(isPresented: $showLoadSheet) {
            DataImporterView(data: $data)
        }
        .onChange(of: data) { _ in
            loadCollage()
        }
    }
    
    private func saveCollage() {
        data = try? JSONEncoder().encode(store.state.collage)
        showSaveSheet.toggle()
    }
