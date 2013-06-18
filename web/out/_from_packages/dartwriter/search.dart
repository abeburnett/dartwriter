/**
* Library for searching and filtering documents
*/

library search;

import 'package:web_ui/web_ui.dart';
import 'document.dart';
import 'package:web_ui/observe/observable.dart' as __observe;


final __changes = new __observe.Observable();

String __$searchFilter = '';
String get searchFilter {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'searchFilter');
  }
  return __$searchFilter;
}
set searchFilter(String value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'searchFilter',
        __$searchFilter, value);
  }
  __$searchFilter = value;
}

/// Function to check if a document matches the search filter
bool matchesSearchFilter(Document doc){
  if (searchFilter.isEmpty){
    return true;
  }

  return doc.title.toLowerCase().contains(searchFilter.toLowerCase()) ||
         doc.content.toLowerCase().contains(searchFilter.toLowerCase());
}
//@ sourceMappingURL=search.dart.map