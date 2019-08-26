//
//  TaxListView.swift
//  ItemDraft
//
//  Created by Scott OToole on 8/19/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct TaxListView: View {
	
	///breaking this view into many smaller subviews so the compiler can handle it 🙄
	
	@State var tax : Tax
	@State var editing : Bool = false
	@State var checked : Bool = false
	@State var shouldShowEditingOption : Bool
	
	var body: some View {
		
		HStack {
			
			if !shouldShowEditingOption { Checkbox(editing: editing, checked: checked) }
			
			if editing { EditingTaxView(tax : tax) } else { SimpleTaxDisplayName(tax : tax) }
			
			Spacer()
			
			if shouldShowEditingOption { EditingOption(editing : $editing) }
		}
		.animation(.default)
		.frame(width: UIScreen.main.bounds.width - 32)
	}
}

struct EditingTaxView : View {
	
	@State var tax : Tax
	
	var body : some View {
		VStack {
			
			VStack(alignment: .leading, spacing: 2) {
				
				Text("Name")
					.font(.caption)
				
				TextField("Name", text: $tax.name)
					.textFieldStyle(RoundedBorderTextFieldStyle())
				
			}
			VStack(alignment: .leading, spacing: 2) {
				
				Text("Amount")
					.font(.caption)
				
				TextField("Amount", text: $tax.amount)
					.textFieldStyle(RoundedBorderTextFieldStyle())
			}
			HStack {
				
				Toggle("Compound Tax?", isOn: $tax.isCompound)
			}
		}.frame(width: 200)
	}
}



struct SimpleTaxDisplayName : View {
	
	@State var tax : Tax
	
	var body : some View {
		
		VStack(alignment: .leading) {
			//title
			
			HStack{
				
				Text(tax.name)
					.lineLimit(1)
				
				Text(tax.amount)
					.bold()
			}
			.font(.subheadline)
			
			if tax.isCompound {
				
				Text("COMPOUND")
					.font(.caption)
				
			} else {
				
				Text("")
			}
		}.layoutPriority(1)
	}
}

struct Checkbox : View {
	
	@State var item : Item? = nil
	@State var editing : Bool
	@State var checked : Bool
	
	var body : some View {
		
		if checked {
			
			return Image(systemName: "checkmark.square")
				.opacity(editing ? 0 : 1)
				.onTapGesture {
					self.checked.toggle()
			}
		} else {
			
			return Image(systemName: "square")
				.opacity(editing ? 0 : 1)
				.onTapGesture {
					self.checked.toggle()
			}
		}
	}
}

struct EditingOption : View {
	
	@Binding var editing : Bool
	
	var body : some View {
		
		VStack(alignment: .trailing) {
			
			Button(action: { self.editing.toggle() }) {
				if editing {
					VStack {
						
						Text("Cancel")
							.foregroundColor(Color.red)
							.padding(.bottom, 10)
						
						Text("Save")
					}
				} else {
					
					Text("Edit")
				}
			}.layoutPriority(1)
		}
	}
}

#if DEBUG
struct TaxListView_Previews: PreviewProvider {
	static var previews: some View {
		TaxListView(tax: tax1, shouldShowEditingOption: true)
	}
}
#endif
