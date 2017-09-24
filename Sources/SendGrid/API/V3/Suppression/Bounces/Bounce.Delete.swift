//
//  Bounce.Delete.swift
//  SendGrid
//
//  Created by Scott Kawai on 9/19/17.
//

import Foundation

public extension Bounce {

    /// The `Bounce.Delete` class represents the API call to [delete from the
    /// bounce list](https://sendgrid.com/docs/API_Reference/Web_API_v3/bounces.html#Delete-bounces-DELETE).
    public class Delete: SuppressionListDeleter<Bounce>, AutoEncodable {
        
        // MARK: - Properties
        //======================================================================
        
        /// The path for the bounces API
        override var path: String { return "/v3/suppression/bounces" }
        
        /// Returns a request that will delete *all* the entries on your bounce
        /// list.
        public static var all: Bounce.Delete {
            return Bounce.Delete(deleteAll: true, emails: nil)
        }
        
    }
    
}

/// Encodable conformance
public extension Bounce.Delete {
    
    /// :nodoc:
    public enum CodingKeys: String, CodingKey {
        case deleteAll  = "delete_all"
        case emails
    }
    
    /// :nodoc:
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.deleteAll, forKey: .deleteAll)
        try container.encodeIfPresent(self.emails, forKey: .emails)
    }
    
}
