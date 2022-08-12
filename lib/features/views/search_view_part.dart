part of 'search_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

abstract class SearchViewPart extends State<SearchView> {
  late final SearchViewModel _searchViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchAllData();
  }

  void _fetchAllData() {
    _searchViewModel = SearchViewModel(SpotifyService(NetworkProduct.instance.networkManager));
    _searchViewModel.fetchAllTypes();
  }
}
