import 'package:vexana/vexana.dart';

class NetworkProduct {
  static NetworkProduct? _instace;
  static const String _baseURL = 'http://10.0.2.2:3000/';

  static NetworkProduct get instance {
    _instace = NetworkProduct._init();
    return _instace!;
  }

  NetworkProduct._init() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: _baseURL));
  }

  late final INetworkManager networkManager;
}
