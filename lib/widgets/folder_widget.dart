import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class FolderWidget extends StatefulWidget {
  final AssetPathEntity folder;
  FolderWidget(this.folder);
  @override
  _FolderWidgetState createState() => _FolderWidgetState();
}

class _FolderWidgetState extends State<FolderWidget> {
  // Uint8List thumbDataWithSize;
  getThumbnailForFolder() async {
    final assetList = await widget.folder.getAssetListRange(start: 0, end: 1);
    return await assetList[0].thumbDataWithSize(200, 200);
  }

  @override
  Widget build(BuildContext context) {
    // getThumbnailForFolder();
    return FutureBuilder(
      future: getThumbnailForFolder(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('loading');
        } else {
          return Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(snapshot.data),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  widget.folder.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
