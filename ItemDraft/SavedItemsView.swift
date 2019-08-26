//
//  SavedItemsView.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct SavedItemsView: View {
	
	@State var searchText : String = ""
	
	@State var items : [Item]
	
    var body: some View {
		
		Form {
			
			HStack {
				
				Image(systemName: "magnifyingglass")
				
				///add onchange completion here for searching
				TextField("Search", text: $searchText)
			}
			
			Section(header: Text("Saved Items")) {
				
				List(items) { item in
					IndividualItemView(item: item, shouldShowEditingOption: false)
				}
			}
		}
    }
}

#if DEBUG
struct SavedItemsView_Previews: PreviewProvider {
    static var previews: some View {
		SavedItemsView(items: [item1])
    }
}
#endif
