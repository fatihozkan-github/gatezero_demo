enum FirebaseAuthError { wrongPassword, userNotFound, networkFail, tooManyRequest, mailAlreadyInUse, invalidMail }

enum LogEvent {
  qrRead,
  rfIDRead,
  duelAdded,
  duelAccepted,
  storyAdded,
  joinTheDraw,
  friendAdded,
  editProfile,
  passwordChanged,
  educationCompleted,
  afterMachineUse,
  achievementAdded,
}

enum ConnectionQuality { poor, moderate, good, excellent, unknown }

enum MachineEvent { signUp, coverOpen, lockOpen }

enum PickImage { gallery, camera }

///
enum HeroStationError { coverError, batteryError }
enum RuntimeError { oldVersion, networkFail, bluetoothFail, locationFail }
enum AuthState { isLoggedIn, isNotLoggedIn, isLoggedInAnonymously }
enum ActivityState { isLoading, isLoaded }
