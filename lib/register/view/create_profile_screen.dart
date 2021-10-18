import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';
import 'package:upstanders/api/apis.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/dialogs.dart';
import 'package:upstanders/notification/notification_helper.dart';
import 'package:upstanders/register/bloc/create_account_bloc.dart';
import 'package:upstanders/register/models/create_account.dart';

import 'package:upstanders/register/view/view.dart';
import 'package:upstanders/register/widgets/build_drop_down_button.dart';
import 'package:upstanders/register/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:persona_flutter/persona_flutter.dart';

class CreateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.secondryColor,
        appBar: AppBar(
          backgroundColor: MyTheme.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            "CREATE PROFILE",
            style: TextStyle(
              color: MyTheme.secondryColor,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.secondryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _CreateAccountInputFormScreen()
        // _CreateProfileForm(),

        );
  }
}

class _CreateAccountInputFormScreen extends StatelessWidget {
  final CreateAccount createAccount = CreateAccount();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return CreateAccountBloc(
              // authenticationRepository:
              //     RepositoryProvider.of<AuthenticationRepository>(context),
              );
        },
        child: BlocListener<CreateAccountBloc, CreateAccountState>(
          listener: (context, state) {
            if(state.registrationStatus == RegistrationStatus.done){
              print("on create profile response_________________:${state.data}");
               context.read<CreateAccountBloc>().add(SendOTP());
               Fluttertoast.showToast(
                msg: "Please wait...",
              );

            }
            else if (state.registrationStatus == RegistrationStatus.sentOTP) {

              Fluttertoast.showToast(
                msg: "${state.data['message']}",//Otp has been sent over your mobile number .
              );
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => VerifyAccountScreen()),
              );
            } else if (state.registrationStatus == RegistrationStatus.failure) {
              print("${state.registrationStatus}");
              Fluttertoast.showToast(
                msg: "${state.data['message']}",
              );
            } else if (state.registrationStatus ==
                RegistrationStatus.uploadedImage) {
              createAccount.image = state.data['image'][0];
              Fluttertoast.showToast(
                msg: "Image Uploaded",
              );
            }
          },
          child: _CreateProfileForm(
            createAccount: createAccount,
          ),
        ));
  }
}

class _CreateProfileForm extends StatefulWidget {
  final CreateAccount createAccount;

  const _CreateProfileForm({Key key, this.createAccount}) : super(key: key);
  @override
  __CreateProfileFormState createState() => __CreateProfileFormState();
}

class __CreateProfileFormState extends State<_CreateProfileForm> {
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();
  String selectedGender;
  String selecteDob;

  LocalDataHelper localDataHelper = LocalDataHelper();
  final ImagePicker _picker = ImagePicker();
  File _file;
  Inquiry _inquiry;

  @override
  void initState() {
    super.initState();
    _addToken();
    initializeIdentity();
  }

  _addToken() async {
    var token = await localDataHelper.getStringValue(key: "token");
    NotificationHelper helper = NotificationHelper();
    var fcmToken = await helper.getToken();
    print("fcm fcm fcm fcm fcm fcm fcm:$fcmToken");
    // widget.createAccount.token = token;
    widget.createAccount.fcmToken = fcmToken;
  }

