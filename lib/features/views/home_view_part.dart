part of 'home_view.dart';

abstract class HomeViewPart extends State<HomeView> with ViewWidgets {
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
}
