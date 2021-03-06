//
//  NetworkService.swift
//  FoodLover
//
//  Created by Putra on 07/11/21.
//

import Foundation


struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func myFirstRequest() {
        request(route: .temp, method: .get, type: String.self,
                completion: { _ in })
    }
    
    private func request<T: Codable> (route: Route,
                                     method: Method,
                                     parameters:[String: Any]? = nil,
                                     type: T.Type,
                                     completion:@escaping (Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request){ data,response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not strignify our data"
                print("The response is:\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is:\(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T:Codable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result{
            
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
                
            }
            
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodeData = response.data {
                completion(.success(decodeData))
            } else {
                completion(.failure(AppError.unknownError))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    /// This function help us to generate a url request
    /// - Parameters:
    ///   - route: the path the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information u need pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil}
        var urlReq = URLRequest(url: url)
        urlReq.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlReq.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                urlReq.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                urlReq.httpBody = bodyData
            }
        }
        
        return urlReq
    }
    
    
}
