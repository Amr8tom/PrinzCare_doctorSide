// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `DOCTOR.IO`
  String get appName {
    return Intl.message(
      'DOCTOR.IO',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Craft your profile,\nGet appointments, Accept them,\nProvide consultation, Make Money`
  String get craftYourProfileEtc {
    return Intl.message(
      'Craft your profile,\nGet appointments, Accept them,\nProvide consultation, Make Money',
      name: 'craftYourProfileEtc',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to continue.\nWe will send an OTP for verification`
  String get enterYourPhoneNumberEtc {
    return Intl.message(
      'Enter your phone number to continue.\nWe will send an OTP for verification',
      name: 'enterYourPhoneNumberEtc',
      desc: '',
      args: [],
    );
  }

  /// `Phone Verification`
  String get phoneVerification {
    return Intl.message(
      'Phone Verification',
      name: 'phoneVerification',
      desc: '',
      args: [],
    );
  }

  /// `We have sent OTP verification code\non phone number you entered.`
  String get weHaveSentOtpEtc {
    return Intl.message(
      'We have sent OTP verification code\non phone number you entered.',
      name: 'weHaveSentOtpEtc',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your OTP`
  String get enterYourOtp {
    return Intl.message(
      'Enter Your OTP',
      name: 'enterYourOtp',
      desc: '',
      args: [],
    );
  }

  String get noNotifications {
    return Intl.message(
      'No Notifications Till Now',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Enter Mobile number`
  String get enterMobileNumber {
    return Intl.message(
      'Enter Mobile number',
      name: 'enterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get reSend {
    return Intl.message(
      'Resend',
      name: 'reSend',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Registration`
  String get doctorRegistration {
    return Intl.message(
      'Doctor Registration',
      name: 'doctorRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get selectGender {
    return Intl.message(
      'Select Gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Your Name (Name & Surname)`
  String get yourName {
    return Intl.message(
      'Your Name (Name & Surname)',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number has been verified`
  String get yourPhoneNumberEtc {
    return Intl.message(
      'Your phone number has been verified',
      name: 'yourPhoneNumberEtc',
      desc: '',
      args: [],
    );
  }

  /// `Dr.`
  String get dr {
    return Intl.message(
      'Dr.',
      name: 'dr',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Category`
  String get selectYourCategory {
    return Intl.message(
      'Select Your Category',
      name: 'selectYourCategory',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Your category is not available?`
  String get yourCategoryIsNotEtc {
    return Intl.message(
      'Your category is not available?',
      name: 'yourCategoryIsNotEtc',
      desc: '',
      args: [],
    );
  }

  /// `Suggest Us`
  String get suggestUs {
    return Intl.message(
      'Suggest Us',
      name: 'suggestUs',
      desc: '',
      args: [],
    );
  }

  /// `Suggest Category`
  String get suggestCategory {
    return Intl.message(
      'Suggest Category',
      name: 'suggestCategory',
      desc: '',
      args: [],
    );
  }

  /// `Enter the category you want to add`
  String get enterTheCategoryEtc {
    return Intl.message(
      'Enter the category you want to add',
      name: 'enterTheCategoryEtc',
      desc: '',
      args: [],
    );
  }

  /// `Enter category name`
  String get enterCategoryName {
    return Intl.message(
      'Enter category name',
      name: 'enterCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Explain us about it..`
  String get explainUsAboutIt {
    return Intl.message(
      'Explain us about it..',
      name: 'explainUsAboutIt',
      desc: '',
      args: [],
    );
  }

  /// `Add your designation`
  String get addYourDesignation {
    return Intl.message(
      'Add your designation',
      name: 'addYourDesignation',
      desc: '',
      args: [],
    );
  }

  /// `Add your degrees to display them here on your profile`
  String get addYourDegreesEtc {
    return Intl.message(
      'Add your degrees to display them here on your profile',
      name: 'addYourDegreesEtc',
      desc: '',
      args: [],
    );
  }

  /// `Designation (EG: Senior Pediatric Surgeon)`
  String get designationEtc {
    return Intl.message(
      'Designation (EG: Senior Pediatric Surgeon)',
      name: 'designationEtc',
      desc: '',
      args: [],
    );
  }

  /// `Enter designation`
  String get enterDesignation {
    return Intl.message(
      'Enter designation',
      name: 'enterDesignation',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Degrees : Separated by ( , )`
  String get enterYourDegreesEtc {
    return Intl.message(
      'Enter Your Degrees : Separated by ( , )',
      name: 'enterYourDegreesEtc',
      desc: '',
      args: [],
    );
  }

  /// `Example : MS( General Surgery) from AIMS, BG nagara`
  String get exampleMsEtc {
    return Intl.message(
      'Example : MS( General Surgery) from AIMS, BG nagara',
      name: 'exampleMsEtc',
      desc: '',
      args: [],
    );
  }

  /// `Enter degrees..`
  String get enterDegrees {
    return Intl.message(
      'Enter degrees..',
      name: 'enterDegrees',
      desc: '',
      args: [],
    );
  }

  /// `Languages You Speak : Separated by ( , )`
  String get languagesYouSpeakEtc {
    return Intl.message(
      'Languages You Speak : Separated by ( , )',
      name: 'languagesYouSpeakEtc',
      desc: '',
      args: [],
    );
  }

  /// `Example : Hindi, English, French`
  String get exampleLanguage {
    return Intl.message(
      'Example : Hindi, English, French',
      name: 'exampleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Enter languages..`
  String get enterLanguages {
    return Intl.message(
      'Enter languages..',
      name: 'enterLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Years Of Experience`
  String get yearsOfExperience {
    return Intl.message(
      'Years Of Experience',
      name: 'yearsOfExperience',
      desc: '',
      args: [],
    );
  }

  /// `Number of years`
  String get numberOfYears {
    return Intl.message(
      'Number of years',
      name: 'numberOfYears',
      desc: '',
      args: [],
    );
  }

  /// `Consultation Fees`
  String get consultationFee {
    return Intl.message(
      'Consultation Fees',
      name: 'consultationFee',
      desc: '',
      args: [],
    );
  }

  /// `You can change this later whenever you want`
  String get youCanChangeThisEtc {
    return Intl.message(
      'You can change this later whenever you want',
      name: 'youCanChangeThisEtc',
      desc: '',
      args: [],
    );
  }

  /// `About Yourself`
  String get aboutYourSelf {
    return Intl.message(
      'About Yourself',
      name: 'aboutYourSelf',
      desc: '',
      args: [],
    );
  }

  /// `Explain about yourself briefly`
  String get explainAboutYourSelfBriefly {
    return Intl.message(
      'Explain about yourself briefly',
      name: 'explainAboutYourSelfBriefly',
      desc: '',
      args: [],
    );
  }

  /// `Your Educational Journey`
  String get yourEducationalJourney {
    return Intl.message(
      'Your Educational Journey',
      name: 'yourEducationalJourney',
      desc: '',
      args: [],
    );
  }

  /// `Explain briefly for better idea`
  String get explainBrieflyForBetterIdea {
    return Intl.message(
      'Explain briefly for better idea',
      name: 'explainBrieflyForBetterIdea',
      desc: '',
      args: [],
    );
  }

  /// `Enter here...`
  String get enterHere {
    return Intl.message(
      'Enter here...',
      name: 'enterHere',
      desc: '',
      args: [],
    );
  }

  /// `Choose Consultation Type`
  String get chooseConsultationType {
    return Intl.message(
      'Choose Consultation Type',
      name: 'chooseConsultationType',
      desc: '',
      args: [],
    );
  }

  /// `You can change this later`
  String get youCanChangeThisLater {
    return Intl.message(
      'You can change this later',
      name: 'youCanChangeThisLater',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `At Clinic`
  String get atClinic {
    return Intl.message(
      'At Clinic',
      name: 'atClinic',
      desc: '',
      args: [],
    );
  }

  /// `At Home`
  String get atHome {
    return Intl.message(
      'At Home',
      name: 'atHome',
      desc: '',
      args: [],
    );
  }

  /// `Add Clinic details`
  String get addClinicDetails {
    return Intl.message(
      'Add Clinic details',
      name: 'addClinicDetails',
      desc: '',
      args: [],
    );
  }

  /// `Where you will be consulting patients`
  String get whereYouWillBeConsultingPatients {
    return Intl.message(
      'Where you will be consulting patients',
      name: 'whereYouWillBeConsultingPatients',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Address`
  String get clinicAddress {
    return Intl.message(
      'Clinic Address',
      name: 'clinicAddress',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Name`
  String get clinicName {
    return Intl.message(
      'Clinic Name',
      name: 'clinicName',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Location`
  String get clinicLocation {
    return Intl.message(
      'Clinic Location',
      name: 'clinicLocation',
      desc: '',
      args: [],
    );
  }

  /// `Click to fetch location`
  String get clickToFetchLocation {
    return Intl.message(
      'Click to fetch location',
      name: 'clickToFetchLocation',
      desc: '',
      args: [],
    );
  }

  /// `DOCTOR`
  String get doctor {
    return Intl.message(
      'DOCTOR',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Submission Successful`
  String get submissionSuccessful {
    return Intl.message(
      'Submission Successful',
      name: 'submissionSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Request ID : `
  String get requestId {
    return Intl.message(
      'Request ID : ',
      name: 'requestId',
      desc: '',
      args: [],
    );
  }

  /// `All of the details you have submitted\nhas been received by us.\nwe will check and update you on this\nonce we have an update for you.`
  String get desc1 {
    return Intl.message(
      'All of the details you have submitted\nhas been received by us.\nwe will check and update you on this\nonce we have an update for you.',
      name: 'desc1',
      desc: '',
      args: [],
    );
  }

  /// `It will take around 3 to 4 business\ndays to check and verify your profile`
  String get desc2 {
    return Intl.message(
      'It will take around 3 to 4 business\ndays to check and verify your profile',
      name: 'desc2',
      desc: '',
      args: [],
    );
  }

  /// `Write us on below details if you\nhave any questions and queries.`
  String get desc3 {
    return Intl.message(
      'Write us on below details if you\nhave any questions and queries.',
      name: 'desc3',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Call Now`
  String get callNow {
    return Intl.message(
      'Call Now',
      name: 'callNow',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Select Month`
  String get selectMonth {
    return Intl.message(
      'Select Month',
      name: 'selectMonth',
      desc: '',
      args: [],
    );
  }

  /// `Jan`
  String get jan {
    return Intl.message(
      'Jan',
      name: 'jan',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get feb {
    return Intl.message(
      'Feb',
      name: 'feb',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get mar {
    return Intl.message(
      'Mar',
      name: 'mar',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get apr {
    return Intl.message(
      'Apr',
      name: 'apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get jun {
    return Intl.message(
      'June',
      name: 'jun',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get jul {
    return Intl.message(
      'July',
      name: 'jul',
      desc: '',
      args: [],
    );
  }

  /// `Aug`
  String get aug {
    return Intl.message(
      'Aug',
      name: 'aug',
      desc: '',
      args: [],
    );
  }

  /// `Sept`
  String get sep {
    return Intl.message(
      'Sept',
      name: 'sep',
      desc: '',
      args: [],
    );
  }

  /// `Oct`
  String get oct {
    return Intl.message(
      'Oct',
      name: 'oct',
      desc: '',
      args: [],
    );
  }

  /// `Nov`
  String get nov {
    return Intl.message(
      'Nov',
      name: 'nov',
      desc: '',
      args: [],
    );
  }

  /// `Dec`
  String get dec {
    return Intl.message(
      'Dec',
      name: 'dec',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message(
      'Manage',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `There is nothing to show.\n`
  String get thereIsNothingToShow {
    return Intl.message(
      'There is nothing to show.\n',
      name: 'thereIsNothingToShow',
      desc: '',
      args: [],
    );
  }

  /// `Please add some `
  String get pleaseAddSome {
    return Intl.message(
      'Please add some ',
      name: 'pleaseAddSome',
      desc: '',
      args: [],
    );
  }

  /// ` to your profile.`
  String get toYourProfile {
    return Intl.message(
      ' to your profile.',
      name: 'toYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `About dr.`
  String get aboutDr {
    return Intl.message(
      'About dr.',
      name: 'aboutDr',
      desc: '',
      args: [],
    );
  }

  /// `Happy patient`
  String get happyPatients {
    return Intl.message(
      'Happy patient',
      name: 'happyPatients',
      desc: '',
      args: [],
    );
  }

  /// `Example : Hypertension Treatment, Obesity Treatment`
  String get exampleHypertensionEtc {
    return Intl.message(
      'Example : Hypertension Treatment, Obesity Treatment',
      name: 'exampleHypertensionEtc',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get addService {
    return Intl.message(
      'Add Service',
      name: 'addService',
      desc: '',
      args: [],
    );
  }

  /// `Services location`
  String get servicesLocation {
    return Intl.message(
      'Services location',
      name: 'servicesLocation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Vacation Mode`
  String get vacationMode {
    return Intl.message(
      'Vacation Mode',
      name: 'vacationMode',
      desc: '',
      args: [],
    );
  }

  /// `Keeping it off, your profile will not be shown\nto the patients until turned on`
  String get keepingItOffYourProfileEtc {
    return Intl.message(
      'Keeping it off, your profile will not be shown\nto the patients until turned on',
      name: 'keepingItOffYourProfileEtc',
      desc: '',
      args: [],
    );
  }

  /// `Keep it On, if you want to receive notifications`
  String get keepItOnIfYouWantEtc {
    return Intl.message(
      'Keep it On, if you want to receive notifications',
      name: 'keepItOnIfYouWantEtc',
      desc: '',
      args: [],
    );
  }

  /// `Push Notification`
  String get pushNotification {
    return Intl.message(
      'Push Notification',
      name: 'pushNotification',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Details`
  String get editProfileDetails {
    return Intl.message(
      'Edit Profile Details',
      name: 'editProfileDetails',
      desc: '',
      args: [],
    );
  }

  /// `Appointment History`
  String get appointmentHistory {
    return Intl.message(
      'Appointment History',
      name: 'appointmentHistory',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Slots`
  String get appointmentSlots {
    return Intl.message(
      'Appointment Slots',
      name: 'appointmentSlots',
      desc: '',
      args: [],
    );
  }

  /// `Manage Holidays`
  String get manageHolidays {
    return Intl.message(
      'Manage Holidays',
      name: 'manageHolidays',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Payouts`
  String get payouts {
    return Intl.message(
      'Payouts',
      name: 'payouts',
      desc: '',
      args: [],
    );
  }

  /// `Terms Of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms Of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Bank Details`
  String get bankDetails {
    return Intl.message(
      'Bank Details',
      name: 'bankDetails',
      desc: '',
      args: [],
    );
  }

  /// `Earning Report`
  String get earningReport {
    return Intl.message(
      'Earning Report',
      name: 'earningReport',
      desc: '',
      args: [],
    );
  }

  /// `Help & FAQs`
  String get helpAndFAQs {
    return Intl.message(
      'Help & FAQs',
      name: 'helpAndFAQs',
      desc: '',
      args: [],
    );
  }

  /// `Delete My Account`
  String get deleteMyAccount {
    return Intl.message(
      'Delete My Account',
      name: 'deleteMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get profileDetails {
    return Intl.message(
      'Profile Details',
      name: 'profileDetails',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `About Yourself / Education`
  String get aboutYourselfEducation {
    return Intl.message(
      'About Yourself / Education',
      name: 'aboutYourselfEducation',
      desc: '',
      args: [],
    );
  }

  /// `Consultation Type`
  String get consultationType {
    return Intl.message(
      'Consultation Type',
      name: 'consultationType',
      desc: '',
      args: [],
    );
  }

  /// `Expertise`
  String get expertise {
    return Intl.message(
      'Expertise',
      name: 'expertise',
      desc: '',
      args: [],
    );
  }

  /// `Service Locations`
  String get serviceLocations {
    return Intl.message(
      'Service Locations',
      name: 'serviceLocations',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Name`
  String get enterYourName {
    return Intl.message(
      'Enter your Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Your Country (You are serving)`
  String get yourCountry {
    return Intl.message(
      'Your Country (You are serving)',
      name: 'yourCountry',
      desc: '',
      args: [],
    );
  }

  /// `About/Education`
  String get aboutAndEducation {
    return Intl.message(
      'About/Education',
      name: 'aboutAndEducation',
      desc: '',
      args: [],
    );
  }

  /// `Manage Services`
  String get manageServices {
    return Intl.message(
      'Manage Services',
      name: 'manageServices',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Hospital Address`
  String get hospitalAddress {
    return Intl.message(
      'Hospital Address',
      name: 'hospitalAddress',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Add appointment slots by week days`
  String get addAppointmentSlotsByWeekDays {
    return Intl.message(
      'Add appointment slots by week days',
      name: 'addAppointmentSlotsByWeekDays',
      desc: '',
      args: [],
    );
  }

  /// `Hospital Name`
  String get hospitalName {
    return Intl.message(
      'Hospital Name',
      name: 'hospitalName',
      desc: '',
      args: [],
    );
  }

  /// `Add Service Location`
  String get addServiceLocation {
    return Intl.message(
      'Add Service Location',
      name: 'addServiceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Add Hospitals Where You Visit (Optional)`
  String get addHospitalsWhereYouEtc {
    return Intl.message(
      'Add Hospitals Where You Visit (Optional)',
      name: 'addHospitalsWhereYouEtc',
      desc: '',
      args: [],
    );
  }

  /// `This helps patients to take a visit to you directly on those locations.`
  String get thisHelpsPatientsToEtc {
    return Intl.message(
      'This helps patients to take a visit to you directly on those locations.',
      name: 'thisHelpsPatientsToEtc',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `On those days, Patients would not be able to book appointments for consultation`
  String get onThoseDaysPatientsEtc {
    return Intl.message(
      'On those days, Patients would not be able to book appointments for consultation',
      name: 'onThoseDaysPatientsEtc',
      desc: '',
      args: [],
    );
  }

  /// `Add your holidays here`
  String get addYourHolidaysHere {
    return Intl.message(
      'Add your holidays here',
      name: 'addYourHolidaysHere',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get withdraw {
    return Intl.message(
      'Withdraw',
      name: 'withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Statement`
  String get statement {
    return Intl.message(
      'Statement',
      name: 'statement',
      desc: '',
      args: [],
    );
  }

  /// `Commission`
  String get commission {
    return Intl.message(
      'Commission',
      name: 'commission',
      desc: '',
      args: [],
    );
  }

  /// `Earning`
  String get earning {
    return Intl.message(
      'Earning',
      name: 'earning',
      desc: '',
      args: [],
    );
  }

  /// `Total Earnings`
  String get totalEarnings {
    return Intl.message(
      'Total Earnings',
      name: 'totalEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Total Orders`
  String get totalOrders {
    return Intl.message(
      'Total Orders',
      name: 'totalOrders',
      desc: '',
      args: [],
    );
  }

  /// `Payout History`
  String get payoutHistory {
    return Intl.message(
      'Payout History',
      name: 'payoutHistory',
      desc: '',
      args: [],
    );
  }

  /// `Add Bank Details`
  String get addBankDetails {
    return Intl.message(
      'Add Bank Details',
      name: 'addBankDetails',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get bankName {
    return Intl.message(
      'Bank Name',
      name: 'bankName',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get accountNumber {
    return Intl.message(
      'Account Number',
      name: 'accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled Cheque Photo`
  String get cancelledChequePhoto {
    return Intl.message(
      'Cancelled Cheque Photo',
      name: 'cancelledChequePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Swift Code`
  String get swiftCode {
    return Intl.message(
      'Swift Code',
      name: 'swiftCode',
      desc: '',
      args: [],
    );
  }

  /// `Holders Name`
  String get holdersName {
    return Intl.message(
      'Holders Name',
      name: 'holdersName',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter Account Number`
  String get reEnterAccountNumber {
    return Intl.message(
      'Re-Enter Account Number',
      name: 'reEnterAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Consultation Charge`
  String get consultationCharge {
    return Intl.message(
      'Consultation Charge',
      name: 'consultationCharge',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Discount`
  String get couponDiscount {
    return Intl.message(
      'Coupon Discount',
      name: 'couponDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Previous Appointments`
  String get previousAppointments {
    return Intl.message(
      'Previous Appointments',
      name: 'previousAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Click to see previous appointments with you`
  String get clickToSeePreviousEtc {
    return Intl.message(
      'Click to see previous appointments with you',
      name: 'clickToSeePreviousEtc',
      desc: '',
      args: [],
    );
  }

  /// `Problem`
  String get problem {
    return Intl.message(
      'Problem',
      name: 'problem',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get attachments {
    return Intl.message(
      'Attachments',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Medical Prescription`
  String get medicalPrescription {
    return Intl.message(
      'Medical Prescription',
      name: 'medicalPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Details`
  String get appointmentDetails {
    return Intl.message(
      'Appointment Details',
      name: 'appointmentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Create prescription for`
  String get createPrescriptionFor {
    return Intl.message(
      'Create prescription for',
      name: 'createPrescriptionFor',
      desc: '',
      args: [],
    );
  }

  /// `After Meal`
  String get afterMeal {
    return Intl.message(
      'After Meal',
      name: 'afterMeal',
      desc: '',
      args: [],
    );
  }

  /// `Before Meal`
  String get beforeMeal {
    return Intl.message(
      'Before Meal',
      name: 'beforeMeal',
      desc: '',
      args: [],
    );
  }

  /// `Add Medicine`
  String get addMedicine {
    return Intl.message(
      'Add Medicine',
      name: 'addMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosed With`
  String get diagnosedWith {
    return Intl.message(
      'Diagnosed With',
      name: 'diagnosedWith',
      desc: '',
      args: [],
    );
  }

  /// `Medicine name`
  String get medicalName {
    return Intl.message(
      'Medicine name',
      name: 'medicalName',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get medicine {
    return Intl.message(
      'Medicine',
      name: 'medicine',
      desc: '',
      args: [],
    );
  }

  /// `Total Units`
  String get totalUnits {
    return Intl.message(
      'Total Units',
      name: 'totalUnits',
      desc: '',
      args: [],
    );
  }

  /// `Extra Notes`
  String get extraNotes {
    return Intl.message(
      'Extra Notes',
      name: 'extraNotes',
      desc: '',
      args: [],
    );
  }

  /// `Dosage Details (Timing, Unit)`
  String get dosageDetailsEtc {
    return Intl.message(
      'Dosage Details (Timing, Unit)',
      name: 'dosageDetailsEtc',
      desc: '',
      args: [],
    );
  }

  /// `Timing, Unit. (EG: Twice a day, 1 tablet) `
  String get timingUnitEtc {
    return Intl.message(
      'Timing, Unit. (EG: Twice a day, 1 tablet) ',
      name: 'timingUnitEtc',
      desc: '',
      args: [],
    );
  }

  /// `Quantity (Total Count)`
  String get quantityEtc {
    return Intl.message(
      'Quantity (Total Count)',
      name: 'quantityEtc',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Write here`
  String get writeHere {
    return Intl.message(
      'Write here',
      name: 'writeHere',
      desc: '',
      args: [],
    );
  }

  /// `Note: Only if you feel fever and headache`
  String get noteOnlyIfYouEtc {
    return Intl.message(
      'Note: Only if you feel fever and headache',
      name: 'noteOnlyIfYouEtc',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Location Fetched`
  String get locationFetched {
    return Intl.message(
      'Location Fetched',
      name: 'locationFetched',
      desc: '',
      args: [],
    );
  }

  /// `QR Scan`
  String get qRScan {
    return Intl.message(
      'QR Scan',
      name: 'qRScan',
      desc: '',
      args: [],
    );
  }

  /// `Scan the booking QR to get the details\nquickly`
  String get scanTheBookingQREtc {
    return Intl.message(
      'Scan the booking QR to get the details\nquickly',
      name: 'scanTheBookingQREtc',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Patient's Feedback`
  String get patientFeedback {
    return Intl.message(
      'Patient\'s Feedback',
      name: 'patientFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Please enter mobile number`
  String get pleaseEnterMobileNumber {
    return Intl.message(
      'Please enter mobile number',
      name: 'pleaseEnterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Map Screen`
  String get mapScreen {
    return Intl.message(
      'Map Screen',
      name: 'mapScreen',
      desc: '',
      args: [],
    );
  }

  /// `My Current Location`
  String get myCurrentLocation {
    return Intl.message(
      'My Current Location',
      name: 'myCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Profile Image`
  String get pleaseSelectProfileImage {
    return Intl.message(
      'Please Select Profile Image',
      name: 'pleaseSelectProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Designation`
  String get pleaseEnterDesignation {
    return Intl.message(
      'Please Enter Designation',
      name: 'pleaseEnterDesignation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Degree`
  String get pleaseEnterDegree {
    return Intl.message(
      'Please Enter Degree',
      name: 'pleaseEnterDegree',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Languages`
  String get pleaseEnterLanguages {
    return Intl.message(
      'Please Enter Languages',
      name: 'pleaseEnterLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter year of Experience`
  String get pleaseEnterYearOfExperience {
    return Intl.message(
      'Please Enter year of Experience',
      name: 'pleaseEnterYearOfExperience',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Consultation Fee`
  String get pleaseEnterConsultationFee {
    return Intl.message(
      'Please Enter Consultation Fee',
      name: 'pleaseEnterConsultationFee',
      desc: '',
      args: [],
    );
  }

  /// `Location Fetch Successfully`
  String get locationFetchSuccessfully {
    return Intl.message(
      'Location Fetch Successfully',
      name: 'locationFetchSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Location Not Fetch`
  String get locationNotFetch {
    return Intl.message(
      'Location Not Fetch',
      name: 'locationNotFetch',
      desc: '',
      args: [],
    );
  }

  /// `Choose one Consultation type`
  String get chooseOneConsultationType {
    return Intl.message(
      'Choose one Consultation type',
      name: 'chooseOneConsultationType',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter clinic name`
  String get pleaseEnterClinicName {
    return Intl.message(
      'Please Enter clinic name',
      name: 'pleaseEnterClinicName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter clinic address`
  String get pleaseEnterClinicAddress {
    return Intl.message(
      'Please Enter clinic address',
      name: 'pleaseEnterClinicAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Education YourSelf`
  String get pleaseEnterEducationYourSelf {
    return Intl.message(
      'Please Enter Education YourSelf',
      name: 'pleaseEnterEducationYourSelf',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter About YourSelf`
  String get pleaseEnterAboutYourSelf {
    return Intl.message(
      'Please Enter About YourSelf',
      name: 'pleaseEnterAboutYourSelf',
      desc: '',
      args: [],
    );
  }

  /// `Add Category Name for suggestion`
  String get addCategoryNameForSuggestion {
    return Intl.message(
      'Add Category Name for suggestion',
      name: 'addCategoryNameForSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Please explain briefly why you add the category`
  String get pleaseExplainBrieflyEtc {
    return Intl.message(
      'Please explain briefly why you add the category',
      name: 'pleaseExplainBrieflyEtc',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Category.`
  String get pleaseSelectCategory {
    return Intl.message(
      'Please Select Category.',
      name: 'pleaseSelectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Name`
  String get pleaseEnterName {
    return Intl.message(
      'Please Enter Name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `FeMale`
  String get feMale {
    return Intl.message(
      'FeMale',
      name: 'feMale',
      desc: '',
      args: [],
    );
  }

  /// `All of the details you have submitted has been received by us.we will check and update you on this once we have an update for you.`
  String get allOfTheDetailsEtc {
    return Intl.message(
      'All of the details you have submitted has been received by us.we will check and update you on this once we have an update for you.',
      name: 'allOfTheDetailsEtc',
      desc: '',
      args: [],
    );
  }

  /// `It will take around 3 to 4 business days to check and verify your profile`
  String get itWillTakeAroundEtc {
    return Intl.message(
      'It will take around 3 to 4 business days to check and verify your profile',
      name: 'itWillTakeAroundEtc',
      desc: '',
      args: [],
    );
  }

  /// `Write us on below details if you have any questions and queries.`
  String get writeUsOnBelowEtc {
    return Intl.message(
      'Write us on below details if you have any questions and queries.',
      name: 'writeUsOnBelowEtc',
      desc: '',
      args: [],
    );
  }

  /// `SMS verification code used to create the phone auth credential is invalid`
  String get smsVerificationCodeEtc {
    return Intl.message(
      'SMS verification code used to create the phone auth credential is invalid',
      name: 'smsVerificationCodeEtc',
      desc: '',
      args: [],
    );
  }

  /// `The provided phone number is not valid.`
  String get theProvidedPhoneEtc {
    return Intl.message(
      'The provided phone number is not valid.',
      name: 'theProvidedPhoneEtc',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your otp.`
  String get pleaseEnterYourOtp {
    return Intl.message(
      'Please enter your otp.',
      name: 'pleaseEnterYourOtp',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Less`
  String get less {
    return Intl.message(
      'Less',
      name: 'less',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Edit Service Location`
  String get editServiceLocation {
    return Intl.message(
      'Edit Service Location',
      name: 'editServiceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Enter Bank Name`
  String get enterBankName {
    return Intl.message(
      'Enter Bank Name',
      name: 'enterBankName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Account Number`
  String get enterAccountName {
    return Intl.message(
      'Enter Account Number',
      name: 'enterAccountName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Re-enter Account Number`
  String get enterReAccountNumber {
    return Intl.message(
      'Enter Re-enter Account Number',
      name: 'enterReAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Holder Name`
  String get enterHolderName {
    return Intl.message(
      'Enter Holder Name',
      name: 'enterHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Swift Code`
  String get enterSwiftCode {
    return Intl.message(
      'Enter Swift Code',
      name: 'enterSwiftCode',
      desc: '',
      args: [],
    );
  }

  /// `Completion OTP`
  String get completionOtp {
    return Intl.message(
      'Completion OTP',
      name: 'completionOtp',
      desc: '',
      args: [],
    );
  }

  /// `Please add cancel cheque photo`
  String get pleaseAddCancelChequePhoto {
    return Intl.message(
      'Please add cancel cheque photo',
      name: 'pleaseAddCancelChequePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Refund`
  String get refund {
    return Intl.message(
      'Refund',
      name: 'refund',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for confirmation`
  String get waitingForConfirmation {
    return Intl.message(
      'Waiting for confirmation',
      name: 'waitingForConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Declined`
  String get declined {
    return Intl.message(
      'Declined',
      name: 'declined',
      desc: '',
      args: [],
    );
  }

  /// `Device Token is Empty Please Refresh The App`
  String get deviceTokenEmpty {
    return Intl.message(
      'Device Token is Empty Please Refresh The App',
      name: 'deviceTokenEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No Holiday`
  String get noHolidayData {
    return Intl.message(
      'No Holiday',
      name: 'noHolidayData',
      desc: '',
      args: [],
    );
  }

  /// `No Request Data`
  String get noRequestData {
    return Intl.message(
      'No Request Data',
      name: 'noRequestData',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `No Address Found`
  String get noAddressFound {
    return Intl.message(
      'No Address Found',
      name: 'noAddressFound',
      desc: '',
      args: [],
    );
  }

  /// `Ratings`
  String get ratings {
    return Intl.message(
      'Ratings',
      name: 'ratings',
      desc: '',
      args: [],
    );
  }

  /// `UnKnown`
  String get unKnown {
    return Intl.message(
      'UnKnown',
      name: 'unKnown',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile is Pending`
  String get yourProfileIsPending {
    return Intl.message(
      'Your Profile is Pending',
      name: 'yourProfileIsPending',
      desc: '',
      args: [],
    );
  }

  /// `PLease Add Services`
  String get pleaseAddServices {
    return Intl.message(
      'PLease Add Services',
      name: 'pleaseAddServices',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `PLease Edit Services`
  String get pleaseEditServices {
    return Intl.message(
      'PLease Edit Services',
      name: 'pleaseEditServices',
      desc: '',
      args: [],
    );
  }

  /// `PLease`
  String get please {
    return Intl.message(
      'PLease',
      name: 'please',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Meal`
  String get pleaseSelectMeal {
    return Intl.message(
      'Please Select Meal',
      name: 'pleaseSelectMeal',
      desc: '',
      args: [],
    );
  }

  /// `Please at Least one medicine add`
  String get pleaseAtLeastOneMedicineAdd {
    return Intl.message(
      'Please at Least one medicine add',
      name: 'pleaseAtLeastOneMedicineAdd',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Extra Notes`
  String get pleaseEnterExtraNotes {
    return Intl.message(
      'Please Enter Extra Notes',
      name: 'pleaseEnterExtraNotes',
      desc: '',
      args: [],
    );
  }

  /// `Earning Per Day`
  String get earningPerDay {
    return Intl.message(
      'Earning Per Day',
      name: 'earningPerDay',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Purchase`
  String get purchase {
    return Intl.message(
      'Purchase',
      name: 'purchase',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message(
      'Sub Total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Payable Amount`
  String get payableAmount {
    return Intl.message(
      'Payable Amount',
      name: 'payableAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please add your bank account details`
  String get pleaseAddYourBankEtc {
    return Intl.message(
      'Please add your bank account details',
      name: 'pleaseAddYourBankEtc',
      desc: '',
      args: [],
    );
  }

  /// `Minimum amount to withdraw`
  String get minimumAmountToWithdraw {
    return Intl.message(
      'Minimum amount to withdraw',
      name: 'minimumAmountToWithdraw',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete your account? all of your data will deleted and you won’t be able to recover it again !\n\nDo you really want to proceed?`
  String get doYouReallyWantToEtc {
    return Intl.message(
      'Do you really want to delete your account? all of your data will deleted and you won’t be able to recover it again !\n\nDo you really want to proceed?',
      name: 'doYouReallyWantToEtc',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?\ndo want to logout?`
  String get areYouSureLogout {
    return Intl.message(
      'Are you sure?\ndo want to logout?',
      name: 'areYouSureLogout',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Doctor block by admin`
  String get doctorBlockByAdmin {
    return Intl.message(
      'Doctor block by admin',
      name: 'doctorBlockByAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Send Media`
  String get sendMedia {
    return Intl.message(
      'Send Media',
      name: 'sendMedia',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for`
  String get waitingFor {
    return Intl.message(
      'Waiting for',
      name: 'waitingFor',
      desc: '',
      args: [],
    );
  }

  /// `Mute Audio`
  String get muteAudio {
    return Intl.message(
      'Mute Audio',
      name: 'muteAudio',
      desc: '',
      args: [],
    );
  }

  /// `Join a channel`
  String get joinAChannel {
    return Intl.message(
      'Join a channel',
      name: 'joinAChannel',
      desc: '',
      args: [],
    );
  }

  /// `Select message`
  String get selectMsg {
    return Intl.message(
      'Select message',
      name: 'selectMsg',
      desc: '',
      args: [],
    );
  }

  /// `Delete message`
  String get deleteMessage {
    return Intl.message(
      'Delete message',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete for me`
  String get deleteForMe {
    return Intl.message(
      'Delete for me',
      name: 'deleteForMe',
      desc: '',
      args: [],
    );
  }

  /// `Delete Chat`
  String get deleteChat {
    return Intl.message(
      'Delete Chat',
      name: 'deleteChat',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get justNow {
    return Intl.message(
      'Just now',
      name: 'justNow',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get minute {
    return Intl.message(
      'Minute',
      name: 'minute',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Weeks`
  String get weeks {
    return Intl.message(
      'Weeks',
      name: 'weeks',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Message will only be removed from this device\nAre you sure?`
  String get messageWillOnlyBeRemovedEtc {
    return Intl.message(
      'Message will only be removed from this device\nAre you sure?',
      name: 'messageWillOnlyBeRemovedEtc',
      desc: '',
      args: [],
    );
  }

  /// `Too Large`
  String get tooLarge {
    return Intl.message(
      'Too Large',
      name: 'tooLarge',
      desc: '',
      args: [],
    );
  }

  /// `Select another`
  String get selectAnother {
    return Intl.message(
      'Select another',
      name: 'selectAnother',
      desc: '',
      args: [],
    );
  }

  /// `This video is greater than 15 mb\nPlease select another...`
  String get thisVideoIsGreaterThan15MbEtc {
    return Intl.message(
      'This video is greater than 15 mb\nPlease select another...',
      name: 'thisVideoIsGreaterThan15MbEtc',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `CONSULTATION`
  String get consultation {
    return Intl.message(
      'CONSULTATION',
      name: 'consultation',
      desc: '',
      args: [],
    );
  }

  /// `is asking you to join the video consultation.`
  String get isAskingYouToJoinEtc {
    return Intl.message(
      'is asking you to join the video consultation.',
      name: 'isAskingYouToJoinEtc',
      desc: '',
      args: [],
    );
  }

  /// `Please wait Your meeting not Start`
  String get pleaseWaitYourMeetingEtc {
    return Intl.message(
      'Please wait Your meeting not Start',
      name: 'pleaseWaitYourMeetingEtc',
      desc: '',
      args: [],
    );
  }

  /// `Meeting end`
  String get meetingEnd {
    return Intl.message(
      'Meeting end',
      name: 'meetingEnd',
      desc: '',
      args: [],
    );
  }

  /// `Join Meeting`
  String get joinMeeting {
    return Intl.message(
      'Join Meeting',
      name: 'joinMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Ended`
  String get endMeeting {
    return Intl.message(
      'Meeting Ended',
      name: 'endMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Empty Category`
  String get emptyCategory {
    return Intl.message(
      'Empty Category',
      name: 'emptyCategory',
      desc: '',
      args: [],
    );
  }

  /// `No Previous Appointment`
  String get noPreviousAppointment {
    return Intl.message(
      'No Previous Appointment',
      name: 'noPreviousAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Awards`
  String get awards {
    return Intl.message(
      'Awards',
      name: 'awards',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `You end the meeting?`
  String get youEndMeeting {
    return Intl.message(
      'You end the meeting?',
      name: 'youEndMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Are you Sure?`
  String get areYouSure {
    return Intl.message(
      'Are you Sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Once you leave channel you can't joined the meeting`
  String get onceYouLeaveChannelYouEtc {
    return Intl.message(
      'Once you leave channel you can\'t joined the meeting',
      name: 'onceYouLeaveChannelYouEtc',
      desc: '',
      args: [],
    );
  }

  /// `Example : Allergists/Immunologists, Anesthesiologists, Cardiologists, Dermatologists, Etc`
  String get exampleAllergistsEtc {
    return Intl.message(
      'Example : Allergists/Immunologists, Anesthesiologists, Cardiologists, Dermatologists, Etc',
      name: 'exampleAllergistsEtc',
      desc: '',
      args: [],
    );
  }

  /// `Example : Dr. B. C. Roy Award, ICMR Lala Ram Chand Kandhari Award, Etc`
  String get exampleAwardEtc {
    return Intl.message(
      'Example : Dr. B. C. Roy Award, ICMR Lala Ram Chand Kandhari Award, Etc',
      name: 'exampleAwardEtc',
      desc: '',
      args: [],
    );
  }

  /// `Example : Hospital Name, Address With Postal Code, Location`
  String get exampleServiceLocation {
    return Intl.message(
      'Example : Hospital Name, Address With Postal Code, Location',
      name: 'exampleServiceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Number Doesn't Match`
  String get yourAccountNumberNotSame {
    return Intl.message(
      'Your Account Number Doesn\'t Match',
      name: 'yourAccountNumberNotSame',
      desc: '',
      args: [],
    );
  }

  /// `If you have added only 2 slots for Monday, then patients can select from those 2 slots for Monday.`
  String get ifYouHaveAddedOnlyEtc {
    return Intl.message(
      'If you have added only 2 slots for Monday, then patients can select from those 2 slots for Monday.',
      name: 'ifYouHaveAddedOnlyEtc',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to logout?`
  String get doYouReallyWantToLogoutEtc {
    return Intl.message(
      'Do you really want to logout?',
      name: 'doYouReallyWantToLogoutEtc',
      desc: '',
      args: [],
    );
  }

  /// `Complete Appointment`
  String get markCompleted {
    return Intl.message(
      'Complete Appointment',
      name: 'markCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Nothing To Show`
  String get nothingToShow {
    return Intl.message(
      'Nothing To Show',
      name: 'nothingToShow',
      desc: '',
      args: [],
    );
  }

  /// `No User`
  String get noUser {
    return Intl.message(
      'No User',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Asking You to Video Consultation`
  String get askingYouToVideoConsultation {
    return Intl.message(
      'Asking You to Video Consultation',
      name: 'askingYouToVideoConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this appointment ?`
  String get doYouWantToDeleteThisAppointment {
    return Intl.message(
      'Do you want to delete this appointment ?',
      name: 'doYouWantToDeleteThisAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message(
      'Select Time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Slot limit`
  String get slotLimit {
    return Intl.message(
      'Slot limit',
      name: 'slotLimit',
      desc: '',
      args: [],
    );
  }
  /// `Slot limit`
  String get slotDuration {
    return Intl.message(
      'Slot Duration',
      name: 'slotDuration',
      desc: '',
      args: [],
    );
  }

  /// `Appointment, Online Diagnostic, Booking, Management Multi-Vendor App`
  String get appointmentOnlineDiagnosticBookingManagementMultivendorApp {
    return Intl.message(
      'Appointment, Online Diagnostic, Booking, Management Preno App',
      name: 'appointmentOnlineDiagnosticBookingManagementMultivendorApp',
      desc: '',
      args: [],
    );
  }

  /// `Craft your profile, Get appointments, Accept them, Provide consultation, Make Money`
  String get craftYourProfileGetAppointmentsAcceptThemProvideConsultationMake {
    return Intl.message(
      'Craft your profile, Get appointments, Accept them, Provide consultation, Make Money',
      name: 'craftYourProfileGetAppointmentsAcceptThemProvideConsultationMake',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Search country name`
  String get searchCountryName {
    return Intl.message(
      'Search country name',
      name: 'searchCountryName',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please verified your email`
  String get pleaseVerifiedYourEmail {
    return Intl.message(
      'Please verified your email',
      name: 'pleaseVerifiedYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `No user found for this email`
  String get noUserFoundForThisEmail {
    return Intl.message(
      'No user found for this email',
      name: 'noUserFoundForThisEmail',
      desc: '',
      args: [],
    );
  }

  /// `password doesn't match`
  String get passwordDoesntMatch {
    return Intl.message(
      'password doesn\'t match',
      name: 'passwordDoesntMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter mail`
  String get pleaseEnterMail {
    return Intl.message(
      'Please enter mail',
      name: 'pleaseEnterMail',
      desc: '',
      args: [],
    );
  }

  /// `Email sent successfully sent your mail`
  String get emailSentSuccessfullySentYourMail {
    return Intl.message(
      'Email sent successfully sent your mail',
      name: 'emailSentSuccessfullySentYourMail',
      desc: '',
      args: [],
    );
  }

  /// `Please fill your details and complete registration to start find doctors, book appointments have digital consultation, get prescription and live healthy life.`
  String get pleaseFillYourDetailsAndCompleteRegistrationToStartFind {
    return Intl.message(
      'Please fill your details and complete registration to start find doctors, book appointments have digital consultation, get prescription and live healthy life.',
      name: 'pleaseFillYourDetailsAndCompleteRegistrationToStartFind',
      desc: '',
      args: [],
    );
  }

  /// `Fullname`
  String get fullname {
    return Intl.message(
      'Fullname',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `Re-type Password`
  String get retypePassword {
    return Intl.message(
      'Re-type Password',
      name: 'retypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password dosen't match! Enter same password.`
  String get passwordDosentMatchEnterSamePassword {
    return Intl.message(
      'Password dosen\'t match! Enter same password.',
      name: 'passwordDosentMatchEnterSamePassword',
      desc: '',
      args: [],
    );
  }

  /// `By proceeding forward, You agree to the\n`
  String get byProceedingForwardYouAgreeToThen {
    return Intl.message(
      'By proceeding forward, You agree to the\n',
      name: 'byProceedingForwardYouAgreeToThen',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get thePasswordProvidedIsTooWeak {
    return Intl.message(
      'The password provided is too weak.',
      name: 'thePasswordProvidedIsTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get theAccountAlreadyExistsForThatEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'theAccountAlreadyExistsForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Doctor  Banned`
  String get doctorBanned {
    return Intl.message(
      'Doctor  Banned',
      name: 'doctorBanned',
      desc: '',
      args: [],
    );
  }

  /// `Add Slot`
  String get addSlot {
    return Intl.message(
      'Add Slot',
      name: 'addSlot',
      desc: '',
      args: [],
    );
  }

  /// `You can't delete a account`
  String get youCantDeleteAAccount {
    return Intl.message(
      'You can\'t delete a account',
      name: 'youCantDeleteAAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete Slot`
  String get deleteSlot {
    return Intl.message(
      'Delete Slot',
      name: 'deleteSlot',
      desc: '',
      args: [],
    );
  }

  /// `If you delete the slot also delete your patient app.`
  String get ifYouDeleteTheSlotAlsoDeleteYourPatientApp {
    return Intl.message(
      'If you delete the slot also delete your patient app.',
      name: 'ifYouDeleteTheSlotAlsoDeleteYourPatientApp',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'da'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'el'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'nb'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
