//
//  ChartStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import Foundation

final class ChartStore: ObservableObject {
    @Published var monthlyData: [MonthlyData] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        // TODO: 파이어베이스에서 매출 금액, 예약 건수, 평점, 리뷰 개수 가져오기
        monthlyData = [
            MonthlyData(category: "예약 건수", month: "1월", value: 13),
            MonthlyData(category: "예약 건수", month: "2월", value: 15),
            MonthlyData(category: "예약 건수", month: "3월", value: 15),
            MonthlyData(category: "예약 건수", month: "4월", value: 10),
            MonthlyData(category: "예약 건수", month: "5월", value: 15),
            MonthlyData(category: "예약 건수", month: "6월", value: 10),
            MonthlyData(category: "예약 건수", month: "7월", value: 15),
            MonthlyData(category: "예약 건수", month: "8월", value: 25),
            MonthlyData(category: "예약 건수", month: "9월", value: 15),
            MonthlyData(category: "예약 건수", month: "10월", value: 25),
            MonthlyData(category: "예약 건수", month: "11월", value: 20),
            MonthlyData(category: "예약 건수", month: "12월", value: 15),
            
            MonthlyData(category: "평점", month: "1월", value: 6.0),
            MonthlyData(category: "평점", month: "2월", value: 5.5),
            MonthlyData(category: "평점", month: "3월", value: 8.5),
            MonthlyData(category: "평점", month: "4월", value: 8.0),
            MonthlyData(category: "평점", month: "5월", value: 10.0),
            MonthlyData(category: "평점", month: "6월", value: 5.0),
            MonthlyData(category: "평점", month: "7월", value: 6.0),
            MonthlyData(category: "평점", month: "8월", value: 5.0),
            MonthlyData(category: "평점", month: "9월", value: 10.0),
            MonthlyData(category: "평점", month: "10월", value: 9.5),
            MonthlyData(category: "평점", month: "11월", value: 8.5),
            MonthlyData(category: "평점", month: "12월", value: 8.0),
            
            MonthlyData(category: "리뷰 개수", month: "1월", value: 0),
            MonthlyData(category: "리뷰 개수", month: "2월", value: 5),
            MonthlyData(category: "리뷰 개수", month: "3월", value: 3),
            MonthlyData(category: "리뷰 개수", month: "4월", value: 1),
            MonthlyData(category: "리뷰 개수", month: "5월", value: 1),
            MonthlyData(category: "리뷰 개수", month: "6월", value: 5),
            MonthlyData(category: "리뷰 개수", month: "7월", value: 2),
            MonthlyData(category: "리뷰 개수", month: "8월", value: 5),
            MonthlyData(category: "리뷰 개수", month: "9월", value: 1),
            MonthlyData(category: "리뷰 개수", month: "10월", value: 5),
            MonthlyData(category: "리뷰 개수", month: "11월", value: 2),
            MonthlyData(category: "리뷰 개수", month: "12월", value: 3),
        ]
    }
}
