class ApiRoutes {
  //baseUrl
  static const String baseUrl = 'https://bibek.surajthakuri.com.np';
  //api
  static const String apiEndPoint = 'api';

  //api-auth
  static const String loginEndPoint = '$apiEndPoint/student/login';
  static const String registerEndPoint = '$apiEndPoint/student/register';
  static const String logoutEndPoint = '$apiEndPoint/student/logout/';

  //api-auth-user
  static const String userEndPoint = '$apiEndPoint/user/';

  //subjects
  static const String subjectsEndPoint = '$apiEndPoint/subjects/';
  //exams
  static const String examsEndPoint = '$apiEndPoint/exams/';
  static const String examReportsEndPoint = '$apiEndPoint/exam-reports/';
  static const String submitExamEndPoint = '$apiEndPoint/exam-submissions';
}
