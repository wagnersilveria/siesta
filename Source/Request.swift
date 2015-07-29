//
//  Request.swift
//  Siesta
//
//  Created by Paul on 2015/7/20.
//  Copyright © 2015 Bust Out Solutions. All rights reserved.
//

public enum RequestMethod: String
    {
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
    }

public typealias AnyResponseCalback = Response -> Void
public typealias SuccessCallback = Resource.Data -> Void
public typealias NotModifiedCallback = Void -> Void
public typealias ErrorCallback = Resource.Error -> Void

public protocol Request: AnyObject
    {
    func response(callback: AnyResponseCalback) -> Self      // success or failure
    func success(callback: SuccessCallback) -> Self          // success, may be same data
    func newData(callback: SuccessCallback) -> Self          // success, data modified
    func notModified(callback: NotModifiedCallback) -> Self  // success, data not modified
    func error(callback: ErrorCallback) -> Self              // failure
    
    func cancel()
    }

