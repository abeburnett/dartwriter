/**
* Library for storing the list of documents in the browser
*/

library storage;

import 'dart:html' hide Document;
import 'dart:json' as JSON;

import 'package:dartwriter/document.dart';

/// Used to store this app's documents
const String DOCUMENT_ID_KEY = 'writer-document-id';

/// A list of IDs for all documents stored in local storage
List<String> _storedIds = [];

/// Save the document to local storage
void saveDocument(Document doc){
  window.localStorage[doc.id] = doc.toJson();

  if (!_storedIds.contains(doc.id)){
    _storedIds.add(doc.id);
  }

  window.localStorage[DOCUMENT_ID_KEY] = JSON.stringify(_storedIds);
}

/// Removes the document from local storage
void removeDocument(Document doc){
  _storedIds.remove(doc.id);
  window.localStorage.remove(doc.id);
  window.localStorage[DOCUMENT_ID_KEY] = JSON.stringify(_storedIds);
}

/// Returns a collection of all documents from local storage
Iterable<Document> fetchDocuments(){
  // get all document IDs from local storage
  if (window.localStorage[DOCUMENT_ID_KEY] != null){
    _storedIds = JSON.parse(window.localStorage[DOCUMENT_ID_KEY]);
  }

  // get all documents from local storage
  return _storedIds.map(_fetchDocument);
}

/// Gets a document from local storage
Document _fetchDocument(String id){
  // return one deserialized document from local storage
  return new Document.fromJson(window.localStorage[id]);
}