//
// Copyright 2024 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

/// Just a simple structure holding a resource and a reference to it,
/// since that's something we need to do very often.
public class ReferencedTSResource {
    public let reference: TSResourceReference
    public let attachment: TSResource

    public init(reference: TSResourceReference, attachment: TSResource) {
        self.reference = reference
        self.attachment = attachment
    }

    public var asReferencedStream: ReferencedTSResourceStream? {
        guard let resourceStream = attachment.asResourceStream() else {
            return nil
        }
        return .init(reference: reference, attachmentStream: resourceStream)
    }
}

public class ReferencedTSResourceStream: ReferencedTSResource {
    public let attachmentStream: TSResourceStream

    public init(reference: TSResourceReference, attachmentStream: TSResourceStream) {
        self.attachmentStream = attachmentStream
        super.init(reference: reference, attachment: attachmentStream)
    }
}

extension ReferencedAttachment {

    var referencedTSResource: ReferencedTSResource {
        return .init(reference: reference, attachment: attachment)
    }
}

extension ReferencedAttachmentStream {

    var referencedTSResourceStream: ReferencedTSResourceStream {
        return .init(reference: reference, attachmentStream: attachmentStream)
    }
}

extension TSAttachment {

    // TODO: this is just to help with bridging while all TSResources are actually TSAttachments,
    // and we are migrating code to TSResource that hands an instance to unmigrated code.
    // Remove once all references to TSAttachment are replaced with TSResource.
    public var bridgeReferenced: ReferencedTSResource {
        return .init(reference: TSAttachmentReference(uniqueId: self.uniqueId, attachment: self), attachment: self)
    }
}

extension TSAttachmentStream {

    // TODO: this is just to help with bridging while all TSResources are actually TSAttachments,
    // and we are migrating code to TSResource that hands an instance to unmigrated code.
    // Remove once all references to TSAttachment are replaced with TSResource.
    public var bridgeReferencedStream: ReferencedTSResourceStream {
        return .init(
            reference: TSAttachmentReference(uniqueId: self.uniqueId, attachment: self),
            attachmentStream: self
        )
    }
}
