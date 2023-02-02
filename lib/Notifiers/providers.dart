import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'api_service_firebase.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => ApiServiceFirebase.instance,
    lazy: false,
  ),
];
