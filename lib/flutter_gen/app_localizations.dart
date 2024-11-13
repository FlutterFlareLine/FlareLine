import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_th.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('th'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @alertsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alertsPageTitle;

  /// No description provided for @alertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Attention Needed'**
  String get alertsTitle;

  /// No description provided for @alertsMessage.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply dummy text of the printing and typesetting industry'**
  String get alertsMessage;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'FlareLine'**
  String get appName;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'Simple web, develop faster'**
  String get slogan;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'6+ Characters'**
  String get passwordHint;

  /// No description provided for @signInWithGithub.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Github'**
  String get signInWithGithub;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithMicrosoft.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Microsoft'**
  String get signInWithMicrosoft;

  /// No description provided for @signInWithTwitter.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Twitter'**
  String get signInWithTwitter;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have any account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @startForFree.
  ///
  /// In en, this message translates to:
  /// **'Start for free'**
  String get startForFree;

  /// No description provided for @signUpTip.
  ///
  /// In en, this message translates to:
  /// **'Sign Up to FlareLine'**
  String get signUpTip;

  /// No description provided for @retypePassword.
  ///
  /// In en, this message translates to:
  /// **'Re-type Password'**
  String get retypePassword;

  /// No description provided for @retypePasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get retypePasswordHint;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @signUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signUpWithGoogle;

  /// No description provided for @haveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAnAccount;

  /// No description provided for @normalButton.
  ///
  /// In en, this message translates to:
  /// **'Normal Button'**
  String get normalButton;

  /// No description provided for @buttonWithIcon.
  ///
  /// In en, this message translates to:
  /// **'Button With Icon'**
  String get buttonWithIcon;

  /// No description provided for @buttonsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get buttonsPageTitle;

  /// No description provided for @btnName.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get btnName;

  /// No description provided for @calendarPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarPageTitle;

  /// No description provided for @chartPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Chart'**
  String get chartPageTitle;

  /// No description provided for @totalViews.
  ///
  /// In en, this message translates to:
  /// **'Total views'**
  String get totalViews;

  /// No description provided for @totalProfit.
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get totalProfit;

  /// No description provided for @totalProduct.
  ///
  /// In en, this message translates to:
  /// **'Total Product'**
  String get totalProduct;

  /// No description provided for @totalUsers.
  ///
  /// In en, this message translates to:
  /// **'Total Users'**
  String get totalUsers;

  /// No description provided for @formElements.
  ///
  /// In en, this message translates to:
  /// **'FormElements'**
  String get formElements;

  /// No description provided for @inputFields.
  ///
  /// In en, this message translates to:
  /// **'Input Fields'**
  String get inputFields;

  /// No description provided for @defaultInput.
  ///
  /// In en, this message translates to:
  /// **'Default Input'**
  String get defaultInput;

  /// No description provided for @activeInput.
  ///
  /// In en, this message translates to:
  /// **'Active Input'**
  String get activeInput;

  /// No description provided for @disabledLabel.
  ///
  /// In en, this message translates to:
  /// **'Disabled Label'**
  String get disabledLabel;

  /// No description provided for @toggleSwitchInput.
  ///
  /// In en, this message translates to:
  /// **'Toggle switch input'**
  String get toggleSwitchInput;

  /// No description provided for @switchLabel.
  ///
  /// In en, this message translates to:
  /// **'Switch Label'**
  String get switchLabel;

  /// No description provided for @timeAndDate.
  ///
  /// In en, this message translates to:
  /// **'Time and date'**
  String get timeAndDate;

  /// No description provided for @datePicker.
  ///
  /// In en, this message translates to:
  /// **'Date Picker'**
  String get datePicker;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get selectDate;

  /// No description provided for @fileUpload.
  ///
  /// In en, this message translates to:
  /// **'File upload'**
  String get fileUpload;

  /// No description provided for @attachFile.
  ///
  /// In en, this message translates to:
  /// **'Attach file'**
  String get attachFile;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select Image'**
  String get selectImage;

  /// No description provided for @textareaFields.
  ///
  /// In en, this message translates to:
  /// **'Textarea Fields'**
  String get textareaFields;

  /// No description provided for @defaultTextarea.
  ///
  /// In en, this message translates to:
  /// **'Default Textarea'**
  String get defaultTextarea;

  /// No description provided for @activeTextarea.
  ///
  /// In en, this message translates to:
  /// **'Active Textarea'**
  String get activeTextarea;

  /// No description provided for @disabledTextarea.
  ///
  /// In en, this message translates to:
  /// **'Disabled Textarea'**
  String get disabledTextarea;

  /// No description provided for @checkboxAndRadis.
  ///
  /// In en, this message translates to:
  /// **'Checkbox and radio'**
  String get checkboxAndRadis;

  /// No description provided for @selectInput.
  ///
  /// In en, this message translates to:
  /// **'Select input'**
  String get selectInput;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get selectCountry;

  /// No description provided for @multiselect.
  ///
  /// In en, this message translates to:
  /// **'Multiselect Dropdown'**
  String get multiselect;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @formLayoutPageTitle.
  ///
  /// In en, this message translates to:
  /// **'FormLayout'**
  String get formLayoutPageTitle;

  /// No description provided for @contactForm.
  ///
  /// In en, this message translates to:
  /// **'Contact Form'**
  String get contactForm;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get firstNameHint;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @lastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get lastNameHint;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @subjectHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your subject'**
  String get subjectHint;

  /// No description provided for @selectSubjectHint.
  ///
  /// In en, this message translates to:
  /// **'Select your subject'**
  String get selectSubjectHint;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @messageHint.
  ///
  /// In en, this message translates to:
  /// **'Type your message'**
  String get messageHint;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgetPwd.
  ///
  /// In en, this message translates to:
  /// **'Forget password?'**
  String get forgetPwd;

  /// No description provided for @signInForm.
  ///
  /// In en, this message translates to:
  /// **'Sign In Form?'**
  String get signInForm;

  /// No description provided for @signUpForm.
  ///
  /// In en, this message translates to:
  /// **'Sign Up Form?'**
  String get signUpForm;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get fullNameHint;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @followMeOn.
  ///
  /// In en, this message translates to:
  /// **'Follow me on'**
  String get followMeOn;

  /// No description provided for @resetPwd.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPwd;

  /// No description provided for @emailReceiveResetLink.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to receive a password reset link.'**
  String get emailReceiveResetLink;

  /// No description provided for @sendPwdResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Password Reset Link'**
  String get sendPwdResetLink;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneNumberHint;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// No description provided for @userNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get userNameHint;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @yourPhoto.
  ///
  /// In en, this message translates to:
  /// **'Your Photo'**
  String get yourPhoto;

  /// No description provided for @editYourPhoto.
  ///
  /// In en, this message translates to:
  /// **'Edit your photo'**
  String get editYourPhoto;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'BIO'**
  String get bio;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @clickToUpload.
  ///
  /// In en, this message translates to:
  /// **'Click to upload or drag and drop'**
  String get clickToUpload;

  /// No description provided for @topChannels.
  ///
  /// In en, this message translates to:
  /// **'Top Channels'**
  String get topChannels;

  /// No description provided for @topProducts.
  ///
  /// In en, this message translates to:
  /// **'Top Products'**
  String get topProducts;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'loading'**
  String get loading;

  /// No description provided for @visitors.
  ///
  /// In en, this message translates to:
  /// **'VISITORS'**
  String get visitors;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'SOURCE'**
  String get source;

  /// No description provided for @revenues.
  ///
  /// In en, this message translates to:
  /// **'REVENUES'**
  String get revenues;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'SALES'**
  String get sales;

  /// No description provided for @conversation.
  ///
  /// In en, this message translates to:
  /// **'CONVERSION'**
  String get conversation;

  /// No description provided for @groupMenu.
  ///
  /// In en, this message translates to:
  /// **'MENU'**
  String get groupMenu;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @forms.
  ///
  /// In en, this message translates to:
  /// **'Forms'**
  String get forms;

  /// No description provided for @tables.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get tables;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'OTHERS'**
  String get others;

  /// No description provided for @chart.
  ///
  /// In en, this message translates to:
  /// **'Chart'**
  String get chart;

  /// No description provided for @uiElements.
  ///
  /// In en, this message translates to:
  /// **'UI Elements'**
  String get uiElements;

  /// No description provided for @alerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alerts;

  /// No description provided for @buttons.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get buttons;

  /// No description provided for @basicChart.
  ///
  /// In en, this message translates to:
  /// **'Basic Chart'**
  String get basicChart;

  /// No description provided for @eCommerce.
  ///
  /// In en, this message translates to:
  /// **'eCommerce'**
  String get eCommerce;

  /// No description provided for @authentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authentication;

  /// No description provided for @advanceTable.
  ///
  /// In en, this message translates to:
  /// **'AdvanceTable'**
  String get advanceTable;

  /// No description provided for @profitThisWeek.
  ///
  /// In en, this message translates to:
  /// **'Profit this week'**
  String get profitThisWeek;

  /// No description provided for @package.
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get package;

  /// No description provided for @invoiceDate.
  ///
  /// In en, this message translates to:
  /// **'Invoice date'**
  String get invoiceDate;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get profit;

  /// No description provided for @alertTips.
  ///
  /// In en, this message translates to:
  /// **'Alert Tips'**
  String get alertTips;

  /// No description provided for @alertDialog.
  ///
  /// In en, this message translates to:
  /// **'Alert Dialog'**
  String get alertDialog;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @warn.
  ///
  /// In en, this message translates to:
  /// **'Warn'**
  String get warn;

  /// No description provided for @danger.
  ///
  /// In en, this message translates to:
  /// **'Danger'**
  String get danger;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @simpleAlert.
  ///
  /// In en, this message translates to:
  /// **'Simple Alert'**
  String get simpleAlert;

  /// No description provided for @simple.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get simple;

  /// No description provided for @simpleConfirm.
  ///
  /// In en, this message translates to:
  /// **'Simple Confirm'**
  String get simpleConfirm;

  /// No description provided for @rflutterAlert.
  ///
  /// In en, this message translates to:
  /// **'RFLUTTER ALERT'**
  String get rflutterAlert;

  /// No description provided for @rflutterTip.
  ///
  /// In en, this message translates to:
  /// **'Flutter is more awesome with RFlutter Alert.'**
  String get rflutterTip;

  /// No description provided for @cool.
  ///
  /// In en, this message translates to:
  /// **'COOL'**
  String get cool;

  /// No description provided for @seeDetail.
  ///
  /// In en, this message translates to:
  /// **'See Detail...'**
  String get seeDetail;

  /// No description provided for @tryMore.
  ///
  /// In en, this message translates to:
  /// **'Try More...'**
  String get tryMore;

  /// No description provided for @colorPicker.
  ///
  /// In en, this message translates to:
  /// **'Color Picker'**
  String get colorPicker;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'fr', 'id', 'ja', 'ko', 'th', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'id': return AppLocalizationsId();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'th': return AppLocalizationsTh();
    case 'vi': return AppLocalizationsVi();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