  initializeIdentity() {
    _inquiry = Inquiry(
      configuration: TemplateIdConfiguration(
        templateId: "tmpl_ozisNsJmFW9rcyEoR7jDgo6v",
        environment: InquiryEnvironment.sandbox,
        fields: InquiryFields(
          name: InquiryName(first: "John", middle: "Apple", last: "Seed"),
          additionalFields: {"test-1": "test-2", "test-3": 2, "test-4": true},
        ),
        iOSTheme: InquiryTheme(
          accentColor: Color(0xff22CB8E),
          primaryColor: Color(0xff22CB8E),
          buttonBackgroundColor: Color(0xff22CB8E),
          darkPrimaryColor: Color(0xff167755),
          buttonCornerRadius: 8,
          textFieldCornerRadius: 0,
        ),
      ),
      onSuccess: (
        String inquiryId,
        InquiryAttributes attributes,
        InquiryRelationships relationships,
      ) {
        print("onSuccess");
        print("- inquiryId: $inquiryId");
        print("- attributes:");
        print("-- name.first: ${attributes.name.first}");
        print("-- name.middle: ${attributes.name.middle}");
        print("-- name.last: ${attributes.name.last}");
        print("-- addr.street1: ${attributes.address.street1}");
        print("-- addr.street2: ${attributes.address.street2}");
        print("-- addr.city: ${attributes.address.city}");
        print("-- addr.postalCode: ${attributes.address.postalCode}");
        print("-- addr.countryCode: ${attributes.address.countryCode}");
        print("-- addr.subdivision: ${attributes.address.subdivision}");
        print("-- addr.subdivisionAbbr: ${attributes.address.subdivisionAbbr}");
        print("-- birthdate: ${attributes.birthdate.toString()}");
        print("- relationships:");

        for (var item in relationships.verifications) {
          print("-- id: ${item.id}");
          print("-- status: ${item.status}");
          print("-- type: ${item.type}");
        }
      },
      onFailed: (
        String inquiryId,
        InquiryAttributes attributes,
        InquiryRelationships relationships,
      ) {
        print("onFailed");
        print("- inquiryId: $inquiryId");
      },
      onCancelled: () {
        print("onCancelled");
      },
      onError: (String error) {
        print("onError");
        print("- $error");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(
        "createAccount createAccount createAccount createAccountBUIKLLLLLLDDDDDD:${widget.createAccount.toJson()}");
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              width: size.width,
              height: size.height,
              color: MyTheme.secondryColor,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          "Personal Details",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Are you there right now?",
                          style: TextStyle(
                              height: 2,
                              color: MyTheme.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing:
                            // _addImage()
                            _ImageForm()
                        //  _file == null ?_addImage() : _viewImage(_file)
                        ),

                    SizedBox(height: 10),

                    SizedBox(height: 25),
                    BuildEditTextField(
                      inputType: TextInputType.text,
                      controller: _firstNameController,
                      hint: "First Name",
                      prefixIconAsset: 'assets/icons/firstName.png',
                      onChanged: (val) {
                        widget.createAccount.firstName = val;
                      },
                    ),
                    SizedBox(height: 15),
                    BuildEditTextField(
                      inputType: TextInputType.text,
                      controller: _lastNameController,
                      hint: "Last Name",
                      prefixIconAsset: 'assets/icons/firstName.png',
                      onChanged: (val) {
                        widget.createAccount.lastName = val;
                      },
                    ),
                    SizedBox(height: 10),
                    bobAndGender(size),
                    SizedBox(height: 10),
                    // BuildEditTextField(
                    //   inputType: TextInputType.number,
                    //   controller: _emailController,
                    //   hint: "Country Code",
                    //   prefixIconAsset: 'assets/icons/countryCode.png',
                    //   onChanged: (val) {
                    //     widget.createAccount.countryCode = "+$val";
                    //   },
                    // ),
                    BuildDropDown(
                        onSelectItem: (val) {
                          setState(() {
                            widget.createAccount.dob = val;
                            selecteDob = val;
                          });
                        },
                        items: ["DOB1", "DOB2", "DOB3"],
                        selectedItem: selecteDob,
                        category: "country",
                        widthSize: 50,
                        assetPrefixIcon: 'assets/icons/countryCode.png',
                        dropDownWidget: new PopupMenuButton(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              new PopupMenuItem<String>(
                                  child: new Text('+91'),
                                  value: '+91'),
                              new PopupMenuItem<String>(
                                  child: new Text('+98'),
                                  value: '+98'),
                              new PopupMenuItem<String>(
                                  child: new Text('+23'),
                                  value: '+23'),
                            ],
                            onSelected: (val) {
                              setState(() {
                                selecteDob = val;
                              });
                            })),
                    SizedBox(height: 15),
                    BuildEditTextField(
                      inputType: TextInputType.number,
                      controller: _phoneNumberController,
                      hint: "Phone Number",
                      prefixIconAsset: 'assets/icons/phone.png',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        new LengthLimitingTextInputFormatter(10),
                      ],
                      onChanged: (val) {
                        widget.createAccount.phone = val;
                      },
                    ),
                    SizedBox(height: 5),
                    //  SizedBox(height: 10),
                    Text(
                      "Verify your identity",
                      style: TextStyle(
                          height: 2,
                          color: MyTheme.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextIconButton(
                      onPressed: () {
                        _inquiry.start();
                      },
                      height: size.height * 0.06,
                      width: size.width,
                      text: "Click to Verify",
                      buttonColor: MyTheme.primaryColor,
                      childcolor: MyTheme.secondryColor,
                      iconAsset: "assets/icons/camera.png",
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          new Expanded(
           child: new Align(
              alignment: Alignment.bottomCenter,
              child: _CreateProfileButton(
                createAccount: widget.createAccount,
              )
            )
          )
          //  _bottomButton(size)
        ],
      ),
    );
  }

