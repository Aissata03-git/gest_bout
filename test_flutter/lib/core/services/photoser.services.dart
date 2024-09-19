import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class PhotoService {
  final cloudinary= ('dfold4r7v', '657475531649147', 'MCk3PHemo21LcmXThMJa1qVUdLQ');

Future<String?> uploadImageToCloudinary(String filePath, dynamic CloudinaryResourceType) async {
  try {
    final response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(filePath, resourceType: CloudinaryResourceType.image),
    );
    return response.secureUrl;
  } catch (e) {
    print('Erreur : $e');
    return null;
  }
}

}

extension on (String, String, String) {
  uploadFile(fromFile) {}
}

class CloudinaryFile {
  static fromFile(String filePath, {required resourceType}) {}
}
