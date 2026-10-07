import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

// FutureProvider with a real API call.
// The network code stays here. The UI only gets loading / error / data.
final postsProvider = FutureProvider<List<Post>>((ref) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.get(uri);

  // If the API fails, throw. The UI will show the "error" state.
  if (response.statusCode != 200) {
    throw Exception('Failed to load posts (${response.statusCode})');
  }

  // JSON text -> List of Post objects (first 12 only).
  final list = jsonDecode(response.body) as List<dynamic>;
  return list
      .cast<Map<String, dynamic>>()
      .map(Post.fromJson)
      .take(12)
      .toList();
});

final postByIdProvider = FutureProvider.family<Post, int>((ref, id) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
  final response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Post $id not found');
  }
  return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
});
