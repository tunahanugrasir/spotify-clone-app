part of 'library_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

abstract class LibraryViewPart extends State<LibraryView> {
  late final LibraryViewModel _libraryViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchAllData();
  }

  void _fetchAllData() {
    _libraryViewModel = LibraryViewModel(SpotifyService(NetworkProduct.instance.networkManager));
    _libraryViewModel.fetchAllData();
  }
}
