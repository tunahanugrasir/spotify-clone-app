import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_clone_app/models/types_model.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: "http://localhost:3000/"));
  });
  test('search all data', () async {
    final response = await networkManager.send<TypeModel, List<TypeModel>>("typesPath",
        parseModel: TypeModel(), method: RequestType.GET);
    expect(response.data, isNotNull);
  });
}
