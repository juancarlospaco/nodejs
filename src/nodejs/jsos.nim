
when defined(windows):
  let
    WSAEINTR* {.importjs: "os.constants.errno.WSAEINTR".}: cint
    WSAEBADF* {.importjs: "os.constants.errno.WSAEBADF".}: cint
    WSAEACCES* {.importjs: "os.constants.errno.WSAEACCES".}: cint
    WSAEFAULT* {.importjs: "os.constants.errno.WSAEFAULT".}: cint
    WSAEINVAL* {.importjs: "os.constants.errno.WSAEINVAL".}: cint
    WSAEMFILE* {.importjs: "os.constants.errno.WSAEMFILE".}: cint
    WSAEWOULDBLOCK* {.importjs: "os.constants.errno.WSAEWOULDBLOCK".}: cint
    WSAEINPROGRESS* {.importjs: "os.constants.errno.WSAEINPROGRESS".}: cint
    WSAEALREADY* {.importjs: "os.constants.errno.WSAEALREADY".}: cint
    WSAENOTSOCK* {.importjs: "os.constants.errno.WSAENOTSOCK".}: cint
    WSAEDESTADDRREQ* {.importjs: "os.constants.errno.WSAEDESTADDRREQ".}: cint
    WSAEMSGSIZE* {.importjs: "os.constants.errno.WSAEMSGSIZE".}: cint
    WSAEPROTOTYPE* {.importjs: "os.constants.errno.WSAEPROTOTYPE".}: cint
    WSAENOPROTOOPT* {.importjs: "os.constants.errno.WSAENOPROTOOPT".}: cint
    WSAEPROTONOSUPPORT* {.importjs: "os.constants.errno.WSAEPROTONOSUPPORT".}: cint
    WSAESOCKTNOSUPPORT* {.importjs: "os.constants.errno.WSAESOCKTNOSUPPORT".}: cint
    WSAEOPNOTSUPP* {.importjs: "os.constants.errno.WSAEOPNOTSUPP".}: cint
    WSAEPFNOSUPPORT* {.importjs: "os.constants.errno.WSAEPFNOSUPPORT".}: cint
    WSAEAFNOSUPPORT* {.importjs: "os.constants.errno.WSAEAFNOSUPPORT".}: cint
    WSAEADDRINUSE* {.importjs: "os.constants.errno.WSAEADDRINUSE".}: cint
    WSAEADDRNOTAVAIL* {.importjs: "os.constants.errno.WSAEADDRNOTAVAIL".}: cint
    WSAENETDOWN* {.importjs: "os.constants.errno.WSAENETDOWN".}: cint
    WSAENETUNREACH* {.importjs: "os.constants.errno.WSAENETUNREACH".}: cint
    WSAENETRESET* {.importjs: "os.constants.errno.WSAENETRESET".}: cint
    WSAECONNABORTED* {.importjs: "os.constants.errno.WSAECONNABORTED".}: cint
    WSAECONNRESET* {.importjs: "os.constants.errno.WSAECONNRESET".}: cint
    WSAENOBUFS* {.importjs: "os.constants.errno.WSAENOBUFS".}: cint
    WSAEISCONN* {.importjs: "os.constants.errno.WSAEISCONN".}: cint
    WSAENOTCONN* {.importjs: "os.constants.errno.WSAENOTCONN".}: cint
    WSAESHUTDOWN* {.importjs: "os.constants.errno.WSAESHUTDOWN".}: cint
    WSAETOOMANYREFS* {.importjs: "os.constants.errno.WSAETOOMANYREFS".}: cint
    WSAETIMEDOUT* {.importjs: "os.constants.errno.WSAETIMEDOUT".}: cint
    WSAECONNREFUSED* {.importjs: "os.constants.errno.WSAECONNREFUSED".}: cint
    WSAELOOP* {.importjs: "os.constants.errno.WSAELOOP".}: cint
    WSAENAMETOOLONG* {.importjs: "os.constants.errno.WSAENAMETOOLONG".}: cint
    WSAEHOSTDOWN* {.importjs: "os.constants.errno.WSAEHOSTDOWN".}: cint
    WSAEHOSTUNREACH* {.importjs: "os.constants.errno.WSAEHOSTUNREACH".}: cint
    WSAENOTEMPTY* {.importjs: "os.constants.errno.WSAENOTEMPTY".}: cint
    WSAEPROCLIM* {.importjs: "os.constants.errno.WSAEPROCLIM".}: cint
    WSAEUSERS* {.importjs: "os.constants.errno.WSAEUSERS".}: cint
    WSAEDQUOT* {.importjs: "os.constants.errno.WSAEDQUOT".}: cint
    WSAESTALE* {.importjs: "os.constants.errno.WSAESTALE".}: cint
    WSAEREMOTE* {.importjs: "os.constants.errno.WSAEREMOTE".}: cint
    WSASYSNOTREADY* {.importjs: "os.constants.errno.WSASYSNOTREADY".}: cint
    WSAVERNOTSUPPORTED* {.importjs: "os.constants.errno.WSAVERNOTSUPPORTED".}: cint
    WSANOTINITIALISED* {.importjs: "os.constants.errno.WSANOTINITIALISED".}: cint
    WSAEDISCON* {.importjs: "os.constants.errno.WSAEDISCON".}: cint
    WSAENOMORE* {.importjs: "os.constants.errno.WSAENOMORE".}: cint
    WSAECANCELLED* {.importjs: "os.constants.errno.WSAECANCELLED".}: cint
    WSAEINVALIDPROCTABLE* {.importjs: "os.constants.errno.WSAEINVALIDPROCTABLE".}: cint
    WSAEINVALIDPROVIDER* {.importjs: "os.constants.errno.WSAEINVALIDPROVIDER".}: cint
    WSAEPROVIDERFAILEDINIT* {.importjs: "os.constants.errno.WSAEPROVIDERFAILEDINIT".}: cint
    WSASYSCALLFAILURE* {.importjs: "os.constants.errno.WSASYSCALLFAILURE".}: cint
    WSASERVICE_NOT_FOUND* {.importjs: "os.constants.errno.WSASERVICE_NOT_FOUND".}: cint
    WSATYPE_NOT_FOUND* {.importjs: "os.constants.errno.WSATYPE_NOT_FOUND".}: cint
    WSAEREFUSED* {.importjs: "os.constants.errno.WSAEREFUSED".}: cint
    # Duplicated ???.
    # WSA_E_NO_MORE* {.importjs: "os.constants.errno.WSA_E_NO_MORE".}: cint
    # WSA_E_CANCELLED* {.importjs: "os.constants.errno.WSA_E_CANCELLED".}: cint

