//
// Copyright 2024 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

// Code generated by Wire protocol buffer compiler, do not edit.
// Source: BackupProto.BackupProtoGroupMemberAddedUpdate in Backup.proto
import Foundation
import Wire

public struct BackupProtoGroupMemberAddedUpdate {

    @ProtoDefaulted
    public var updaterAci: Foundation.Data?
    public var newMemberAci: Foundation.Data
    public var hadOpenInvitation: Bool
    /**
     * If hadOpenInvitation is true, optionally include aci of the inviter.
     */
    @ProtoDefaulted
    public var inviterAci: Foundation.Data?
    public var unknownFields: UnknownFields = .init()

    public init(
        newMemberAci: Foundation.Data,
        hadOpenInvitation: Bool,
        configure: (inout Self) -> Swift.Void = { _ in }
    ) {
        self.newMemberAci = newMemberAci
        self.hadOpenInvitation = hadOpenInvitation
        configure(&self)
    }

}

#if !WIRE_REMOVE_EQUATABLE
extension BackupProtoGroupMemberAddedUpdate : Equatable {
}
#endif

#if !WIRE_REMOVE_HASHABLE
extension BackupProtoGroupMemberAddedUpdate : Hashable {
}
#endif

extension BackupProtoGroupMemberAddedUpdate : Sendable {
}

extension BackupProtoGroupMemberAddedUpdate : ProtoMessage {

    public static func protoMessageTypeURL() -> String {
        return "type.googleapis.com/BackupProto.BackupProtoGroupMemberAddedUpdate"
    }

}

extension BackupProtoGroupMemberAddedUpdate : Proto3Codable {

    public init(from protoReader: ProtoReader) throws {
        var updaterAci: Foundation.Data? = nil
        var newMemberAci: Foundation.Data = .init()
        var hadOpenInvitation: Bool = false
        var inviterAci: Foundation.Data? = nil

        let token = try protoReader.beginMessage()
        while let tag = try protoReader.nextTag(token: token) {
            switch tag {
            case 1: updaterAci = try protoReader.decode(Foundation.Data.self)
            case 2: newMemberAci = try protoReader.decode(Foundation.Data.self)
            case 3: hadOpenInvitation = try protoReader.decode(Bool.self)
            case 4: inviterAci = try protoReader.decode(Foundation.Data.self)
            default: try protoReader.readUnknownField(tag: tag)
            }
        }
        self.unknownFields = try protoReader.endMessage(token: token)

        self._updaterAci.wrappedValue = updaterAci
        self.newMemberAci = newMemberAci
        self.hadOpenInvitation = hadOpenInvitation
        self._inviterAci.wrappedValue = inviterAci
    }

    public func encode(to protoWriter: ProtoWriter) throws {
        try protoWriter.encode(tag: 1, value: self.updaterAci)
        try protoWriter.encode(tag: 2, value: self.newMemberAci)
        try protoWriter.encode(tag: 3, value: self.hadOpenInvitation)
        try protoWriter.encode(tag: 4, value: self.inviterAci)
        try protoWriter.writeUnknownFields(unknownFields)
    }

}

#if !WIRE_REMOVE_CODABLE
extension BackupProtoGroupMemberAddedUpdate : Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringLiteralCodingKeys.self)
        self._updaterAci.wrappedValue = try container.decodeIfPresent(stringEncoded: Foundation.Data.self, forKey: "updaterAci")
        self.newMemberAci = try container.decode(stringEncoded: Foundation.Data.self, forKey: "newMemberAci")
        self.hadOpenInvitation = try container.decode(Bool.self, forKey: "hadOpenInvitation")
        self._inviterAci.wrappedValue = try container.decodeIfPresent(stringEncoded: Foundation.Data.self, forKey: "inviterAci")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringLiteralCodingKeys.self)
        let includeDefaults = encoder.protoDefaultValuesEncodingStrategy == .include

        try container.encodeIfPresent(stringEncoded: self.updaterAci, forKey: "updaterAci")
        if includeDefaults || !self.newMemberAci.isEmpty {
            try container.encode(stringEncoded: self.newMemberAci, forKey: "newMemberAci")
        }
        if includeDefaults || self.hadOpenInvitation != false {
            try container.encode(self.hadOpenInvitation, forKey: "hadOpenInvitation")
        }
        try container.encodeIfPresent(stringEncoded: self.inviterAci, forKey: "inviterAci")
    }

}
#endif
