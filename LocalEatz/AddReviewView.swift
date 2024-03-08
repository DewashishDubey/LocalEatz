import SwiftUI

struct AddReviewView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var isPresented: Bool
    let restaurantID: String
    let onReviewSubmitted: () -> Void
    
    @State private var reviewText = ""
    @State private var rating = 0.0 // Rating as a decimal
    
    @StateObject var viewModel1 = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your review", text: $reviewText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                // Custom rating view
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: getStarImageName(forIndex: index))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(getStarColor(forIndex: index))
                            .onTapGesture {
                                // Update the rating based on tap count
                                updateRating(forIndex: index)
                            }
                    }
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
    
    // Function to get star image name based on rating
    private func getStarImageName(forIndex index: Int) -> String {
        let filledCount = Int(rating)
        if index <= filledCount {
            return "star.fill"
        } else if index - filledCount == 1 && rating.truncatingRemainder(dividingBy: 1) > 0 {
            return "star.leadinghalf.fill"
        } else {
            return "star"
        }
    }
    
    // Function to get star color based on rating
    private func getStarColor(forIndex index: Int) -> Color {
        if index <= Int(rating) {
            return .orange
        } else {
            return .gray
        }
    }
    
    // Function to update rating when a star is tapped
    private func updateRating(forIndex index: Int) {
        let fullStar = Double(index)
        if index <= Int(rating) {
            // If the star is already filled, tapping it again sets it to half
            rating = fullStar - 0.5
        } else {
            // If the star is not filled, tapping it sets it to full
            rating = fullStar
        }
    }
    
    // Function to add review
    private func addReview() {
        guard !reviewText.isEmpty else {
            // Show an alert or some indication that the review text cannot be empty
            return
        }
        
        // Create a new review object
        let newReview = RestaurantReview(
            userName: viewModel.currentUser?.fullname ?? "Anonymous",
            reviewDate: formattedDate(),
            userRating: rating, // Use the rating directly
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
    
    // Function to format the date
    private func formattedDate() -> String {
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
