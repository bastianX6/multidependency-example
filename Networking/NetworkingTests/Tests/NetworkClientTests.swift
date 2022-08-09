//
//  NetworkClientTests.swift
//  NetworkingTests
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation
import Nimble
import Quick

@testable import Networking

class NetworkClientTests: QuickSpec {
    var sut: NetworkClient!
    var fakeURLSession: FakeURLSession!
    var fakeUrl = URL(string: "https://bing.com")!
    var fakeData = "hello".data(using: .utf8)!

    override func spec() {
        describe("NetworkClient") {
            beforeEach {
                self.fakeURLSession = FakeURLSession()
            }
            it("should fail if status code is not 200") {
                self.fakeURLSession.state = .failure(.badHttpStatus(statusCode: 500))
                self.sut = NetworkClient(urlSession: self.fakeURLSession)
                waitUntil { done in
                    Task.init {
                        do {
                            _ = try await self.sut.getData(url: self.fakeUrl, httpMethod: .get, body: nil)
                            fail("This code shouldn't be executed")
                            done()
                        } catch {
                            guard let networkError = error as? NetworkClientError,
                                  case let NetworkClientError.badHttpStatus(statusCode) = networkError
                            else {
                                fail("Couldn't map error")
                                done()
                                return
                            }
                            expect(statusCode) == 500
                            done()
                        }
                    }
                }
            }

            it("should fail if response is not HTTPURLResponse") {
                self.fakeURLSession.state = .failure(.noHttpResponse)
                self.sut = NetworkClient(urlSession: self.fakeURLSession)
                waitUntil { done in
                    Task.init {
                        do {
                            _ = try await self.sut.getData(url: self.fakeUrl, httpMethod: .get, body: nil)
                            fail("This code shouldn't be executed")
                            done()
                        } catch {
                            guard let networkError = error as? NetworkClientError else {
                                fail("Couldn't map error")
                                done()
                                return
                            }
                            expect(networkError.identifier) == NetworkClientError.noHttpResponse.identifier
                            done()
                        }
                    }
                }
            }

            it("should complete request successfully") {
                self.fakeURLSession.state = .success(self.fakeData)
                self.sut = NetworkClient(urlSession: self.fakeURLSession)
                waitUntil { done in
                    Task.init {
                        do {
                            let data = try await self.sut.getData(url: self.fakeUrl, httpMethod: .get, body: nil)
                            expect(data) == self.fakeData
                            done()
                        } catch {
                            fail("Test fail with error: \(error)")
                            done()
                        }
                    }
                }
            }
        }
    }
}
