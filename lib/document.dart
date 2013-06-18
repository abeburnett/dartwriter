library document;

import 'dart:json' as JSON;
import 'dart:math' show Random;

import 'package:intl/intl.dart';

import 'package:web_ui/web_ui.dart';

/**
* A file of plain text
*
* The document keeps track of its creation and modification time.
*/

@observable
class Document {

  String _title;
  String _content;

  /// Creation time
  DateTime created;

  /// Last modified time
  DateTime modified;

  /// The unique identifier is 'document-' followed by a large random number
  String id;

  /// A random number generator
  static Random random = new Random();

  /// Create a new document
  Document(this._title, this._content) {
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