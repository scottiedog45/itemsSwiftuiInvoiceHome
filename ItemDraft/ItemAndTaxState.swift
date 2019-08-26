//
//  ItemAndTaxState.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/20/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation
import Combine

class ItemAndTaxState : ObservableObject {
	
	@Published
	var taxes = [tax1, tax2, tax3]
	
	@Published
	var items = [item1, item2, item3]
	
	//MVP version of network request
	func addNewTax() {
		taxes.insert(Tax(id: UUID().uuidString, name: "New Tax", amount: "", isCompound: false), at: 0)
	}
}
