part of 'home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

abstract class HomeViewPart extends State<HomeView> {
  late final HomeViewModel _homeViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchAllData();
  }

  void _fetchAllData() {
    _homeViewModel = HomeViewModel(SpotifyService(NetworkProduct.instance.networkManager));
    _homeViewModel.fetchAllDatas();
  }

  final _title = TitlesAndSubtitles.yourShows.getString();
  final _mood = TitlesAndSubtitles.mood.getString();
}
