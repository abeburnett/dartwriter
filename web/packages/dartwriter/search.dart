/**
* Library for searching and filtering documents
*/

library search;

import 'package:web_ui/web_ui.dart';
import 'package:dartwriter/document.dart';

/// Observed string to filter documents
@observable
String searchFilter = '';

/// Function to check if a document matches the search filter
bool matchesSearchFilter(Document doc){
  if (searchFilter.isEmpty){
    return true;
  }

  return doc.title.toLowerCase().contains(searchFilter.toLowerCase()) ||
         doc.content.toLowerCase().contains(searchFilter.toLowerCase());
}