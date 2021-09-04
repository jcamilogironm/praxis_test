class Load{
  final LoadAction action;
  final bool isLoading;
  
  Load({this.action = LoadAction.none, this.isLoading = false});
}

enum LoadAction{
  none,
  launch,
  getUsers,
  getGallery
}