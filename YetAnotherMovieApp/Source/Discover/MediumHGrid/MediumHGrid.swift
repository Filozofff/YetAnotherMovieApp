//
//  MediumHGrid.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct MediumHGrid: View {

	@ObservedObject var viewModel: MediumHGridViewModel

	@State private var width: CGFloat = 0.0

	var body: some View {
		ZStack {
			Color
				.clear
				.bindGeometry(to: $width, reader: { $0.size.width })
				.padding(.horizontal)

			ScrollView(.horizontal) {
				LazyHGrid(rows: [GridItem()], alignment: .top, spacing: Layout.Spacings.small) {
					ForEach(viewModel.elements) { element in
						MediumInfo(viewModel: element)
							.frame(width: width)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}

struct MediumHorizontalGrid_Previews: PreviewProvider {

	static let previewObject = MediumHGridViewModel(
		elements: [
			MediumInfoViewModel(
				title: "League Of Legends: Wild Rift",
				subtitle: "Łowy rozpoczete",
				imagePath: "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
			),
			MediumInfoViewModel(
				title: "Spider man",
				subtitle: "Spirits of Vengeance wskrzeszone!",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			)
		]
	)

	static var previews: some View {
		MediumHGrid(viewModel: previewObject)
			.previewLayout(.sizeThatFits)
	}
}
