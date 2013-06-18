library document;

import 'dart:json' as JSON;
import 'dart:math' show Random;

import 'package:intl/intl.dart';

import 'package:web_ui/web_ui.dart';
import 'package:web_ui/observe/observable.dart' as __observe;


/**
* A file of plain text
*
* The document keeps track of its creation and modification time.
*/

@observable
class Document extends Observable  {

  String __$_title;
  String get _title {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, '_title');
    }
    return __$_title;
  }
  set _title(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, '_title',
          __$_title, value);
    }
    __$_title = value;
  }
  String __$_content;
  String get _content {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, '_content');
    }
    return __$_content;
  }
  set _content(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, '_content',
          __$_content, value);
    }
    __$_content = value;
  }

  DateTime __$created;
  DateTime get created {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'created');
    }
    return __$created;
  }
  set created(DateTime value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'created',
          __$created, value);
    }
    __$created = value;
  }

  DateTime __$modified;
  DateTime get modified {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'modified');
    }
    return __$modified;
  }
  set modified(DateTime value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'modified',
          __$modified, value);
    }
    __$modified = value;
  }

  String __$id;
  String get id {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'id');
    }
    return __$id;
  }
  set id(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'id',
          __$id, value);
    }
    __$id = value;
  }

  static final __changes = new __observe.Observable();

  static Random __$random = new Random();
  static Random get random {
    if (__observe.observeReads) {
      __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'random');
    }
    return __$random;
  }
  static set random(Random value) {
    if (__observe.hasObservers(__changes)) {
      __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'random',
          __$random, value);
    }
    __$random = value;
  }

  /// Create a new document
  Document(_title, _content) : __$_title = _title, __$_content = _content {
    id = 'document-${random.nextInt(1000000)}';
    created = new DateTime.now();
    modified = new DateTime.now();
  }

  /// Re-creates the document from serialized JSON
  Document.fromJson(json){
    var data = JSON.parse(json);
    id = data['id'];
    _title = data['title'];
    _content = data['content'];
    created = DateTime.parse(data['created']);
    modified = DateTime.parse(data['modified']);
  }

  /// Serialize this object into a JSON string
  String toJson(){
    var data = {
       'id': id,
        'title': _title,
        'content': _content,
        'created': created.toString(),
        'modified' : modified.toString()
    };
    return JSON.stringify(data);
  }

  /// Count number of words in a document
  /// A "word" is a string of characters separated by a space or a newline.
  String get wordCount {
    int count = new RegExp(r"(\w|\')+").allMatches(_content).length;
    if (count >= 1) {
      return '$count words';
    } else if (count == 1) {
      return '$count word';
    }
    return 'No words - Yo, Yo write something...';
  }

  /// The title of our document
  set title(String title) {
    _title = title;
    modified = new DateTime.now();
  }
  String get title => _title;


  /// The next best-seller, maybe?
  set content(String content){
    _content = content;
    modified = new DateTime.now();
  }
  String get content => _content;
}

/**
* Formatting for document dates.
*
* Parse time looks like: 'April 29, 9:48 AM'
*/
DateFormat dateFormat = new DateFormat.MMMMd().addPattern('',', ').add_jm();
//@ sourceMappingURL=document.dart.map