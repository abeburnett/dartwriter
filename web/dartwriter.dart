@observable
library dartwriter;

import 'dart:html' hide Document;

import 'package:web_ui/web_ui.dart';

import 'package:dartwriter/document.dart';



/// The document currently being written
Document activeDocument = new Document('Hello Codelab!', 'Try typing in this document!');

/// Used to control which panel is displayed in the mobile mode
bool contentActive = true;

String get sidebarClass => contentActive ? '' : 'active';
String get mainClass => contentActive ? 'active' : '';





/// Starts the application
void main(){

}
