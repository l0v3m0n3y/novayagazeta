import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: request) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data, let response = response {
                    continuation.resume(returning: (data, response))
                } else {
                    continuation.resume(throwing: URLError(.unknown))
                }
            }
            task.resume()
        }
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public class Novayagazeta{
    private let api_eu = "https://novayagazeta.eu/api/v1"
    private let api = "https://novayagazeta.ru/api/v1"
    private var headers: [String: String]
    
    public init() {
        self.headers = [
        "Accept":"*/*",
        "Connection":"keep-alive",
        "Accept-Encoding":"deflate, zstd",
        "Accept-Language":"en-US,en;q=0.9",
        "User-Agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"
        ]

    }


    private func fetchJSON(from urlString: String,method: HTTPMethod = .get,body: Data? = nil,queryParameters: [String: String]? = nil) async throws -> Any {
        var urlComponents = URLComponents(string: urlString)
        if let queryParameters = queryParameters {
            urlComponents?.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents?.url else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONSerialization.jsonObject(with: data)
    }
    
    public func getNetworkInfo(eu:Bool = true) async throws -> Any {
        return try await fetchJSON(from: "\(eu ? api_eu : api)/get/network")
    }
    
    public func getThemesList(eu:Bool = true) async throws -> Any {
        return try await fetchJSON(from: "\(eu ? api_eu : api)/get/themes")
    }
    
    public func getMainPage(eu:Bool = true) async throws -> Any {
        return try await fetchJSON(from: "\(eu ? api_eu : api)/get/network")
    }
    
    public func search(eu:Bool = true,q: String,from: Int? = nil,to: Int? = nil,page: Int=0) async throws -> Any {
        let urlString = "\(eu ? api_eu : api)/search"
        var queryParameters: [String: String] = [
        "q": q,
        "typeList": "authors,records",
        "page": String(page)
        ]|
        
        if let from = from {
            queryItems["from"] = String(from)
        }
        
        if let to = to {
            queryItems["to"] = String(to)
        }

        return try await fetchJSON(from: urlString,method: .get,queryParameters: queryParameters)
    }
    
    public func getNewsBySlug(eu:Bool = true,slug: String) async throws -> Any {
        return try await fetchJSON(from: "\(eu ? api_eu : api)/get/record?slug=\(slug)")
    }

    public func getSlugsList(eu:Bool = true,slugs: [String]) async throws -> Any {
        let urlString = "\(eu ? api_eu : api)/get/records"
        
        let body: [String: Any] = ["slugs": slugs]
        
        let bodyData = try JSONSerialization.data(withJSONObject: body, options: [])
        
        return try await fetchJSON(from: urlString,method: .post,body: bodyData,queryParameters: nil)
    }

}
