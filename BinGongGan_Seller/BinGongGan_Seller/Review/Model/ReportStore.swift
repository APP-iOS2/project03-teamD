//
//  ReportStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/10.
//

import Foundation
import FirebaseFirestore
import BinGongGanCore

final class ReportStore: ObservableObject {
    
    var dbRef = Firestore.firestore().collection("Reports")
    
    init() {
        
    }
    
    func loadData(report: Report) async {
        do {
            try await dbRef.document(report.id)
                .setData(report.asDictionary())
        } catch {
            print("Error loading reports: \(error)")
        }
    }
}
