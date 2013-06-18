@observable
library dartwriter;

import 'dart:html' hide Document;
import 'package:web_ui/web_ui.dart';
import 'package:dartwriter/document.dart';
import 'package:dartwriter/search.dart';
import 'package:dartwriter/storage.dart';

/// The document currently being written
Document activeDocument = new Document('Hello Codelab!', 'Try typing in this document!');

/// Used to control which panel is displayed in the mobile mode
bool contentActive = true;

String get sidebarClass => contentActive ? '' : 'active';
String get mainClass => contentActive ? 'active' : '';

/// An observed list of documents
final List<Document> documents = toObservable([]);

/// Create a document
void createDocument(){
  // Create a new document
  var doc = new Document('Untitled', '');
  documents.add(doc);
  selectDocument(doc);
}

/// Delete a document
void deleteDocument(Document doc){
  documents.remove(doc);
  removeDocument(doc);
}

/// Select a document
void selectDocument(Document doc, {bool markActive: false}) {
  if (documents.isEmpty){
    activeDocument = null;
  } else if (doc != null && documents.contains(doc) && doc != activeDocument){
    // change active document
    activeDocument = doc;
  } else if (activeDocument != null && documents.contains(activeDocument)){
    // stay on the active document and display the editing window
    contentActive = markActive && doc == activeDocument;
  } else {
    // fall back to the last document
    activeDocument = documents.last;
  }
}

/// Starts the application
void main(){

  // Initialize with all documents from local storage
  documents.addAll(fetchDocuments());

  // Create a new document if there are none
  if (documents.isEmpty) createDocument();

  // Select the first document in the list of documents
  selectDocument(documents.first);


}
