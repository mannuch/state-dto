import Vapor
import ULID

struct CreateUser: Content {
    var stytchUserId: String
    var phoneId: String
    var name: String
    var handle: String
    var profileImageUrl: String
    var locationLat: Double
    var locationLong: Double
}

struct PatchUser: Content {
    var name: String?
    var handle: String?
    var profileImageUrl: String?
    var locationLat: Double?
    var locationLong: Double?
}

struct UserInfo: Content, Equatable {
    var id: UUID
    var name: String
    var handle: String
    var profileImageUrl: String
    var locationLat: Double
    var locationLong: Double
}

struct FriendRequestResult: Content {
    var sender: UserInfo
    var createdAt: Date
}

struct ThreadInfo: Content {
    var id: ULID
    var members: [UserInfo]
}

struct Page<T: Content> : Content {
    var items: [T]
    var metadata: Metadata
    
    struct Metadata: Content {
        var per: Int
        var total: Int
        var page: Int
    }
}

struct FriendStatusResult: Content {
    var userId: UUID
    var status: FriendStatus
}

enum FriendStatus: String, Codable {
    case none, friends, sent, recieved
}

struct FriendRequest: Content {
    var recipientId: UUID
}

struct FriendRequestAction: Content {
    var senderId: UUID
}

struct CreatedThreadResult: Content {
    var threadId: ULID
}

struct AuthTokenResponse: Content {
    var accessToken: String
    var tokenType: String = "Bearer"
}

struct CheckHandleRequest: Content {
    var handle: String
}

struct CheckHandleResponse: Content {
    var available: Bool
}

struct DirectUploadURLRequest: Content {
    var threadId: ULID
    var messageId: ULID
}

struct DirectUploadURLResponse: Content {
    var threadId: ULID
    var messageId: ULID
    var frontImageUploadUrl: URL
    var rearImageUploadUrl: URL
}

struct SignedURLRequest: Content {
    var imageUrl: URL
}

struct SignedURLResponse: Content {
    var signedUrl: URL
}
