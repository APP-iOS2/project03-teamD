//
//  PlaceCell.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceCell: View {
    
    @State var cellImage: Image
    
    var body: some View {
        cellImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: PlaceCellConstant.cellWidth , height: PlaceCellConstant.cellHeight)
    }// BODY
}


struct PlaceCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCell(cellImage: Image("dummyPlaceImage1"))
    }
}
