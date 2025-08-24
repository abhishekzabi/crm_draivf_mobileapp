import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/import_lead.dart/import_lead_text.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/import_lead.dart/import_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImportLeads extends StatelessWidget {
  ImportLeads({super.key});
  final _importleadformKey = GlobalKey<FormState>();
  final headerStyle = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.poppins,
    color: AppColor.blackColor,
  );

  final cellStyle = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.poppins,
    color: AppColor.blackColor,
  );
  @override
  Widget build(BuildContext context) {
    final importleadprovider = Provider.of<ImportLeadsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("import leads")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _importleadformKey,

            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 245, 255),
                    border: Border.all(
                      color: const Color.fromARGB(255, 169, 200, 254),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildRichText([
                          ImportLeadTexts.point1Part1,
                          ImportLeadTexts.utf8Part,
                          ImportLeadTexts.point1Part2,
                        ]),
                        const SizedBox(height: 8),
                        _buildRichText([
                          ImportLeadTexts.point2Part1,
                          ImportLeadTexts.dateFormat,
                          ImportLeadTexts.point2Part2,
                        ]),
                        const SizedBox(height: 8),
                        _buildRichText([
                          ImportLeadTexts.point3Part1,
                          ImportLeadTexts.uniqueValidation,
                          ImportLeadTexts.point3Part2,
                        ]),
                        const SizedBox(height: 6),
                        _buildRichText([ImportLeadTexts.leadEmail]),
                        _buildRichText([ImportLeadTexts.leadPhone]),
                        const SizedBox(height: 12),
                        _buildRichText([ImportLeadTexts.note]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Import Leads",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.poppins,
                        color: AppColor.blackColor,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomGradientButton(
                        height: 40,
                        text: "Download Sample",
                        onPressed: () {
                          // submit action
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowHeight: 40,
                    dataRowHeight: 36,
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns:
                        importleadprovider.headers
                            .map(
                              (col) => DataColumn(
                                label: Text(
                                  col,
                                  style:
                                      col.contains("*")
                                          ? headerStyle.copyWith(
                                            color: Colors.red,
                                          ) // *Name in red
                                          : headerStyle,
                                ),
                              ),
                            )
                            .toList(),
                    rows: [
                      DataRow(
                        cells:
                            importleadprovider.rowValues
                                .map(
                                  (data) =>
                                      DataCell(Text(data, style: cellStyle)),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                CustomFileChooserField(
                  labelText: "Choose CSV File",
                  isMandatory: true,
                  selectedFile: importleadprovider.selectedFile,
                  allowedExtensions: ["csv"], //  pass dynamically
                  onFilePicked: (file) {
                    if (file != null) {
                      importleadprovider.setFile(file);
                    }
                  },
                ),
                const SizedBox(height: 6),
                //////////SELECT STATUS/////////
                CustomSearchDropdownWithSearch(
                  isMandatory: true,
                  labelText: "Status",
                  items: importleadprovider.status,
                  selectedValue: importleadprovider.selectedstatus,
                  onChanged: importleadprovider.setSelectedstatus,
                  hintText: "Select Status",
                ),
                const SizedBox(height: 6),
                //////////SELECT SOURCE/////////
                CustomSearchDropdownWithSearch(
                  isMandatory: true,
                  labelText: "Source",
                  items: importleadprovider.status,
                  selectedValue: importleadprovider.selectedstatus,
                  onChanged: importleadprovider.setSelectedsources,
                  hintText: "Select Source",
                ),
                const SizedBox(height: 6),
                //////////SELECT ASSIGNED/////////
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Assigned",
                  items: importleadprovider.assigned,
                  selectedValue: importleadprovider.selectedassigned,
                  onChanged: importleadprovider.setSelectedassigned,
                  hintText: "Select Assigned",
                ),
                const SizedBox(height: 16),
                        Row(
                      children: [
                        Expanded(
                          child: CustomGradientButton(
                            text: "Import",
                           
                         
                            onPressed: () {
                              // cancel action
                            },
                          ),
                        ),
                        const SizedBox(width: 12), // space between buttons
                        Expanded(
                          child: CustomGradientButton(
                            text: "Simulate Import",
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
        ),
      ),
    );
  }

  Widget _buildRichText(List<TextSpan> spans) {
    return RichText(text: TextSpan(children: spans));
  }
}
