import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../models/JellyfinModels.dart';
import '../../services/JellyfinApiData.dart';
import '../ViewIcon.dart';

class ViewListTile extends StatelessWidget {
  const ViewListTile({Key? key, required this.view}) : super(key: key);

  final BaseItemDto view;

  @override
  Widget build(BuildContext context) {
    final jellyfinApiData = GetIt.instance<JellyfinApiData>();

    return ListTile(
      leading: ViewIcon(
        collectionType: view.collectionType,
        color: jellyfinApiData.currentUser!.currentViewId == view.id
            ? Theme.of(context).colorScheme.secondary
            : null,
      ),
      title: Text(
        view.name ?? "Unknown Name",
        style: TextStyle(
          color: jellyfinApiData.currentUser!.currentViewId == view.id
              ? Theme.of(context).colorScheme.secondary
              : null,
        ),
      ),
      onTap: () => jellyfinApiData.setCurrentUserCurrentViewId(view.id),
    );
  }
}