  _addImage() {
    return InkWell(
      onTap: () {
        _pickImage();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(color: MyTheme.primaryColor, shape: BoxShape.circle),
        child: Icon(
          Icons.camera_alt,
          color: MyTheme.secondryColor,
        ),
      ),
    );
  }

  _viewImage(File file) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: MyTheme.primaryColor,
          shape: BoxShape.circle,
          image: DecorationImage(image: FileImage(file), fit: BoxFit.cover)),
    );
  }

  _pickImage() async {
    Apis apis = Apis();
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _file = File(pickedFile.path);
    });
    if (_file != null) {
      //  StreamSubscription streamSubscription;
      var response = await apis.upload(file: pickedFile.path);

      //  var  value =  response.stream.transform(utf8.decoder).listen(t);
      //  Map res = json.decode(value);
      print("tttttttttttttttttttttt_$response");
      //  print("${res['data']['image'][0]}");

      // response.stream.transform(utf8.decoder).listen((value) {
      //   print(value);
      //  Map res = json.decode(value);
      //   print("tttttttttttttttttttttt_$res");
      //  print("${res['data']['image'][0]}");

      // });

    }
  }

  bobAndGender(Size size) {
    return Container(
      height: 55,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // width: size.width * 0.4,
            child: BuildDropDown(
                onSelectItem: (val) {
                  setState(() {
                    widget.createAccount.dob = val;
                    selecteDob = val;
                  });
                },
                items: ["DOB1", "DOB2", "DOB3"],
                selectedItem: selecteDob,
                category: "DOB",
                widthSize: 50,
                assetPrefixIcon: "assets/icons/DOB.png",
                dropDownWidget: new PopupMenuButton(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: new Text('12/12/1996'),
                              value: '12/12/1996'),
                          new PopupMenuItem<String>(
                              child: new Text('12/09/1997'),
                              value: '12/09/1997'),
                          new PopupMenuItem<String>(
                              child: new Text('11/10/1996'),
                              value: '11/10/1996'),
                        ],
                    onSelected: (val) {
                      setState(() {
                        selecteDob = val;
                      });
                    })),
          ),
          Expanded(
            child: BuildDropDown(
                onSelectItem: (val) {
                  setState(() {
                    widget.createAccount.gender = val;
                    selectedGender = val;
                  });
                },
                items: [
                  "Male",
                  "Female",
                ],
                selectedItem: selectedGender,
                category: "Gender",
                widthSize: 50,
                assetPrefixIcon: "assets/icons/gender.png",
                dropDownWidget: new PopupMenuButton(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: new Text('Male'), value: 'Male'),
                          new PopupMenuItem<String>(
                              child: new Text('Female'), value: 'Female'),
                        ],
                    onSelected: (val) {
                      setState(() {
                        selectedGender = val;
                      });
                    })),
          ),
        ],
      ),
    );
  }
}

class _ImageForm extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      // buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.registrationStatus == RegistrationStatus.uploadingImage
            ? CircularProgressIndicator()
            // : _addImage(context);
            : state.registrationStatus == RegistrationStatus.uploadedImage
                ? _viewImage(state.data['image'][0])
                : _addImage(context);
      },
    );
  }

  _addImage(BuildContext context) {
    return InkWell(
      onTap: () {
        _pickImage(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(color: MyTheme.primaryColor, shape: BoxShape.circle),
        child: Icon(
          Icons.camera_alt,
          color: MyTheme.secondryColor,
        ),
      ),
    );
  }

  _viewImage(String image) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: MyTheme.primaryColor,
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }

  _pickImage(BuildContext context) async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    context.read<CreateAccountBloc>().add(UploadImage(pickedFile.path));
  }
}

class _CreateProfileButton extends StatelessWidget {
  final CreateAccount createAccount;

  const _CreateProfileButton({Key key, this.createAccount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      // buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.registrationStatus == RegistrationStatus.processing //sendingOTP
            ? _Processing()
            : _bottomButton(size, context, createAccount);
      },
    );
  }

  _bottomButton(Size size, BuildContext context, CreateAccount createAccount) {
    return InkWell(
      onTap: () {
        context.read<CreateAccountBloc>().createAccount = createAccount;
        // context.read<CreateAccountBloc>().add(SendOTP(createAccount));
        context.read<CreateAccountBloc>().add(UpdateUser(createAccount));
        

        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => VerifyAccountScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: MyTheme.primaryColor,
        ),
        child: Text(
          "CREATE PROFILE",
          style: TextStyle(
              color: MyTheme.secondryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}

class _Processing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
