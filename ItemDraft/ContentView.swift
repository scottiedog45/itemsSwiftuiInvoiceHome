//
//  ContentView.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var state = ItemAndTaxState()
	
	@State private var listType = 0
	
	@State var showing : Bool = false
	
	///empty item for "new item" feature, not a production strategy
	
	@State var newItem : Item = Item(id: "1",
									 name: "",
									 amount: "",
									 taxes: [tax1, tax2, tax3],
									 price: "",
									 quantity: "",
									 advancedForm: false)
	
	var body: some View {
		
		NavigationView {
			
			VStack {
				
				Picker("Items", selection: $listType) {
					
					Text("Edit Items").tag(0)
					
					Text("Add Saved Item").tag(1)
					
					Text("Taxes").tag(2)
					
					/*:it's very likely that there won't be enough room for this third tag
					when all texts are translated to german. If so, you could move
					the Taxes tab as a bottom section of the Edit Items tab
					*/
					
				}.pickerStyle(SegmentedPickerStyle())
				
				if (listType == 0) {
					
					CurrentItemsList(
						state: state,
						items: $state.items,
						taxes: $state.taxes)
					
				} else if (listType == 1 ) {
					
					SavedItemsView(items: state.items)
					
				} else {
					
					Form {
						
						TaxList(taxes : $state.taxes)
							
						Button(action: { self.state.addNewTax() }) { Text("+ Create Tax") }
						
					}
				}
			}
			.navigationBarTitle("Items")
			.navigationBarItems(
				trailing: Button(
							action: { self.showing.toggle() },
							label: { HStack {
										Image(systemName: "plus")
										Text("New Item")}
									}))
		}.sheet(isPresented: $showing, onDismiss: {}) {
			UpdateItem(taxes: self.state.taxes, item : self.$newItem)}
	}
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
