import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import '../widgets/folder_widget.dart';

class AllFolderPage extends StatefulWidget {
  final List<AssetPathEntity> folder;
  AllFolderPage(this.folder);
  @override
  _AllFolderPageState createState() => _AllFolderPageState();
}

class _AllFolderPageState extends State<AllFolderPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        itemCount: widget.folder != null ? widget.folder.length : 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return FolderWidget(widget.folder[index]);
        });
  }
}
