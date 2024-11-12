import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();

  static String formatData(DateTime? date) {
    if (date == null) return "";
    return DateFormat.MMMMEEEEd().format(date);
  }

  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) {
      return null;
    }
    final file = await _compressAndGetFile(File(pickedFile.path));

    return file ?? File(pickedFile.path);
  }

  static Future<File?> _compressAndGetFile(File file) async {
    final dir = await getTemporaryDirectory();
    String fileExtension = p.extension(file.path);

    final targetPath = '${dir.absolute.path}/${const Uuid().v4()}$fileExtension';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 75,
      format: fileExtension == ".jpg" || fileExtension == ".jpeg"
          ? CompressFormat.jpeg
          : fileExtension == ".png"
          ? CompressFormat.png
          : fileExtension == ".heic"
          ? CompressFormat.heic
          : CompressFormat.webp,
    );

    return convertXFileToFile(result);
  }
  static Future<File> convertXFileToFile(XFile? xFile) async {
    final filePath = xFile?.path; // Get the path from the XFile
    final file = File(filePath!);  // Create a File object with the path

    return file;
  }

  ///This for show notes for user in status success or  failure of  the operation
  static flutterToast(String text, Color colorMessage) {
    Fluttertoast.showToast(
        msg: text.tr(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 15,
        backgroundColor: colorMessage,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
