import 'package:flutter/material.dart';

class AddLeadsProvider extends ChangeNotifier {
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

  /////Attribute option/////

  final List<String> _attribute = [
    "Facebook",
    "Google",
    "Youtube",
    "Outdoor Banner",
    "Sun TV",
    "K TV",
    "Sun Music",
    "Kalaingar TV",
    "Instagram",
    "News Paper",
    "Doctor Referral",
    "Friend Referral",
    "George_Annur_09-04-2023",
    "George_Karamadai_19-03-2023",
    "George_Ganapathy_05-03-2023",
    "Treatment Dropped",
    "ambur",
  ];
  List<String> get attribute => _attribute;
  ////preferred locations
  final List<String> _preferredlocations = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get preferredlocations => _preferredlocations;

  ///profile group
  final List<String> _profileGroup = [
    "Consulting",
    "Infertility Tests",
    "Natural",
    "IUI",
    "ICSI",
    "IVF",
    "Surrogacy",
  ];
  List<String> get profileGroup => _profileGroup;
  //for fertility treatment
  final List<String> _forFertlityTreatment = ["New", "Old"];
  List<String> get forFertilityTreatment => _forFertlityTreatment;
  //prefered time to call
  //for fertility treatment
  final List<String> _preferedTimeToCall = [
    "7am to 11am",
    "11am to 3pm",
    "3pm to 7pm",
    "7pm to 11pm",
  ];
  List<String> get preferedTimeToCall => _preferedTimeToCall;
  //prefered language
  final List<String> _preferedLanguage = [
    "Tamil",
    "English",
    "Kannada",
    "Hindi",
    "Telugu",
    "Malayalam",
  ];
  List<String> get preferedLanguage => _preferedLanguage;
   //prefered language
  final List<String> _tags = [
    "Tag1",
    "Tag2",
    "Tag3",
    "Tag4",
    "Tag5",
   
  ];
  List<String> get tags => _tags;

  //controllers//
  final wifeNameController = TextEditingController();
  final wifeNumberController = TextEditingController();
  final addressController = TextEditingController();
  final husbandNameController = TextEditingController();
  final marriageDateController = TextEditingController();
  final marriedYearsController = TextEditingController();
  final wifeAgeController = TextEditingController();
  final husbandNumberController = TextEditingController();
  final husbandAgeController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipcodeController = TextEditingController();
  final wifemdrnumberController = TextEditingController();
  final husbandmdrnumberController = TextEditingController();
  final walkinDateController = TextEditingController();
  final descriptionController = TextEditingController();

  /////////
  String? _selectedstatus;
  String? get selectedstatus => _selectedstatus;

  String? _selectedsources;
  String? get selectedsources => _selectedsources;

  String? _selectedassigned;
  String? get selectedassigned => _selectedassigned;

  String? _selectedattribute;
  String? get selectedattribute => _selectedattribute;
  bool _isWifeWhatsappAvailable = false;
  bool get isWifeWhatsappAvailable => _isWifeWhatsappAvailable;
  bool _isHusbandWhatsappAvailable = false;
  bool get isHusbandWhatsappAvailable => _isHusbandWhatsappAvailable;
  String? _selectedpreferredlocation;
  String? get selectedpreferredlocation => _selectedpreferredlocation;
  String? _selectedProfileGroup;
  String? get selectedProfileGroup => _selectedProfileGroup;
  String? _selectedForFertilityTreatment;
  String? get selectedForFertilityTreatment => _selectedForFertilityTreatment;
  String? _selectedPreferedTimeToCall;
  String? get selectedPreferedTimeToCall => _selectedPreferedTimeToCall;
  String? _selectedPreferedLanguage;
  String? get selectedPreferedLanguage => _selectedPreferedLanguage;
  bool _isPublic = false;
  bool get isPublic => _isPublic;
    bool _isContactedToday = false;
  bool get isContactedToday => _isContactedToday;
   final List<String> _selectedTags = [];
  List<String> get selectedTags => _selectedTags;


  //selected status//
  void setSelectedstatus(String? value) {
    _selectedstatus = value;
    print(_selectedstatus);

    notifyListeners();
  }

  //selected source//
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

  //selected Assigned//
  void setSelectedattribute(String? value) {
    _selectedattribute = value;
    print(_selectedattribute);

    notifyListeners();
  }
  // iswifewhatsappavailable//

  void setWifeWhatsappAvailable(bool value) {
    _isWifeWhatsappAvailable = value;
    notifyListeners();
  }
  // isHusbandwhatsappavailable//

  void setHusbandWhatsappAvailable(bool value) {
    _isHusbandWhatsappAvailable = value;
    notifyListeners();
  }

  //selected Assigned//
  void setSelectedPreferredLocation(String? value) {
    _selectedpreferredlocation = value;
    print(_selectedpreferredlocation);

    notifyListeners();
  }
   // ispublic//

  void setIsPublic(bool value) {
    _isPublic = value;
    notifyListeners();
  }
   // iscontactedtoday//

  void setIsContactedToday(bool value) {
    _isContactedToday = value;
    notifyListeners();
  }

  //marriage date

  void setMarriageDate(String date) {
    marriageDateController.text = date;

    try {
      List<String> parts = date.split("-");
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      DateTime dateofmarry = DateTime(year, month, day);
      int age = calculatMarriedYears(dateofmarry);

      marriedYearsController.text = age.toString();
    } catch (e) {
      marriedYearsController.text = "";
    }

    notifyListeners(); // ✅ very important
  }

  int calculatMarriedYears(DateTime marrydate) {
    DateTime today = DateTime.now();
    int marriedyears = today.year - marrydate.year;
    if (today.month < marrydate.month ||
        (today.month == marrydate.month && today.day < marrydate.day)) {
      marriedyears--;
    }
    return marriedyears;
  }

  //selected profile group//
  void setSelectedProfileGroup(String? value) {
    _selectedProfileGroup = value;
    print(_selectedProfileGroup);

    notifyListeners();
  }

  //selected for fertility treatment//
  void setSelectedForFertilityTreatment(String? value) {
    _selectedForFertilityTreatment = value;
    print(_selectedForFertilityTreatment);

    notifyListeners();
  }

  //selected prefered time to call//
  void setSelectedPreferedTimeToCall(String? value) {
    _selectedPreferedTimeToCall = value;
    print(_selectedPreferedTimeToCall);

    notifyListeners();
  }

  //selected prefered Language//
  void setSelectedPreferedLanguage(String? value) {
    _selectedPreferedLanguage = value;
    print(_selectedPreferedLanguage);

    notifyListeners();
  }
  ///selected tags
    void toggleItem(String item) {
    if (_selectedTags.contains(item)) {
      _selectedTags.remove(item);
    } else {
      _selectedTags.add(item);
    }
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //controller for textfield
  final passwordcontroller = TextEditingController();

  bool _isloading = false;
  bool get isloading => _isloading;
  //login function
  void addlead(BuildContext context) async {
    if (emailController.text.isEmpty || passwordcontroller.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("please fill all fields")));
      return;
    }
    _isloading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isloading = false;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("login successfull")));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
