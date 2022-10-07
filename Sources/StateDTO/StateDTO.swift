import Vapor
import ULID

public struct CreateUserRequest: Content {
    public var stytchUserId: String
    public var phoneId: String
    public var name: String
    public var handle: String
    public var profileImageUrl: String
    public var locationLat: Double
    public var locationLong: Double
    
    public init(
        stytchUserId: String,
        phoneId: String,
        name: String,
        handle: String,
        profileImageUrl: String,
        locationLat: Double,
        locationLong: Double
    ) {
        self.stytchUserId = stytchUserId
        self.phoneId = phoneId
        self.name = name
        self.handle = handle
        self.profileImageUrl = profileImageUrl
        self.locationLat = locationLat
        self.locationLong = locationLong
    }
}

public struct PatchUser: Content {
    public var name: String?
    public var handle: String?
    public var profileImageUrl: String?
    public var locationLat: Double?
    public var locationLong: Double?
    
    public init(
        name: String? = nil,
        handle: String? = nil,
        profileImageUrl: String? = nil,
        locationLat: Double? = nil,
        locationLong: Double? = nil
    ) {
        self.name = name
        self.handle = handle
        self.profileImageUrl = profileImageUrl
        self.locationLat = locationLat
        self.locationLong = locationLong
    }
}

public struct UserInfo: Content, Equatable {
    public var id: UUID
    public var name: String
    public var handle: String
    public var profileImageUrl: String
    public var locationLat: Double
    public var locationLong: Double
    
    public init(
        id: UUID,
        name: String,
        handle: String,
        profileImageUrl: String,
        locationLat: Double,
        locationLong: Double
    ) {
        self.id = id
        self.name = name
        self.handle = handle
        self.profileImageUrl = profileImageUrl
        self.locationLat = locationLat
        self.locationLong = locationLong
    }
    
}

public struct FriendRequestResult: Content {
    public var sender: UserInfo
    public var createdAt: Date
    
    public init(sender: UserInfo, createdAt: Date) {
        self.sender = sender
        self.createdAt = createdAt
    }
}

public struct ThreadInfo: Content {
    public var id: ULID
    public var members: [UserInfo]
    
    public init(id: ULID, members: [UserInfo]) {
        self.id = id
        self.members = members
    }
}

public struct Page<T: Content> : Content {
    public var items: [T]
    public var metadata: Metadata
    
    public init(items: [T], metadata: Metadata) {
        self.items = items
        self.metadata = metadata
    }
    
    public struct Metadata: Content {
        public var per: Int
        public var total: Int
        public var page: Int
        
        public init(per: Int, total: Int, page: Int) {
            self.per = per
            self.total = total
            self.page = page
        }
    }
    
    
}

public struct FriendStatusResult: Content {
    public var userId: UUID
    public var status: FriendStatus
    
    public init(userId: UUID, status: FriendStatus) {
        self.userId = userId
        self.status = status
    }
}

public enum FriendStatus: String, Codable {
    case none, friends, sent, recieved
}

public struct FriendRequest: Content {
    public var recipientId: UUID
    
    public init(recipientId: UUID) {
        self.recipientId = recipientId
    }

}

public struct FriendRequestAction: Content {
    public var senderId: UUID
    
    public init(senderId: UUID) {
        self.senderId = senderId
    }
}

public struct CreatedThreadResult: Content {
    public var threadId: ULID
    
    public init(threadId: ULID) {
        self.threadId = threadId
    }

}

public struct AuthTokenResponse: Content {
    public var accessToken: String
    public var tokenType: String
    
    public init(accessToken: String, tokenType: String = "Bearer") {
        self.accessToken = accessToken
        self.tokenType = tokenType
    }
}

public struct CheckHandleRequest: Content {
    public var handle: String
    
    public init(handle: String) {
        self.handle = handle
    }
}

public struct CheckHandleResponse: Content {
    public var available: Bool
    
    public init(available: Bool) {
        self.available = available
    }
}

public struct DirectUploadURLRequest: Content {
    public var threadId: ULID
    public var messageId: ULID
    
    public init(threadId: ULID, messageId: ULID) {
        self.threadId = threadId
        self.messageId = messageId
    }
}

public struct DirectUploadURLResponse: Content {
    public var threadId: ULID
    public var messageId: ULID
    public var frontImageUploadUrl: URL
    public var rearImageUploadUrl: URL
    
    public init(threadId: ULID, messageId: ULID, frontImageUploadUrl: URL, rearImageUploadUrl: URL) {
        self.threadId = threadId
        self.messageId = messageId
        self.frontImageUploadUrl = frontImageUploadUrl
        self.rearImageUploadUrl = rearImageUploadUrl
    }
}

public struct SignedURLRequest: Content {
    public var imageUrl: URL
    
    public init(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
}

public struct SignedURLResponse: Content {
    public var signedUrl: URL
    
    public init(signedUrl: URL) {
        self.signedUrl = signedUrl
    }
}
