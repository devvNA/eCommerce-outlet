// MARVELINDO
const baseUrl = 'http://scm8.satriatech.com/api/admin';
// const baseUrl = 'https://scm.zanov.my.id/api';
const listProduk = "/products";
const listProdukByCategory = "/productsbytype";
const listKeranjang = "/getkeranjang";
const deleteKeranjang = "/deleteitemkeranjang";
const postKeranjang = "/additemkeranjang";
const updateKeranjang = "/updateitemkeranjang";
const checkout = "/transaksi";
const listHistoryPemesanan = "/gettransaksi";
const loginUrl = "/login";
const registerUrl = "/register";
const logoutUrl = "/logout";

// ======================================================================== //

// latian
const listBooks = 'https://api.itbook.store/1.0/new';
const detailBook = 'https://api.itbook.store/1.0/books/9781484206485';

const userUrl = 'https://reqres.in/api/users';

// base
const baseUrls = 'https://empty-poets-talk-truly.a276.dcdg.xyzs';
const apiUrl = '$baseUrl/api/v2';
const apiKey = '18be70c0-4e4d-44ff-a475-50c51ece99a0';

// article
const listArticleUrl = '/article/filter';
const detailArticleUrl = '/article';
const relatedArticleUrl = '//article/related';
const favoritedArticleUrl = '/article/favorite';

// ads
const listAdsUrl = '/preview';

// profile
const profileUrl = '/user/profile/me';
const profileCompleteUrl = '/user/profile/complete';
const profileAvatarUrl = '/user/profile/avatar';
const profileByIdUrl = '/profile';
const profileChangePasswordUrl = '/auth/change-password';

// auth
// const loginUrl = '/auth/login';
// const logoutUrl = '/auth/logout';
// const loginWithGoogleUrl = '/auth/login/google/callback';
// const registerUrl = '/auth/register';
// const requestEmailVerificationUrl = '/email-verification/request';
// const resetPasswordUrl = '/reset-password/request';
// const resetPasswordVerifyOTPUrl = '/reset-password/verify';
// const emailVerifyOTPUrl = '/email-verification/verify';
// const changedPasswordUrl = '/auth/reset-password';
// const googleValidateUrl = '/auth/google-validate';
// const refreshTokenUrl = '/auth/refresh';

// administration
const administrationUrl = '/administration';
const administrationBiodataUrl = '/administration/biodata';
const administrationFamilialUrl = '/administration/familial';
const administrationFilesUrl = '/administration/file';
const administrationResetUrl = '/administration/reset';
const administrationConstantsUrl = '/administration/constants';

// study_plan
const listFacultyUrl = '/faculty';
const listMajorUrl = '/major';
String contractUrl(String majorId) =>
    '/student-subject/major/$majorId/contracts';
String enrollMajorUrl(String majorId) => '/student-major/$majorId/enroll';
const subjectUrl = '/subject';
const enrollSubjectUrl = '/student-subject/draft';
const conversionSubjectUrl = '/subject/uploadkhs';
const studyPlanUrl = '/student-subject/studyplan';
const deleteSubjectDraftUrl = '/student-subject/draft';
const sendDraftUrl = '/student-subject/send-draft';

// guide
const guideVideoUrl = '/guide/getbytype?type=video';
const guideBookUrl = '/guide/getbytype?type=book';
const guideGlossaryUrl = '/guide/glossary';

// career
const careerUrl = '/career/get';

//calendar
const calendarUrl = '/calendar/schedule';
const calendarMobileUrl = '/calendar/mobile/all';

//forum global
const discussionUrl = '/discussion';
const discussionForumUrl = '/discussion/forum';
const discussionCommentUrl = '/discussion/comment';
const discussionReplyUrl = '/discussion/reply';
const discussionLikeUrl = '/discussion/like';
const discussionLikeCommentUrl = '/discussion/like/comment';
const discussionLikeReplyUrl = '/discussion/like/reply';
const discussionForumReportUrl = '/discussion/forum/report';
const discussionCommentReportUrl = '/discussion/comment/report';
const discussionReplyReportUrl = '/discussion/reply/report';

// leaderboard
const leaderboardUrl = '/leaderboard';
const facultyLeaderboardUrl =
    '/leaderboard/faculty/0133ddfc-26b3-4e86-a1bc-0ed09591d004';
const majorLeaderboardUrl =
    '/leaderboard/major/cdb98a50-ebac-4b8b-9fee-b4a6601eef39';
const semesterLeaderboardUrl = '/leaderboard/semester/1';

//event
const eventUrl = "/event";
const postEventUrl = "/student-event";
const registEventUrl = "/student-event/registered";

//cerficiate
const certificateEvent = "/certificate/event";

//assignment
const assignmentUrl = "/studi-ku/assignment/progress";
const assignmentInSessionUrl = '/assignment/session';
const sessionUrl = '/session';

// my_study
const listSubjectProgressUrl = '/studi-ku/user';
const listSessionUrl = '/studi-ku/subject/';
const listModuleUrl = '/studi-ku/module/session';
const contentModuleUrl = '/studi-ku/module/';
const videoWatchedUrl = '/watched-video-progress/video/';
const finishModuleUrl = '/studi-ku/module/';
const quizOverviewUrl = '/studi-ku/quiz/description';
const historyQuizUrl = '/studi-ku/quiz/history';
const takeQuizUrl = '/studi-ku/quiz/take/';
const submitQuizUrl = '/studi-ku/quiz/submit/';
const reviewQuizUrl = '/studi-ku/quiz/review?attempt=';
const discussionInSessionUrl = '/forum/discussionforum/session';
const allContentDiscussionUrl = '/forum/discussionforum/allcontent';
const createCommentUrl = '/forum/comment/create';
const createReplyUrl = '/forum/reply/create';
const likeDiscussionUrl = '/forum/like';

// jobs
const allWithFilterJobs = '/job';
//simulation
const listSDAUrl = '/meeting';
const listHistorySDA = '/meeting/student/history';

//service
const createDocument = '/document';

// score and certificate
const listCertificateUrl = '/certificate';
