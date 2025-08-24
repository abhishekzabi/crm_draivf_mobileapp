import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/add_lead/add_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/add_lead/date_field_with_age.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_textfield.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLeadScreen extends StatelessWidget {
  AddLeadScreen({super.key});
  final _addleadformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addleadprovider = Provider.of<AddLeadsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _addleadformKey,
                child: Column(
                  children: [
                    const Text(
                      "Add New Lead",
                      style: TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),

                        //////////SELECT STATUS/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: true,
                          labelText: "Status",
                          items: addleadprovider.status,
                          selectedValue: addleadprovider.selectedstatus,
                          onChanged: addleadprovider.setSelectedstatus,
                          hintText: "Select Status",
                        ),
                        const SizedBox(height: 6),

                        //////////SELECT SOURCE/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: true,
                          labelText: "Source",
                          items: addleadprovider.status,
                          selectedValue: addleadprovider.selectedstatus,
                          onChanged: addleadprovider.setSelectedsources,
                          hintText: "Select Source",
                        ),
                        const SizedBox(height: 6),

                        //////////SELECT ASSIGNED/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Assigned",
                          items: addleadprovider.assigned,
                          selectedValue: addleadprovider.selectedassigned,
                          onChanged: addleadprovider.setSelectedassigned,
                          hintText: "Select Assigned",
                        ),
                        const SizedBox(height: 6),

                        //////////SELECT ATTRIBUTE/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Attribute",
                          items: addleadprovider.attribute,
                          selectedValue: addleadprovider.selectedattribute,
                          onChanged: addleadprovider.setSelectedattribute,
                          hintText: "Select Attribute",
                        ),
                        const SizedBox(height: 6),
                        CustomMultiSelectField(
                          labelText: "Tag",
                          options: addleadprovider.tags,
                          selectedItems: addleadprovider.selectedTags,
                          onItemToggle:
                              (val) => addleadprovider.toggleItem(val),
                        ),
                        const SizedBox(height: 6),

                        CustomTextField(
                          controller: addleadprovider.wifeNameController,
                          hintText: "Enter wife name",
                          labelText: "Wife Name",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),

                        CustomTextField(
                          controller: addleadprovider.wifeNumberController,
                          hintText: "Enter wife number",
                          labelText: "Wife Number",
                          isMandatory: true,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: addleadprovider.isWifeWhatsappAvailable,
                              onChanged: (bool? value) {
                                addleadprovider.setWifeWhatsappAvailable(
                                  value ?? false,
                                );
                              },
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              activeColor: AppColor.primaryColor2,
                              checkColor: Colors.white,
                            ),

                            const Text("Check this if wife WhatsApp available"),
                          ],
                        ),
                        const SizedBox(height: 6),

                        //preferred location
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Preferred Location",
                          items: addleadprovider.preferredlocations,
                          selectedValue:
                              addleadprovider.selectedpreferredlocation,
                          onChanged:
                              addleadprovider.setSelectedPreferredLocation,
                          hintText: "Select preferred location",
                        ),
                        const SizedBox(height: 6),

                        //Address
                        CustomTextField(
                          controller: addleadprovider.addressController,
                          hintText: "Enter address",
                          labelText: "Address",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //Address
                        CustomTextField(
                          controller: addleadprovider.husbandNameController,
                          hintText: "Enter husband name",
                          labelText: "Husband Name",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //marriage Date
                        DateFieldWithAge(
                          controller: addleadprovider.marriageDateController,
                          hintText: "Select marriage date",
                          labelText: "Marriage at",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //married years (autocalculated)
                        CustomTextField(
                          controller: addleadprovider.marriedYearsController,
                          hintText: "Years will be auto-calculated",
                          labelText: "Married Years",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                        ),
                        const SizedBox(height: 6),

                        //wife"s age
                        CustomTextField(
                          controller: addleadprovider.wifeAgeController,
                          hintText: "Enter wife age",
                          labelText: "Wife Age",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        //husband number
                        CustomTextField(
                          controller: addleadprovider.husbandNumberController,
                          hintText: "Enter husband number",
                          labelText: "Husband Number",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Checkbox(
                              value: addleadprovider.isHusbandWhatsappAvailable,
                              onChanged: (bool? value) {
                                addleadprovider.setHusbandWhatsappAvailable(
                                  value ?? false,
                                );
                              },
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              activeColor: AppColor.primaryColor2,
                              checkColor: Colors.white,
                            ),

                            const Text(
                              "Check this if Husband WhatsApp available",
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        //husband age
                        CustomTextField(
                          controller: addleadprovider.husbandAgeController,
                          hintText: "Enter husband age",
                          labelText: "Husband Age",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        //email Address
                        CustomTextField(
                          controller: addleadprovider.emailController,
                          hintText: "Enter email",
                          labelText: "Email Address",
                          isMandatory: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 6),
                        //City
                        CustomTextField(
                          controller: addleadprovider.cityController,
                          hintText: "Enter city",
                          labelText: "City",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //State
                        CustomTextField(
                          controller: addleadprovider.stateController,
                          hintText: "Enter state",
                          labelText: "State",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //Country
                        CustomTextField(
                          controller: addleadprovider.countryController,
                          hintText: "Enter country",
                          labelText: "Country",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //Zip Code
                        CustomTextField(
                          controller: addleadprovider.zipcodeController,
                          hintText: "Enter zip code",
                          labelText: "Zip code",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),

                        //wife MDR Number
                        CustomTextField(
                          controller: addleadprovider.wifemdrnumberController,
                          hintText: "Enter wife MDR number",
                          labelText: "Wife MDR No",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),

                        //husband MDR Number
                        CustomTextField(
                          controller:
                              addleadprovider.husbandmdrnumberController,
                          hintText: "Enter husband MDR number",
                          labelText: "Husband MDR No",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        //walkin date
                        CustomDateField(
                          controller: addleadprovider.walkinDateController,
                          hintText: "Select walkin date",
                          labelText: "Walkin Date",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //profile group
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Profile Group",
                          items: addleadprovider.profileGroup,
                          selectedValue: addleadprovider.selectedProfileGroup,
                          onChanged: addleadprovider.setSelectedProfileGroup,
                          hintText: "Select profile group",
                        ),
                        const SizedBox(height: 6),
                        //for fertility treatment
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "For fertility treatment",
                          items: addleadprovider.forFertilityTreatment,
                          selectedValue:
                              addleadprovider.selectedForFertilityTreatment,
                          onChanged:
                              addleadprovider.setSelectedForFertilityTreatment,
                          hintText: "Select for fertility treatment",
                        ),

                        const SizedBox(height: 6),

                        //prefered language
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Prefered Time To Call",
                          items: addleadprovider.preferedTimeToCall,
                          selectedValue:
                              addleadprovider.selectedPreferedTimeToCall,
                          onChanged:
                              addleadprovider.setSelectedPreferedTimeToCall,
                          hintText: "Select prefered time to call",
                        ),

                        const SizedBox(height: 6),

                        //prefered language
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Prefered Language",
                          items: addleadprovider.preferedLanguage,
                          selectedValue:
                              addleadprovider.selectedPreferedLanguage,
                          onChanged:
                              addleadprovider.setSelectedPreferedLanguage,
                          hintText: "Select prefered language",
                        ),
                        const SizedBox(height: 6),
                        //description
                        CustomLargeTextField(
                          controller: addleadprovider.descriptionController,
                          hintText: "Enter description...",
                          labelText: "Description",
                          isMandatory: false,
                        ),

                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Checkbox(
                              value: addleadprovider.isPublic,
                              onChanged: (bool? value) {
                                addleadprovider.setIsPublic(value ?? false);
                              },
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              activeColor: AppColor.primaryColor2,
                              checkColor: Colors.white,
                            ),

                            const Text("Public"),
                            const SizedBox(width: 6),
                            Checkbox(
                              value: addleadprovider.isContactedToday,
                              onChanged: (bool? value) {
                                addleadprovider.setIsContactedToday(
                                  value ?? false,
                                );
                              },
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              activeColor: AppColor.primaryColor2,
                              checkColor: Colors.white,
                            ),

                            const Text("Contacted Today"),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomGradientButton(
                            text: "Cancel",
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.poppins,
                              color: AppColor.blackColor,
                            ),
                            gradientColors: [
                              const Color.fromARGB(255, 200, 200, 200),
                              const Color.fromARGB(255, 224, 224, 224),
                            ],
                            onPressed: () {
                              // cancel action
                            },
                          ),
                        ),
                        const SizedBox(width: 12), // space between buttons
                        Expanded(
                          child: CustomGradientButton(
                            text: "Submit",
                            onPressed: () {
                              // submit action
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