let
  EOL* {.importjs: "os.EOL".}: cstring
  SIGHUP* {.importjs: "os.constants.signals.SIGHUP".}: cint
  SIGINT* {.importjs: "os.constants.signals.SIGINT".}: cint
  SIGQUIT* {.importjs: "os.constants.signals.SIGQUIT".}: cint
  SIGILL* {.importjs: "os.constants.signals.SIGILL".}: cint
  SIGTRAP* {.importjs: "os.constants.signals.SIGTRAP".}: cint
  SIGABRT* {.importjs: "os.constants.signals.SIGABRT".}: cint
  SIGIOT* {.importjs: "os.constants.signals.SIGIOT".}: cint
  SIGBUS* {.importjs: "os.constants.signals.SIGBUS".}: cint
  SIGFPE* {.importjs: "os.constants.signals.SIGFPE".}: cint
  SIGKILL* {.importjs: "os.constants.signals.SIGKILL".}: cint
  SIGUSR1* {.importjs: "os.constants.signals.SIGUSR1".}: cint
  SIGSEGV* {.importjs: "os.constants.signals.SIGSEGV".}: cint
  SIGUSR2* {.importjs: "os.constants.signals.SIGUSR2".}: cint
  SIGPIPE* {.importjs: "os.constants.signals.SIGPIPE".}: cint
  SIGALRM* {.importjs: "os.constants.signals.SIGALRM".}: cint
  SIGTERM* {.importjs: "os.constants.signals.SIGTERM".}: cint
  SIGCHLD* {.importjs: "os.constants.signals.SIGCHLD".}: cint
  SIGSTKFLT* {.importjs: "os.constants.signals.SIGSTKFLT".}: cint
  SIGCONT* {.importjs: "os.constants.signals.SIGCONT".}: cint
  SIGSTOP* {.importjs: "os.constants.signals.SIGSTOP".}: cint
  SIGTSTP* {.importjs: "os.constants.signals.SIGTSTP".}: cint
  SIGTTIN* {.importjs: "os.constants.signals.SIGTTIN".}: cint
  SIGTTOU* {.importjs: "os.constants.signals.SIGTTOU".}: cint
  SIGURG* {.importjs: "os.constants.signals.SIGURG".}: cint
  SIGXCPU* {.importjs: "os.constants.signals.SIGXCPU".}: cint
  SIGXFSZ* {.importjs: "os.constants.signals.SIGXFSZ".}: cint
  SIGVTALRM* {.importjs: "os.constants.signals.SIGVTALRM".}: cint
  SIGPROF* {.importjs: "os.constants.signals.SIGPROF".}: cint
  SIGWINCH* {.importjs: "os.constants.signals.SIGWINCH".}: cint
  SIGIO* {.importjs: "os.constants.signals.SIGIO".}: cint
  SIGPOLL* {.importjs: "os.constants.signals.SIGPOLL".}: cint
  SIGPWR* {.importjs: "os.constants.signals.SIGPWR".}: cint
  SIGSYS* {.importjs: "os.constants.signals.SIGSYS".}: cint
  E2BIG* {.importjs: "os.constants.errno.E2BIG".}: cint
  EACCES* {.importjs: "os.constants.errno.EACCES".}: cint
  EADDRINUSE* {.importjs: "os.constants.errno.EADDRINUSE".}: cint
  EADDRNOTAVAIL* {.importjs: "os.constants.errno.EADDRNOTAVAIL".}: cint
  EAFNOSUPPORT* {.importjs: "os.constants.errno.EAFNOSUPPORT".}: cint
  EAGAIN* {.importjs: "os.constants.errno.EAGAIN".}: cint
  EALREADY* {.importjs: "os.constants.errno.EALREADY".}: cint
  EBADF* {.importjs: "os.constants.errno.EBADF".}: cint
  EBADMSG* {.importjs: "os.constants.errno.EBADMSG".}: cint
  EBUSY* {.importjs: "os.constants.errno.EBUSY".}: cint
  ECANCELED* {.importjs: "os.constants.errno.ECANCELED".}: cint
  ECHILD* {.importjs: "os.constants.errno.ECHILD".}: cint
  ECONNABORTED* {.importjs: "os.constants.errno.ECONNABORTED".}: cint
  ECONNREFUSED* {.importjs: "os.constants.errno.ECONNREFUSED".}: cint
  ECONNRESET* {.importjs: "os.constants.errno.ECONNRESET".}: cint
  EDEADLK* {.importjs: "os.constants.errno.EDEADLK".}: cint
  EDESTADDRREQ* {.importjs: "os.constants.errno.EDESTADDRREQ".}: cint
  EDOM* {.importjs: "os.constants.errno.EDOM".}: cint
  EDQUOT* {.importjs: "os.constants.errno.EDQUOT".}: cint
  EEXIST* {.importjs: "os.constants.errno.EEXIST".}: cint
  EFAULT* {.importjs: "os.constants.errno.EFAULT".}: cint
  EFBIG* {.importjs: "os.constants.errno.EFBIG".}: cint
  EHOSTUNREACH* {.importjs: "os.constants.errno.EHOSTUNREACH".}: cint
  EIDRM* {.importjs: "os.constants.errno.EIDRM".}: cint
  EILSEQ* {.importjs: "os.constants.errno.EILSEQ".}: cint
  EINPROGRESS* {.importjs: "os.constants.errno.EINPROGRESS".}: cint
  EINTR* {.importjs: "os.constants.errno.EINTR".}: cint
  EINVAL* {.importjs: "os.constants.errno.EINVAL".}: cint
  EIO* {.importjs: "os.constants.errno.EIO".}: cint
  EISCONN* {.importjs: "os.constants.errno.EISCONN".}: cint
  EISDIR* {.importjs: "os.constants.errno.EISDIR".}: cint
  ELOOP* {.importjs: "os.constants.errno.ELOOP".}: cint
  EMFILE* {.importjs: "os.constants.errno.EMFILE".}: cint
  EMLINK* {.importjs: "os.constants.errno.EMLINK".}: cint
  EMSGSIZE* {.importjs: "os.constants.errno.EMSGSIZE".}: cint
  EMULTIHOP* {.importjs: "os.constants.errno.EMULTIHOP".}: cint
  ENAMETOOLONG* {.importjs: "os.constants.errno.ENAMETOOLONG".}: cint
  ENETDOWN* {.importjs: "os.constants.errno.ENETDOWN".}: cint
  ENETRESET* {.importjs: "os.constants.errno.ENETRESET".}: cint
  ENETUNREACH* {.importjs: "os.constants.errno.ENETUNREACH".}: cint
  ENFILE* {.importjs: "os.constants.errno.ENFILE".}: cint
  ENOBUFS* {.importjs: "os.constants.errno.ENOBUFS".}: cint
  ENODATA* {.importjs: "os.constants.errno.ENODATA".}: cint
  ENODEV* {.importjs: "os.constants.errno.ENODEV".}: cint
  ENOENT* {.importjs: "os.constants.errno.ENOENT".}: cint
  ENOEXEC* {.importjs: "os.constants.errno.ENOEXEC".}: cint
  ENOLCK* {.importjs: "os.constants.errno.ENOLCK".}: cint
  ENOLINK* {.importjs: "os.constants.errno.ENOLINK".}: cint
  ENOMEM* {.importjs: "os.constants.errno.ENOMEM".}: cint
  ENOMSG* {.importjs: "os.constants.errno.ENOMSG".}: cint
  ENOPROTOOPT* {.importjs: "os.constants.errno.ENOPROTOOPT".}: cint
  ENOSPC* {.importjs: "os.constants.errno.ENOSPC".}: cint
  ENOSR* {.importjs: "os.constants.errno.ENOSR".}: cint
  ENOSTR* {.importjs: "os.constants.errno.ENOSTR".}: cint
  ENOSYS* {.importjs: "os.constants.errno.ENOSYS".}: cint
  ENOTCONN* {.importjs: "os.constants.errno.ENOTCONN".}: cint
  ENOTDIR* {.importjs: "os.constants.errno.ENOTDIR".}: cint
  ENOTEMPTY* {.importjs: "os.constants.errno.ENOTEMPTY".}: cint
  ENOTSOCK* {.importjs: "os.constants.errno.ENOTSOCK".}: cint
  ENOTSUP* {.importjs: "os.constants.errno.ENOTSUP".}: cint
  ENOTTY* {.importjs: "os.constants.errno.ENOTTY".}: cint
  ENXIO* {.importjs: "os.constants.errno.ENXIO".}: cint
  EOPNOTSUPP* {.importjs: "os.constants.errno.EOPNOTSUPP".}: cint
  EOVERFLOW* {.importjs: "os.constants.errno.EOVERFLOW".}: cint
  EPERM* {.importjs: "os.constants.errno.EPERM".}: cint
  EPIPE* {.importjs: "os.constants.errno.EPIPE".}: cint
  EPROTO* {.importjs: "os.constants.errno.EPROTO".}: cint
  EPROTONOSUPPORT* {.importjs: "os.constants.errno.EPROTONOSUPPORT".}: cint
  EPROTOTYPE* {.importjs: "os.constants.errno.EPROTOTYPE".}: cint
  ERANGE* {.importjs: "os.constants.errno.ERANGE".}: cint
  EROFS* {.importjs: "os.constants.errno.EROFS".}: cint
  ESPIPE* {.importjs: "os.constants.errno.ESPIPE".}: cint
  ESRCH* {.importjs: "os.constants.errno.ESRCH".}: cint
  ESTALE* {.importjs: "os.constants.errno.ESTALE".}: cint
  ETIME* {.importjs: "os.constants.errno.ETIME".}: cint
  ETIMEDOUT* {.importjs: "os.constants.errno.ETIMEDOUT".}: cint
  ETXTBSY* {.importjs: "os.constants.errno.ETXTBSY".}: cint
  EWOULDBLOCK* {.importjs: "os.constants.errno.EWOULDBLOCK".}: cint
  EXDEV* {.importjs: "os.constants.errno.EXDEV".}: cint
  RTLD_LAZY* {.importjs: "os.constants.dlopen.RTLD_LAZY".}: cint
  RTLD_NOW* {.importjs: "os.constants.dlopen.RTLD_NOW".}: cint
  RTLD_GLOBAL* {.importjs: "os.constants.dlopen.RTLD_GLOBAL".}: cint
  RTLD_LOCAL* {.importjs: "os.constants.dlopen.RTLD_LOCAL".}: cint
  RTLD_DEEPBIND* {.importjs: "os.constants.dlopen.RTLD_DEEPBIND".}: cint
  PRIORITY_LOW* {.importjs: "os.constants.priority.PRIORITY_LOW".}: cint
  PRIORITY_BELOW_NORMAL* {.importjs: "os.constants.priority.PRIORITY_BELOW_NORMAL".}: cint
  PRIORITY_NORMAL* {.importjs: "os.constants.priority.PRIORITY_NORMAL".}: cint
  PRIORITY_ABOVE_NORMAL* {.importjs: "os.constants.priority.PRIORITY_ABOVE_NORMAL".}: cint
  PRIORITY_HIGH* {.importjs: "os.constants.priority.PRIORITY_HIGH".}: cint
  PRIORITY_HIGHEST* {.importjs: "os.constants.priority.PRIORITY_HIGHEST".}: cint
  UV_UDP_REUSEADDR* {.importjs: "os.constants.UV_UDP_REUSEADDR".}: cint

