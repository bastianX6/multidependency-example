//
//  BaseUrl.swift
//  Networking
//
//  Created by Bastián Véliz Vega on 08-08-22.
//

import Foundation

public class BaseUrl {
    private var defaultUrlString: String = "https://itunes.apple.com"
    lazy var baseUrlString: String = self.defaultUrlString

    public static let shared = BaseUrl()

    private init() {}
}
