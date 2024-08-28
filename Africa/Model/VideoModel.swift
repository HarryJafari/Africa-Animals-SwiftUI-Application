//
//  VideoModel.swift
//  Africa
//
//  Created by Harry Jafari on 13/8/2024.
//

import SwiftUI

struct VideoModel: Codable, Identifiable {
    let id: String
    let name:String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