func importOs*() {.importjs: "import * as os from 'os'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireOs*() {.importjs: "const os = require('os')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func arch*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_arch

func endianness*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_endianness

func freemem*(): cint {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_freemem

func getPriority*(pid = 0.cint): cint {.importjs: "os.$1(#)".}
  ## https://nodejs.org/api/os.html#os_os_getpriority_pid

func homedir*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_homedir

func loadavg*(): seq[cint] {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_loadavg

func platform*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_platform

func release*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_release

func setPriority*(priority: cint) {.importjs: "os.$1(#)".}
  ## https://nodejs.org/api/os.html#os_os_setpriority_pid_priority

func setPriority*(pid, priority: cint) {.importjs: "os.$1(#, #)".}
  ## https://nodejs.org/api/os.html#os_os_setpriority_pid_priority

func tmpdir*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_tmpdir

func totalmem*(): cint {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_totalmem

func ostype*(): cstring {.importjs: "os.type()".}
  ## https://nodejs.org/api/os.html#os_os_type

func uptimeOs*(): cint {.importjs: "os.uptime()".}
  ## https://nodejs.org/api/os.html#os_os_uptime

func version*(): cstring {.importjs: "os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_version

func userInfo*(): cstring {.importjs: "JSON.stringify(os.$1())".}
  ## https://nodejs.org/api/os.html#os_os_userinfo_options


runnableExamples:  # These are computer specific can not assert them much.
  requireOs()
  echo arch()
  echo endianness()
  echo freemem()
  echo getPriority(pid = 0.cint)
  echo homedir()
  echo $loadavg()
  echo platform()
  echo release()
  echo tmpdir()
  echo totalmem()
  echo ostype()
  echo uptimeOs()
  echo version()
