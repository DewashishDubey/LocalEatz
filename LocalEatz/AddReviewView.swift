//
//  AddReviewView.swift
//  API_Calls
//
//  Created by Dewashish Dubey on 21/02/24.
//

import SwiftUI

struct AddReviewView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @Binding var isPresented: Bool
    let restaurantID: String
    let onReviewSubmitted: () -> Void
    
    @State private var reviewText = ""
    @State private var rating = 0.0 // Changed to Double
    
    @StateObject var viewModel1 = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your review", text: $reviewText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                // Display the rating with decimal value
                Text("Rating: \(String(format: "%.1f", rating))")
                    .padding()
                
                // Replaced Stepper with Slider
                Slider(value: $rating, in: 0...5, step: 0.1) { _ in
                    // Text("Rating: \(String(format: "%.1f", rating))") // Removed from here
                }
                .padding()
                
                Button("Submit") {
                    // Add the review
                    
                    addReview()
                    viewModel1.fetch()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .navigationTitle("Add Review")
            .navigationBarItems(trailing: Button("Cancel") {
                // Dismiss the sheet
                
                isPresented = false
            })
        }
    }
    
    func addReview() {
        guard !reviewText.isEmpty else {
            // Show an alert or some indication that the review text cannot be empty
            return
        }
        
        // Create a new review object
        let newReview = RestaurantReview(
            userName: viewModel.currentUser?.fullname ?? "Anonymus",
            reviewDate: formattedDate(),
            userRating: rating, // Changed to Double
            userReview: reviewText
        )
        
        // Prepare the request body
        let requestBody: [String: Any] = [
            "id": restaurantID,
            "user": newReview.userName,
            "date": newReview.reviewDate,
            "rating": newReview.userRating,
            "review": newReview.userReview
        ]
        
        // Convert the request body to JSON data
        guard let requestBodyData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            // Handle the error
            return
        }
        
        // Create the URL for the review endpoint
        guard let url = URL(string: "http://localhost:3002/review") else {
            // Handle the invalid URL
            return
        }
        
        // Create the HTTP request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestBodyData
        
        // Send the HTTP request
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response
            if let error = error {
                print("Error adding review: \(error)")
            } else if let data = data,
                      let response = String(data: data, encoding: .utf8) {
                print("Review added successfully: \(response)")
                
                // Call the completion handler
                onReviewSubmitted()
                
                // Dismiss the sheet
                DispatchQueue.main.async {
                    isPresented = false
                }
            }
        }.resume()
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: Date())
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewView(isPresented: .constant(true), restaurantID: "1", onReviewSubmitted: {})
    }
}

