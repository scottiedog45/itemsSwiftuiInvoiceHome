//
//  UpdateItem.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct UpdateItem: View {
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	@State var taxes : [Tax]
	
	@Binding var item : Item
	
	@State var toggle : Bool = true
	
	var body: some View {
		NavigationView {
			VStack {
				Form {
					Section {
						//todo change
						Toggle("Advanced Form", isOn: $item.advancedForm)
					}
					
					Section(header: Text("Amount")) {
						TextField("Amount", text: $item.amount)
					}
					Section(header: Text("Description")) {
						TextField("Description", text: $item.name)
					}
					Section(header: Text("Price")) {
						TextField("Price", text: $item.price)
					}
					Section(header: Text("Quantity")) {
						TextField("Quantity", text: $item.quantity)
					}
					
					Section(header: Text("Add a tax")) {
						
						Text("Clear Taxes").foregroundColor(Color.red)
						
						List(taxes) {tax in
							TaxListView(tax : tax, shouldShowEditingOption: false)
						}
					}
				}
			}
			.navigationBarTitle("Updating Item!")
			.navigationBarItems(
				leading:
					Button(
						action: { self.presentationMode.wrappedValue.dismiss()},
						label: { Text("Delete")
					}).foregroundColor(Color.red),
				trailing:
					Button(
						action: { self.presentationMode.wrappedValue.dismiss()},
						label: { Text("Save")
				}))
		}
	}
}

#if DEBUG
struct UpdateItem_Previews: PreviewProvider {
	static var previews: some View {
		UpdateItem(taxes: [tax1], item: .constant(item1))
	}
}
#endif
