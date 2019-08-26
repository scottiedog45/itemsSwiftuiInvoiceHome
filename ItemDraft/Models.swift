//
//  Models.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation

class Item : Identifiable {
	var id : String
	var name : String
	var amount : String
	var taxes : [Tax]
	var price : String
	var quantity : String
	var advancedForm : Bool
	
	init(id : String, name: String, amount: String, taxes: [Tax], price : String, quantity : String, advancedForm: Bool) {
		self.id = id
		self.name = name
		self.amount = amount
		self.taxes = taxes
		self.price = price
		self.quantity = quantity
		self.advancedForm = advancedForm
	}
}

class Tax: Identifiable {
	var id : String
	var name : String
	var amount : String
	var isCompound : Bool
	
	init(id: String, name: String, amount: String, isCompound: Bool) {
		self.id = id
		self.name = name
		self.amount = amount
		self.isCompound = isCompound
	}
}

