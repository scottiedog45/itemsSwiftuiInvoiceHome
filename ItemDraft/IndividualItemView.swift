//
//  IndividualItemView.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct IndividualItemView: View {
	
	@State var item : Item
	@State var shouldShowEditingOption : Bool
	
    var body: some View {
		
		HStack {
			
				VStack(alignment: .leading) {
					
					Text(item.name)
					
					VStack(alignment: .leading) {
						
						ForEach(item.taxes) { i in
							
							Text("\(i.name) \(i.amount)")
							.font(.caption)
						}
					}
			}.layoutPriority(1)

			Spacer()
			
			Text(item.amount)
				.font(.title)
				.bold()
			
			if shouldShowEditingOption { Button( action: {print("edit")}) { Text("Edit") } }
		}.frame(width: UIScreen.main.bounds.width - 32)
    }
}

#if DEBUG
struct IndividualItemView_Previews: PreviewProvider {
    static var previews: some View {
		IndividualItemView(item: item1, shouldShowEditingOption: true)
    }
}
#endif
