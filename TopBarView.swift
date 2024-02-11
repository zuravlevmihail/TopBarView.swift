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
