import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import './all_folder_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String folderName = '';
  bool _loading = true;
  List<AssetPathEntity> folders;
  @override
  void initState() {
    super.initState();
    getAllFolders().then((albums) {
      setState(() {
        _loading = false;
        folders = albums;
      });
      // print(folders);
    });
  }

  getAllFolders() async {
    var result = await PhotoManager.requestPermission();
    if (result) {
      return (await PhotoManager.getAssetPathList());
    } else {
      PhotoManager.openSetting();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : AllFolderPage(folders);
  }
}
