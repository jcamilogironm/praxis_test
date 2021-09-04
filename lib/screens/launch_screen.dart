import 'package:flutter/material.dart';
import 'package:praxis/containers/data.dart';
import 'package:praxis/containers/loading.dart';
import 'package:praxis/models/load.dart';
import 'package:praxis/widgets/shared/gallery_page_view.dart';
import 'package:praxis/widgets/shared/loading_indicator.dart';

class LaunchScreen extends StatefulWidget {
  final void Function(BuildContext) getData;

  LaunchScreen({Key? key, required this.getData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    widget.getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Loading(builder: (context, load) {
      return load!.isLoading && load.action == LoadAction.launch
          ? LoadingIndicator(message: "Descargando Galeria...")
          : AppData(builder: (context, vm) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hola, Bienvenid@",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*GalleryPageView(gallery: [
                    "https://picsum.photos/id/0/5616/3744",
                    "https://picsum.photos/id/1/5616/3744",
                    "https://picsum.photos/id/10/2500/1667"
                  ])*/
                  GalleryPageView(covers: vm.covers)
                ],
              );
            });
    }));
  }
}
