//
// Copyright 2024 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

// Code generated by Wire protocol buffer compiler, do not edit.
// Source: BackupProto.BackupProtoSticker in Backup.proto
import Foundation
import Wire

public struct BackupProtoSticker {

    public var packId: Foundation.Data
    public var packKey: Foundation.Data
    public var stickerId: UInt32
    @ProtoDefaulted
    public var emoji: String?
    public var unknownFields: UnknownFields = .init()

    public init(
        packId: Foundation.Data,
        packKey: Foundation.Data,
        stickerId: UInt32,
        configure: (inout Self) -> Swift.Void = { _ in }
    ) {
        self.packId = packId
        self.packKey = packKey
        self.stickerId = stickerId
        configure(&self)
    }

}

#if !WIRE_REMOVE_EQUATABLE
extension BackupProtoSticker : Equatable {
}
#endif

#if !WIRE_REMOVE_HASHABLE
extension BackupProtoSticker : Hashable {
}
#endif

extension BackupProtoSticker : Sendable {
}

extension BackupProtoSticker : ProtoMessage {

    public static func protoMessageTypeURL() -> String {
        return "type.googleapis.com/BackupProto.BackupProtoSticker"
    }

}

extension BackupProtoSticker : Proto3Codable {

    public init(from protoReader: ProtoReader) throws {
        var packId: Foundation.Data = .init()
        var packKey: Foundation.Data = .init()
        var stickerId: UInt32 = 0
        var emoji: String? = nil

        let token = try protoReader.beginMessage()
        while let tag = try protoReader.nextTag(token: token) {
            switch tag {
            case 1: packId = try protoReader.decode(Foundation.Data.self)
            case 2: packKey = try protoReader.decode(Foundation.Data.self)
            case 3: stickerId = try protoReader.decode(UInt32.self)
            case 4: emoji = try protoReader.decode(String.self)
            default: try protoReader.readUnknownField(tag: tag)
            }
        }
        self.unknownFields = try protoReader.endMessage(token: token)

        self.packId = packId
        self.packKey = packKey
        self.stickerId = stickerId
        self._emoji.wrappedValue = emoji
    }

    public func encode(to protoWriter: ProtoWriter) throws {
        try protoWriter.encode(tag: 1, value: self.packId)
        try protoWriter.encode(tag: 2, value: self.packKey)
        try protoWriter.encode(tag: 3, value: self.stickerId)
        try protoWriter.encode(tag: 4, value: self.emoji)
        try protoWriter.writeUnknownFields(unknownFields)
    }

}

#if !WIRE_REMOVE_CODABLE
extension BackupProtoSticker : Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringLiteralCodingKeys.self)
        self.packId = try container.decode(stringEncoded: Foundation.Data.self, forKey: "packId")
        self.packKey = try container.decode(stringEncoded: Foundation.Data.self, forKey: "packKey")
        self.stickerId = try container.decode(UInt32.self, forKey: "stickerId")
        self._emoji.wrappedValue = try container.decodeIfPresent(String.self, forKey: "emoji")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringLiteralCodingKeys.self)
        let includeDefaults = encoder.protoDefaultValuesEncodingStrategy == .include

        if includeDefaults || !self.packId.isEmpty {
            try container.encode(stringEncoded: self.packId, forKey: "packId")
        }
        if includeDefaults || !self.packKey.isEmpty {
            try container.encode(stringEncoded: self.packKey, forKey: "packKey")
        }
        if includeDefaults || self.stickerId != 0 {
            try container.encode(self.stickerId, forKey: "stickerId")
        }
        try container.encodeIfPresent(self.emoji, forKey: "emoji")
    }

}
#endif
