class FriendRequest {
  final String id;
  final String name;
  final String avatarUrl;
  final String status; // 'pending', 'confirm', 'delete'

  FriendRequest({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.status = 'pending',
  });

  FriendRequest copyWith({String? status}) {
    return FriendRequest(
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      status: status ?? this.status,
    );
  }
}
