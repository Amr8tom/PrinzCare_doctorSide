import 'package:doctor_flutter/utils/const_res.dart';

class Urls {
  ///------------------------ Urls ------------------------///

  static const String doctorRegistration =
      '${ConstRes.baseURL}doctorRegistration';
  static const String doctorLogin =
      '${ConstRes.baseURL}doctorLogin';
  static const String updateDoctorDetails =
      '${ConstRes.baseURL}updateDoctorDetails';
  static const String fetchDoctorCategories =
      '${ConstRes.baseURL}fetchDoctorCategories';
  static const String suggestDoctorCategory =
      '${ConstRes.baseURL}suggestDoctorCategory';
  static const String fetchDoctorNotifications =
      '${ConstRes.baseURL}fetchDoctorNotifications';
  static const String addEditService = '${ConstRes.baseURL}addEditService';
  static const String addEditExpertise = '${ConstRes.baseURL}addEditExpertise';
  static const String addEditExperience =
      '${ConstRes.baseURL}addEditExperience';
  static const String addEditAwards = '${ConstRes.baseURL}addEditAwards';
  static const String addHoliday = '${ConstRes.baseURL}addHoliday';
  static const String deleteHoliday = '${ConstRes.baseURL}deleteHoliday';
  static const String addEditServiceLocations =
      '${ConstRes.baseURL}addEditServiceLocations';
  static const String addAppointmentSlots =
      '${ConstRes.baseURL}addAppointmentSlots';
  static const String deleteAppointmentSlot =
      '${ConstRes.baseURL}deleteAppointmentSlot';
  static const String manageDrBankAccount =
      '${ConstRes.baseURL}manageDrBankAccount';
  static const String acceptAppointment =
      '${ConstRes.baseURL}acceptAppointment';
  static const String declineAppointment =
      '${ConstRes.baseURL}declineAppointment';
  static const String fetchAppointmentRequests =
      '${ConstRes.baseURL}fetchAppointmentRequests';
  static const String fetchAppointmentDetails =
      '${ConstRes.baseURL}fetchAppointmentDetails';
  static const String fetchAcceptedAppointsByDate =
      '${ConstRes.baseURL}fetchAcceptedAppointsByDate';
  static const String fetchAppointmentHistory =
      '${ConstRes.baseURL}fetchAppointmentHistory';
  static const String addPrescription = '${ConstRes.baseURL}addPrescription';
  static const String editPrescription = '${ConstRes.baseURL}editPrescription';
  static const String completeAppointment =
      '${ConstRes.baseURL}completeAppointment';
  static const String fetchDoctorWalletStatement =
      '${ConstRes.baseURL}fetchDoctorWalletStatement';
  static const String submitDoctorWithdrawRequest =
      '${ConstRes.baseURL}submitDoctorWithdrawRequest';
  static const String fetchDoctorReviews =
      '${ConstRes.baseURL}fetchDoctorReviews';
  static const String fetchDoctorEarningHistory =
      '${ConstRes.baseURL}fetchDoctorEarningHistory';
  static const String fetchDoctorPayoutHistory =
      '${ConstRes.baseURL}fetchDoctorPayoutHistory';
  static const String checkMobileNumberExists =
      '${ConstRes.baseURL}checkMobileNumberExists';
  static const String fetchFaqCats = '${ConstRes.baseURL}fetchFaqCats';
  static const String fetchGlobalSettings =
      '${ConstRes.base}api/fetchGlobalSettings';
  static const String logOutDoctor = '${ConstRes.baseURL}logOutDoctor';
  static const String deleteDoctorAccount =
      '${ConstRes.baseURL}deleteDoctorAccount';
  static const String uploadFileGivePath =
      '${ConstRes.base}api/uploadFileGivePath';
  static const String generateAgoraToken =
      '${ConstRes.base}api/generateAgoraToken';
  static const String fetchUserDetails = '${ConstRes.baseURL}fetchUserDetails';

  static String fetchMyDoctorProfile(int? id) {
    return '${ConstRes.baseURL}fetchMyDoctorProfile?doctor_id=$id';
  }

  static const String notificationUrl = 'https://fcm.googleapis.com/fcm/send';
  static const String payment_authentication_start_token = 'https://accept.paymob.com/api/auth/tokens';
  static const String payment_orderID = 'https://accept.paymob.com/api/ecommerce/orders';
  static const String payment_endtoken= 'https://accept.paymob.com/api/acceptance/payment_keys';

}

///------------------------ Params ------------------------///

const String pApiKeyName = 'apikey';
const String pApiKeyName_paymob = 'api_key';
const String pPost = 'POST';
const String pMobileNumber = 'mobile_number';
const String pIdentity = 'identity';
const String pDeviceToken = 'device_token';
const String pDoctorId = 'doctor_id';
const String pName = 'name';
const String pPassword = 'password';
const String pCountryCode = 'country_code';
const String pGender = 'gender';
const String pCategoryId = 'category_id';
const String pDesignation = 'designation';
const String pDegrees = 'degrees';
const String pLanguagesSpoken = 'languages_spoken';
const String pExperienceYear = 'experience_year';
const String pConsultationFee = 'consultation_fee';
const String pAboutYourself = 'about_youself';
const String pEducationalJourney = 'educational_journey';
const String pOnlineConsultation = 'online_consultation';
const String pClinicConsultation = 'clinic_consultation';
const String pImage = 'image';
const String pIsNotification = 'is_notification';
const String pOnVacation = 'on_vacation';
const String pClinicLong = 'clinic_long';
const String pClinicLat = 'clinic_lat';
const String pClinicAddress = 'clinic_address';
const String pClinicName = 'clinic_name';
const String pAbout = 'about';
const String pTitle = 'title';
const String pStart = 'start';
const String pCount = 'count';
const String pType = 'type';
const String pServiceId = 'service_id';
const String pExpertiseId = 'expertise_id';
const String pExperienceId = 'experience_id';
const String pAwardId = 'award_id';
const String pHospitalLat = 'hospital_lat';
const String pHospitalLong = 'hospital_long';
const String pServiceLCationId = 'serviceLocation_id';
const String pHospitalAddress = 'hospital_address';
const String pHospitalTitle = 'hospital_title';
const String pDate = 'date';
const String pHolidayId = 'holiday_id';
const String pTime = 'time';
const String pEndTime = 'end_time';
const String pSlotDuration = 'slot_duration';
const String pWeekday = 'weekday';
const String pBookingLimit = 'booking_limit';
const String pSlotId = 'slot_id';
const String pBankName = 'bank_name';
const String pAccountNumber = 'account_number';
const String pHolder = 'holder';
const String pSwiftCode = 'swift_code';
const String pChequePhoto = 'cheque_photo';
const String pAppointmentId = 'appointment_id';
const String pUserId = 'user_id';
const String pMedicine = 'medicine';
const String pPrescriptionId = 'prescription_id';
const String pCompletionOtp = 'completion_otp';
const String pDiagnosedWith = 'diagnosed_with';
const String pMonth = 'month';
const String pYear = 'year';
const String pTen = '10';
const String pFile = 'file';
const String pChannelName = 'channelName';
