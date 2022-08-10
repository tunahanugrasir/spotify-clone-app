part of 'base_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

abstract class _BaseViewPart extends State<BaseView> {
  late final BaseViewModel _baseViewModel;

  @override
  void initState() {
    super.initState();
    _baseViewModel = BaseViewModel();
  }
}
