import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createPost({
    required String title,
    required String username,
    required String description,
    required bool bookmarked,
    required String postType,
    required double price,
    required List<String> tags,
    required File pictureFile, // Provide the picture file to upload
  }) async {
    try {
      final pictureRef = _storage.ref().child('post_pictures/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = pictureRef.putFile(pictureFile);

      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

      final pictureURL = await snapshot.ref.getDownloadURL();

      await _firestore.collection('posts').add({
        'title': title,
        'username': username,
        'description': description,
        'bookmarked': bookmarked,
        'postType': postType,
        'price': price,
        'tags': tags,
        'pictureURL': pictureURL, // Store the picture URL
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error creating post: $e');
    }
  }

}

// void main() {
//   FirestoreService firestoreService = FirestoreService();

//   // Example usage: Create a new post with a picture
//   firestoreService.createPost(
//     title: 'Item Title',
//     username: 'John Doe',
//     description: 'Item description...',
//     bookmarked: false,
//     postType: 'sale',
//     price: 100.0,
//     tags: ['electronics', 'gadgets', 'sale'],
//     pictureFile: File('path_to_your_picture.jpg'), // Replace with the actual picture file
//   );
// }
