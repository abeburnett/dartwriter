// Auto-generated from index.html.
// DO NOT EDIT.

library dartwriter;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'document_item.html.dart';
import 'dart:html' hide Document;
import 'package:web_ui/web_ui.dart';
import '_from_packages/dartwriter/document.dart';
import '_from_packages/dartwriter/search.dart';
import '_from_packages/dartwriter/storage.dart';


// Original code


final __changes = new __observe.Observable();

Document __$activeDocument = new Document('Hello Codelab!', 'Try typing in this document!');
Document get activeDocument {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'activeDocument');
  }
  return __$activeDocument;
}
set activeDocument(Document value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'activeDocument',
        __$activeDocument, value);
  }
  __$activeDocument = value;
}

bool __$contentActive = true;
bool get contentActive {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'contentActive');
  }
  return __$contentActive;
}
set contentActive(bool value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'contentActive',
        __$contentActive, value);
  }
  __$contentActive = value;
}

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

// Additional generated code
void init_autogenerated() {
  var __root = autogenerated.document.body;
  final __html0 = new autogenerated.Element.tag('template'), __html1 = new autogenerated.Element.html('<div is="x-document-item"></div>'), __html2 = new autogenerated.Element.html('<div class="title">\n                <!-- Button to go back to document list.\n                    Only visible in a small viewport. -->\n                    <button>&lt;</button>\n\n                <!-- Document title -->\n                <div class="input-wrap">\n\n\n                    <input type="text">\n                </div>\n            </div>'), __html3 = new autogenerated.Element.html('<textarea class="content"></textarea>'), __html4 = new autogenerated.Element.html('<div class="footer"></div>');
  var __e0, __e1, __e12, __e13, __e4, __e5;
  var __t = new autogenerated.Template(__root);
  __e5 = __root.nodes[1];
  __e0 = __e5.nodes[1].nodes[1];
  __t.listen(__e0.onClick, ($event) { createDocument(); });
  __e1 = __e5.nodes[1].nodes[3].nodes[1];
  __t.listen(__e1.onInput, ($event) { searchFilter = __e1.value; });
  __t.oneWayBind(() => searchFilter, (e) { if (__e1.value != e) __e1.value = e; }, false, false);
  __e4 = __e5.nodes[3].nodes[3];
  __t.loop(__e4, () => documents, ($list, $index, __t) {
    var doc = $list[$index];
    var __e3;
    __e3 = __html0.clone(true);
    __t.conditional(__e3, () => matchesSearchFilter(doc), (__t) {
      var __e2;
      __e2 = __html1.clone(true);
      __t.oneWayBind(() => doc, (e) { if (__e2.xtag.doc != e) __e2.xtag.doc = e; }, false, false);
      __t.component(new DocumentItem()..host = __e2);
    __t.addAll([new autogenerated.Text('\n                    '),
        __e2,
        new autogenerated.Text('\n                ')]);
    });

  __t.addAll([new autogenerated.Text('\n\n                '),
      __e3,
      new autogenerated.Text('\n            ')]);
  });
  __t.bindClass(__e5, () => sidebarClass, false);
  __e13 = __root.nodes[5];
  __e12 = __e13.nodes[3];
  __t.conditional(__e12, () => activeDocument != null, (__t) {
    var __e11, __e6, __e7, __e8, __e9;
    __e8 = __html2.clone(true);
    __e6 = __e8.nodes[3];
    __t.listen(__e6.onClick, ($event) { contentActive = false; });
    __e7 = __e8.nodes[7].nodes[1];
    __t.listen(__e7.onInput, ($event) { activeDocument.title = __e7.value; });
    __t.listen(__e7.onKeyUp, ($event) { $event = new autogenerated.KeyEvent($event); saveDocument(activeDocument); });
    __t.oneWayBind(() => activeDocument.title, (e) { if (__e7.value != e) __e7.value = e; }, false, false);
    __e9 = __html3.clone(true);
    __t.listen(__e9.onInput, ($event) { activeDocument.content = __e9.value; });
    __t.listen(__e9.onKeyUp, ($event) { $event = new autogenerated.KeyEvent($event); saveDocument(activeDocument); });
    __t.oneWayBind(() => activeDocument.content, (e) { if (__e9.value != e) __e9.value = e; }, false, false);
    __e11 = __html4.clone(true);
    var __binding10 = __t.contentBind(() => activeDocument.wordCount, false);
    __e11.nodes.addAll([new autogenerated.Text('\n                '),
        new autogenerated.Text('\n                '),
        __binding10,
        new autogenerated.Text('\n\n            ')]);
  __t.addAll([new autogenerated.Text('\n\n            '),
      __e8,
      new autogenerated.Text('\n\n            '),
      __e9,
      new autogenerated.Text('\n\n            '),
      __e11,
      new autogenerated.Text('\n        ')]);
  });

  __t.bindClass(__e13, () => mainClass, false);
  __t.create();
  __t.insert();
}

//@ sourceMappingURL=dartwriter.dart.map