//
//  CurrentItemsList.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct CurrentItemsList: View {
	
	@ObservedObject var state : ItemAndTaxState
	
	@Binding var items : [Item]
	
	@Binding var taxes : [Tax]

	@State var showing : Bool = false
	
	@State var id : String? = nil
	
	///blank item for new item feature, not a production strategy. Standing in for creating a new item via network request
	@State var editingItem : Item = Item(id: "", name: "", amount: "", taxes: [], price: "", quantity: "", advancedForm: true)
	
	
	/// placeholder for delete network request
	func delete(_ offSets: IndexSet) {
		offSets.forEach {items.remove(at: $0)}
	}

	var body: some View {

			VStack {

				Form {

					Section(header : Text("Items")) {

						ForEach(items) { item in
							
							IndividualItemView(item: item, shouldShowEditingOption: true)
								.onTapGesture {
									self.editingItem = item
									self.showing.toggle()
							}
						}.onDelete { self.delete($0) }
						
						Text("Total : $150")
					}
			}
		}.sheet(isPresented: $showing, onDismiss: {
			
		}) { UpdateItem(taxes: self.taxes, item : self.$editingItem) }
	}
}

#if DEBUG
struct CurrentItemsList_Previews: PreviewProvider {
	static var previews: some View {
		CurrentItemsList(state: ItemAndTaxState(), items: .constant([item1]), taxes: .constant([tax2, tax3]), editingItem: item1)
	}
}
#endif
