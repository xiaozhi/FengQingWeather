//
//  Observable+JSOn.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/11.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension Response {
    
    public func mapContentJSON() throws -> [String: Any]? {
        do {
            guard let jsonDictionary = try mapJSON() as? Dictionary<String, Any> else {
                return nil
            }
            
            if let array = jsonDictionary["HeWeather6"] as? [Any], let firstItem = array.first {
                
                let data = try JSONSerialization.data(withJSONObject: firstItem, options: JSONSerialization.WritingOptions.prettyPrinted)
                let jsonString = String(data: data, encoding: .utf8)
                print("------- Response -------")
                print(jsonString!)
                return firstItem as? [String: Any]
            }
            
        } catch  {
            throw MoyaError.jsonMapping(self)
        }
        return nil
    }
}

extension ObservableType where E == Response{
    
    public func mapContentJSON() -> Observable<[String: Any]?> {
        return flatMap({ (response) -> Observable<[String: Any]?> in
            return Observable.just(try response.mapContentJSON())
        })
    }
    
    public func mapModel<D: Decodable>(type: D.Type) -> Observable<D> {
        return flatMap({ (response) -> Observable<D> in
            do {
                
                let serializeToData: ([String: Any]?) throws -> Data? = { (jsonObject) in
                    guard let json = jsonObject, JSONSerialization.isValidJSONObject(json) else {
                        return nil
                    }
                    do {
                        return try JSONSerialization.data(withJSONObject: json)
                    } catch {
                        throw MoyaError.jsonMapping(response)
                    }
                }
                
                let jsonObject = try response.mapContentJSON()
                let decoder = JSONDecoder()
                
                if let jsonData = try serializeToData(jsonObject) {
                    return Observable.just(try decoder.decode(D.self, from: jsonData))
                } else {
                    throw MoyaError.jsonMapping(response)
                }
            } catch {
                throw MoyaError.jsonMapping(response)
            }
        })
    }
}
