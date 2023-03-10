//
//  BelarusbankRequest.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import Foundation
import Moya

typealias ArrayResponce<T: Decodable> = (([T]) -> Void)
typealias ObjectResponce<T: Decodable> = ((T) -> Void)
typealias Error = ((String) -> Void)

final class BelarusbankProvider {
    private let provider = MoyaProvider<BelarusbankAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getCurrency(success: @escaping ArrayResponce<Location>, failure: @escaping Error) {
        provider.request(.getAllBank) { result in
            switch result {
            case .success(let responce):
                guard let location = try? JSONDecoder().decode([Location].self, from: responce.data) else { return }
                success(location)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
    
    func getGems(success: @escaping ArrayResponce<Gems>, failure: @escaping Error) {
        provider.request(.getGems) { result in
            switch result {
            case .success(let responce):
                guard let gems = try? JSONDecoder().decode([Gems].self, from: responce.data) else { return }
                success(gems)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
    
    func getMetals(success: @escaping ArrayResponce<Metal>, failure: @escaping Error) {
        provider.request(.getMetal) { result in
            switch result {
                case .success(let responce):
                    guard let metal = try? JSONDecoder().decode([Metal].self, from: responce.data) else { return }
                    success(metal)
                case .failure(let error):
                    failure(error.localizedDescription)
            }
        }
    }
    
    func getNews(success: @escaping ArrayResponce<News>, failure: @escaping Error) {
        provider.request(.getNews) { result in
            switch result {
                case .success(let responce):
                    guard let news = try? JSONDecoder().decode([News].self, from: responce.data) else { return }
                    success(news)
                case .failure(let error):
                    failure(error.localizedDescription)
            }
        }
    }
    
    func getFillials(success: @escaping ArrayResponce<Fillials>, failure: @escaping Error) {
        provider.request(.getFillials) { result in
            switch result {
                case .success(let responce):
                    guard let fillials = try? JSONDecoder().decode([Fillials].self, from: responce.data) else { return }
                    success(fillials)
                case .failure(let error):
                    failure(error.localizedDescription)
            }
        }
    }
}
