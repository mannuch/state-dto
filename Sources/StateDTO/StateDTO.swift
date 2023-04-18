import ULID
import Foundation

public struct AuthenticateOTPRequest: Codable, Equatable {
  public var stytchUserId: String
  public var phoneId: String
  public var otpCode: String
  
  public init(
    stytchUserId: String,
    phoneId: String,
    otpCode: String
  ) {
    self.stytchUserId = stytchUserId
    self.phoneId = phoneId
    self.otpCode = otpCode
  }
}

public struct AuthenticateOTPResponse: Codable, Equatable {
  public var sessionJWT: String
  public var sessionToken: String
  public var userId: UUID
  public var userIsPending: Bool
  
  public init(sessionJWT: String, sessionToken: String, userId: UUID, userIsPending: Bool) {
    self.sessionJWT = sessionJWT
    self.sessionToken = sessionToken
    self.userId = userId
    self.userIsPending = userIsPending
  }
}

public enum UserStatusResponse: Codable, Equatable {
  case pending(userId: UUID)
  case complete(userId: UUID)
}

public struct UpdatePhoneIdRequest: Codable, Equatable {
  public var phoneId: String
  
  public init(phoneId: String) {
    self.phoneId = phoneId
  }
}

public struct CreateUserRequest: Codable, Equatable {
  public var stytchUserId: String
  public var name: String
  public var handle: String
  public var profileImageUrl: String
  public var locationLat: Double
  public var locationLong: Double
  
  public init(
    stytchUserId: String,
    name: String,
    handle: String,
    profileImageUrl: String,
    locationLat: Double,
    locationLong: Double
  ) {
    self.stytchUserId = stytchUserId
    self.name = name
    self.handle = handle
    self.profileImageUrl = profileImageUrl
    self.locationLat = locationLat
    self.locationLong = locationLong
  }
}

public struct PatchUser: Codable, Equatable {
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

public struct UserInfo: Codable, Equatable {
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

public struct FriendRequestResult: Codable, Equatable {
  public var sender: UserInfo
  public var createdAt: Date
  
  public init(sender: UserInfo, createdAt: Date) {
    self.sender = sender
    self.createdAt = createdAt
  }
}

public struct ThreadInfo: Codable, Equatable {
  public var id: ULID
  public var members: [UserInfo]
  public var threadContent: Data?
  
  
  public init(id: ULID, members: [UserInfo], threadContent: Data?) {
    self.id = id
    self.members = members
    self.threadContent = threadContent
  }
}

public struct Page<T: Codable> : Codable {
  public var items: [T]
  public var metadata: Metadata
  
  public init(items: [T], metadata: Metadata) {
    self.items = items
    self.metadata = metadata
  }
  
  public struct Metadata: Codable, Equatable {
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

extension Page: Equatable where T: Equatable {}

public struct FriendStatusResult: Codable, Equatable {
  public var userId: UUID
  public var status: FriendStatus
  
  public init(userId: UUID, status: FriendStatus) {
    self.userId = userId
    self.status = status
  }
}

public enum FriendStatus: String, Codable, Equatable {
  case none, friends, sent, recieved
}

public struct FriendRequest: Codable, Equatable {
  public var recipientId: UUID
  
  public init(recipientId: UUID) {
    self.recipientId = recipientId
  }
  
}

public struct FriendRequestAction: Codable, Equatable {
  public var senderId: UUID
  
  public init(senderId: UUID) {
    self.senderId = senderId
  }
}

public struct CreatedThreadResult: Codable, Equatable {
  public var threadId: ULID
  
  public init(threadId: ULID) {
    self.threadId = threadId
  }
}

public struct AuthInfoResponse: Codable, Equatable {
  public let stateJWT: String, userInfo: UserInfo
  
  public init(stateJWT: String, userInfo: UserInfo) {
    self.stateJWT = stateJWT
    self.userInfo = userInfo
  }
}

public struct CheckHandleRequest: Codable, Equatable {
  public var handle: String
  
  public init(handle: String) {
    self.handle = handle
  }
}

public struct CheckHandleResponse: Codable, Equatable {
  public var available: Bool
  
  public init(available: Bool) {
    self.available = available
  }
}

public struct DirectUploadURLRequest: Codable, Equatable {
  public var threadId: ULID
  public var messageId: ULID
  
  public init(threadId: ULID, messageId: ULID) {
    self.threadId = threadId
    self.messageId = messageId
  }
}

public struct DirectUploadURLResponse: Codable, Equatable {
  public var threadId: ULID
  public var messageId: ULID
  public var frontImageUrlPair: ImageURLPair
  public var rearImageUrlPair: ImageURLPair
  
  public init(
    threadId: ULID,
    messageId: ULID,
    frontImageUrlPair: ImageURLPair,
    rearImageUrlPair: ImageURLPair
  ) {
    self.threadId = threadId
    self.messageId = messageId
    self.frontImageUrlPair = frontImageUrlPair
    self.rearImageUrlPair = rearImageUrlPair
  }
}

public struct SignedURLRequest: Codable, Equatable {
  public var imageUrl: URL
  
  public init(imageUrl: URL) {
    self.imageUrl = imageUrl
  }
}

public struct SignedURLResponse: Codable, Equatable {
  public var signedUrl: URL
  
  public init(signedUrl: URL) {
    self.signedUrl = signedUrl
  }
}

public struct ProfileImageUploadURLResponse: Codable, Equatable {
  public var urlPair: ImageURLPair
  
  public init(urlPair: ImageURLPair) {
    self.urlPair = urlPair
  }
}

public struct ImageURLPair: Codable, Equatable {
  public var uploadUrl: URL
  public var serveUrl: URL
  
  public init(uploadUrl: URL, serveUrl: URL) {
    self.uploadUrl = uploadUrl
    self.serveUrl = serveUrl
  }
}

public struct DeviceTokensUpdate: Codable, Equatable {
  public var deviceTokens: [String]
  
  public init(_ deviceTokens: [String]) {
    self.deviceTokens = deviceTokens
  }
}
