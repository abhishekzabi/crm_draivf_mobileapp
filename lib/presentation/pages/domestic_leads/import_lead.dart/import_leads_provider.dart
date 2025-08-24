import 'dart:io';
import 'package:flutter/foundation.dart';

class ImportLeadsProvider with ChangeNotifier {
   // Table headers
  final List<String> headers = [
    "* Name",
    "Wifeage",
    "Husbandname",
    "Husbandage",
    "Phonenumber",
    "Husband number",
    "MDR",
    "Husband mdr",
    "Source",
    "Attribute",
    "Preferred location",
  ];

  // Sample row values
  final List<String> rowValues = [
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
    "Sample Data",
  ];
   /////status option
  final List<String> _status = [
    "New Lead",
    "Interested",
    "Walk-in/Video Scheduled",
    "Walk-in/Video Done",
    "Treatment Started",
    "Treatment Done",
    "Not Interested",
    "Junk",
    "Not Picked up",
    "Call Later",
    "Walk-in Dropped",
    "Treatment Dropped",
  ];
  List<String> get status => _status;
    /////sources options
  final List<String> _sources = [
    "Affiliate Portals",
    "Camp",
    "Dropout",
    "Ebook",
    "Facebook",
    "Google",
    "Hotstar",
    "Inbound Call",
    "Justdial",
    "Oneindia",
    "Practo",
    "Quora",
  ];
  List<String> get sources => _sources;
    /////Assigned options
  final List<String> _assigned = [
    "Yamini 12767",
    "vishali TPR",
    "vignesh CRM",
    "Veera Pandi",
    "Vanitha 12383",
    "Super Admin",
    "Sudhakar L",
    "SREE HARISH RG",
    "sorna TPR",
    "Siva S",
    "Saranya S",
    "Santhiya 12679",
  ];
  List<String> get assigned => _assigned;
  
  File? _selectedFile;

  File? get selectedFile => _selectedFile;

    String? _selectedstatus;
  String? get selectedstatus => _selectedstatus;

    String? _selectedsources;
  String? get selectedsources => _selectedsources;


  String? _selectedassigned;
  String? get selectedassigned => _selectedassigned;



//choose file
  void setFile(File file) {
    _selectedFile = file;
    notifyListeners();
  }

  void clearFile() {
    _selectedFile = null;
    notifyListeners();
  }
 //selected status//
  void setSelectedstatus(String? value) {
    _selectedstatus = value;
    print(_selectedstatus);

    notifyListeners();
  }
    //selected item//
  void setSelectedsources(String? value) {
    _selectedsources = value;
    print(_selectedsources);
    notifyListeners();
  }
    //selected Assigned//
  void setSelectedassigned(String? value) {
    _selectedassigned = value;
    print(_selectedassigned);

    notifyListeners();
  }
}
