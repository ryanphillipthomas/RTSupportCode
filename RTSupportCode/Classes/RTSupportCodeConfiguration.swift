//
//  RTSupportCodeConfiguration.swift
//  RTSupportCode
//
//  Created by Ryan Thomas on 10/14/16.
//  Copyright © 2016 ryanphillipthomas. All rights reserved.
//

import Foundation

public final class RTSupportCodeConfiguration {
    
    public static let sharedConfiguration = RTSupportCodeConfiguration()
    
    public var currentCodes = [String]()

    public class func setup(codes : [String]) {
        sharedConfiguration.currentCodes = [""] + codes
    }
}
