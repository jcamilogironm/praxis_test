import 'package:http/http.dart' as http;

Map<String,String> headers(){
  return {"Accept":"application/json"};
}

Future<http.Response> getGallery() async {
  return await http.get(Uri.parse("https://picsum.photos/v2/list?page=1&limit=5"),headers:headers());
}

Future<http.Response> getUsers() async {
  return await http.get(Uri.parse("https://aceitereciclar.000webhostapp.com/webservice/usuarios.php"),headers:headers());
}