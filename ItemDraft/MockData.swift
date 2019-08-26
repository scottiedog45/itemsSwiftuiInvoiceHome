//
//  MockData.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/20/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation

var (tax1, tax2, tax3) = (	Tax(id: "1", name: "VAT", amount: "5.0%", isCompound: true),
							Tax(id: "2", name: "Sales", amount: "7.4%", isCompound: false),
							Tax(id: "3", name: "Family Discount", amount: "-10.0%", isCompound: true))

							
var (item1, item2, item3) = ( 	Item(id: "4", name: "Food", amount: "$45.00", taxes: [tax1, tax2], price: "6", quantity: "5", advancedForm: true),
								Item(id: "5", name: "Clothes", amount: "$1.00", taxes: [tax3], price: "6", quantity: "5", advancedForm: true),
								Item(id: "6", name: "Wine", amount: "$100,000.00", taxes: [tax1, tax2], price: "6", quantity: "5", advancedForm: true))





