import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PickUpFile extends StatefulWidget {
  final Function callBack;
  const PickUpFile({Key? key, required this.callBack}) : super(key: key);

  @override
  State<PickUpFile> createState() => _PickUpFileState();
}

class _PickUpFileState extends State<PickUpFile> {
  late File selectedFile;
  String selectedFileName="Add attachment";
  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {

      selectedFile= File(result.files.single.path!);
      widget.callBack(selectedFile);
      PlatformFile platformFile=result.files.first;
      setState(() {
        selectedFileName=platformFile.name.toString();
      });
      return selectedFile;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () {
                pickFile();
              },
              child:  Row(
                children: [
                  Icon(Icons.attach_file),
                  Text(selectedFileName),
                ],
              )),
        ],
      ),
    );
  }
}
