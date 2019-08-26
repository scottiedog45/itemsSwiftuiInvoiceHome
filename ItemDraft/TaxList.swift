//
//  TaxList.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct TaxList: View {
	
	@Binding var taxes : [Tax]
	
	func delete(_ offSets: IndexSet) {
		offSets.forEach {taxes.remove(at: $0)}
	}
	
    var body: some View {
       Section(header : Text("Taxes")) {
		
			ForEach(taxes) {tax in

				TaxListView(tax: tax, shouldShowEditingOption: true)
				
			}.onDelete { self.delete($0) }
		}
    }
}

#if DEBUG
struct TaxList_Previews: PreviewProvider {
    static var previews: some View {
		TaxList(taxes: .constant([tax1, tax2]))
    }
}
#endif
