//
//  HttpError.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import Foundation

enum HttpError: Error {
  case serverError
  case noData
  case badUrl
  case badResponse(statusCode: Int)
  case unknown
}
