
let
  F_OK* {.importjs: "fs.F_OK".}: cint
  R_OK* {.importjs: "fs.R_OK".}: cint
  W_OK* {.importjs: "fs.W_OK".}: cint
  X_OK* {.importjs: "fs.X_OK".}: cint
  COPYFILE_EXCL* {.importjs: "fs.constants.COPYFILE_EXCL".}: cint
  COPYFILE_FICLONE* {.importjs: "fs.constants.COPYFILE_FICLONE".}: cint
  COPYFILE_FICLONE_FORCE* {.importjs: "fs.constants.COPYFILE_FICLONE_FORCE".}: cint
  O_RDONLY* {.importjs: "fs.constants.O_RDONLY".}: cint
  O_WRONLY* {.importjs: "fs.constants.O_WRONLY".}: cint
  O_RDWR* {.importjs: "fs.constants.O_RDWR".}: cint
  O_CREAT* {.importjs: "fs.constants.O_CREAT".}: cint
  O_EXCL* {.importjs: "fs.constants.O_EXCL".}: cint
  O_NOCTTY* {.importjs: "fs.constants.O_NOCTTY".}: cint
  O_TRUNC* {.importjs: "fs.constants.O_TRUNC".}: cint
  O_APPEND* {.importjs: "fs.constants.O_APPEND".}: cint
  O_DIRECTORY* {.importjs: "fs.constants.O_DIRECTORY".}: cint
  O_NOATIME* {.importjs: "fs.constants.O_NOATIME".}: cint
  O_NOFOLLOW* {.importjs: "fs.constants.O_NOFOLLOW".}: cint
  O_SYNC* {.importjs: "fs.constants.O_SYNC".}: cint
  O_DSYNC* {.importjs: "fs.constants.O_DSYNC".}: cint
  O_SYMLINK* {.importjs: "fs.constants.O_SYMLINK".}: cint
  O_DIRECT* {.importjs: "fs.constants.O_DIRECT".}: cint
  O_NONBLOCK* {.importjs: "fs.constants.O_NONBLOCK".}: cint
  UV_FS_O_FILEMAP* {.importjs: "fs.constants.UV_FS_O_FILEMAP".}: cint
  S_IFMT* {.importjs: "fs.constants.S_IFMT".}: cint
  S_IFREG* {.importjs: "fs.constants.S_IFREG".}: cint
  S_IFDIR* {.importjs: "fs.constants.S_IFDIR".}: cint
  S_IFCHR* {.importjs: "fs.constants.S_IFCHR".}: cint
  S_IFBLK* {.importjs: "fs.constants.S_IFBLK".}: cint
  S_IFIFO* {.importjs: "fs.constants.S_IFIFO".}: cint
  S_IFLNK* {.importjs: "fs.constants.S_IFLNK".}: cint
  S_IFSOCK* {.importjs: "fs.constants.S_IFSOCK".}: cint
  S_IRWXU* {.importjs: "fs.constants.S_IRWXU".}: cint
  S_IRUSR* {.importjs: "fs.constants.S_IRUSR".}: cint
  S_IWUSR* {.importjs: "fs.constants.S_IWUSR".}: cint
  S_IXUSR* {.importjs: "fs.constants.S_IXUSR".}: cint
  S_IRWXG* {.importjs: "fs.constants.S_IRWXG".}: cint
  S_IRGRP* {.importjs: "fs.constants.S_IRGRP".}: cint
  S_IWGRP* {.importjs: "fs.constants.S_IWGRP".}: cint
  S_IXGRP* {.importjs: "fs.constants.S_IXGRP".}: cint
  S_IRWXO* {.importjs: "fs.constants.S_IRWXO".}: cint
  S_IROTH* {.importjs: "fs.constants.S_IROTH".}: cint
  S_IWOTH* {.importjs: "fs.constants.S_IWOTH".}: cint
  S_IXOTH* {.importjs: "fs.constants.S_IXOTH".}: cint
  UV_FS_SYMLINK_DIR* {.importjs: "fs.constants.UV_FS_SYMLINK_DIR".}: cint
  UV_FS_SYMLINK_JUNCTION* {.importjs: "fs.constants.UV_FS_SYMLINK_JUNCTION".}: cint
  UV_DIRENT_UNKNOWN* {.importjs: "fs.constants.UV_DIRENT_UNKNOWN".}: cint
  UV_DIRENT_FILE* {.importjs: "fs.constants.UV_DIRENT_FILE".}: cint
  UV_DIRENT_DIR* {.importjs: "fs.constants.UV_DIRENT_DIR".}: cint
  UV_DIRENT_LINK* {.importjs: "fs.constants.UV_DIRENT_LINK".}: cint
  UV_DIRENT_FIFO* {.importjs: "fs.constants.UV_DIRENT_FIFO".}: cint
  UV_DIRENT_SOCKET* {.importjs: "fs.constants.UV_DIRENT_SOCKET".}: cint
  UV_DIRENT_CHAR* {.importjs: "fs.constants.UV_DIRENT_CHAR".}: cint
  UV_DIRENT_BLOCK* {.importjs: "fs.constants.UV_DIRENT_BLOCK".}: cint
  UV_FS_COPYFILE_EXCL* {.importjs: "fs.constants.UV_FS_COPYFILE_EXCL".}: cint
  UV_FS_COPYFILE_FICLONE* {.importjs: "fs.constants.UV_FS_COPYFILE_FICLONE".}: cint
  UV_FS_COPYFILE_FICLONE_FORCE* {.importjs: "fs.constants.UV_FS_COPYFILE_FICLONE_FORCE".}: cint

when defined(osx):
  func lchmod*[T](path: cstring; mode: cint; callback: T) {.importjs: "fs.$1(#, #, #)".}
    ## https://nodejs.org/api/fs.html#fs_fs_lchmod_path_mode_callback Only available on OSX?.

func importFs*() {.importjs: "import * as fs from 'fs'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireFs*() {.importjs: "const fs = require('fs')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func dirRead*[T](path: cstring; callback: T) {.importjs: """
  (() => { const d = fs.opendirSync(#); d.read(#); d.closeSync() })()""".}
  ## https://nodejs.org/api/fs.html#fs_dir_read_callback

func access*[T](path: cstring; mode: cint; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_access_path_mode_callback

func accessSync*(path: cstring; mode: cint) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_accesssync_path_mode

func appendFile*[T](path, data: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_appendfile_path_data_options_callback

func appendFileSync*(path, data: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_appendfilesync_path_data_options

func chmod*[T](path: cstring; mode: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmod_path_mode_callback

func chmod*[T](path: cstring; mode: cint; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmod_path_mode_callback

func chmodSync*(path: cstring; mode: cint) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmodsync_path_mode

func chmodSync*(path: cstring; mode: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmodsync_path_mode

func chown*[T](path: cstring; uid: cint; gid: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chown_path_uid_gid_callback

func chownSync*(path: cstring; uid: cint; gid: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chownsync_path_uid_gid

func close*[T](fd: cint; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_close_fd_callback

func closeSync*(fd: cint) {.importjs: "fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_closesync_fd

func copyFile*[T](src, dest: cstring; mode: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_mode_callback

func copyFile*[T](src, dest: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_mode_callback

func copyFileSync*(src, dest: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfilesync_src_dest_mode

func copyFileSync*(src, dest: cstring; mode: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfilesync_src_dest_mode

func existsSync*(path: cstring): bool {.importjs: "(fs.$1(#) || false)".}
  ## https://nodejs.org/api/fs.html#fs_fs_existssync_path

func fchmod*[T](fd: cint; mode: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmod_fd_mode_callback

func fchmod*[T](fd: cint; mode: cint; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmod_fd_mode_callback

func fchmodSync*(fd: cint; mode: cint) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmodsync_fd_mode

func fchmodSync*(fd: cint; mode: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmodsync_fd_mode

func fchown*[T](fd, uid, gid: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchown_fd_uid_gid_callback

func fchownSync*(fd, uid, gid: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchownsync_fd_uid_gid

func fdatasync*[T](fd: cint; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fdatasync_fd_callback

func fdatasyncSync*(fd: cint) {.importjs: "fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fdatasyncsync_fd

func fstat*[T](fd: cint; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fstat_fd_options_callback

func fsync*[T](fd: cint; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fsync_fd_callback

func ftruncate*[T](fd: cint; len: cint; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_ftruncate_fd_len_callback

func ftruncate*[T](fd: cint; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_ftruncate_fd_len_callback

func ftruncateSync*(fd: cint; len: cint) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_ftruncatesync_fd_len

func futimes*[T](fd: cint; atime: cint; mtime: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimes_fd_atime_mtime_callback

func futimes*[T](fd: cint; atime: cstring; mtime: cstring; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimes_fd_atime_mtime_callback

func futimesSync*(fd: cint; atime: cstring; mtime: cstring) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimessync_fd_atime_mtime

func futimesSync*(fd: cint; atime: cint; mtime: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimessync_fd_atime_mtime

func lchown*[T](path: cstring; uid: cint; gid: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lchown_path_uid_gid_callback

func lchownSync*(path: cstring; uid: cint; gid: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lchownsync_path_uid_gid

func lutimes*[T](path: cstring; atime: cint; mtime: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimes_path_atime_mtime_callback

func lutimes*[T](path: cstring; atime: cstring; mtime: cstring; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimes_path_atime_mtime_callback

func lutimesSync*(path: cstring; atime: cstring; mtime: cstring) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimessync_path_atime_mtime

func lutimesSync*(path: cstring; atime: cint; mtime: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimessync_path_atime_mtime

func link*[T](existingPath: cstring; newPath: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_link_existingpath_newpath_callback

func linkSync*(existingPath: cstring; newPath: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_linksync_existingpath_newpath

func lstat*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lstat_path_options_callback

func mkdir*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdir_path_options_callback

func mkdirSync*(path: cstring; recursive = false) {.importjs: "fs.$1(#, {recursive: #})".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdirsync_path_options

func mkdtemp*[T](prefix: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdtemp_prefix_options_callback

func mkdtempSync*(prefix: cstring): cstring {.importjs: "(fs.$1(#) || '')".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdtempsync_prefix_options

func open*[T](path: cstring; flags: cstring; mode: cstring; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback

func open*[T](path: cstring; flags: cint; mode: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback

func open*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback

func opendir*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_opendir_path_options_callback

func openSync*(path: cstring; flags: cint; mode: cint): cint {.importjs: "(fs.$1(#, #, #) || 0)".}
  ## https://nodejs.org/api/fs.html#fs_fs_opensync_path_flags_mode

func openSync*(path: cstring; flags: cstring; mode: cstring): cint {.importjs: "(fs.$1(#, #, #) || 0)".}
  ## https://nodejs.org/api/fs.html#fs_fs_opensync_path_flags_mode

func read*[T](fd: cint; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_read_fd_options_callback

func readdir*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readdir_path_options_callback

func readFile*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback

func readFileSync*(path: cstring): cstring {.importjs: "(fs.$1(#).toString() || '')".}
  ## https://nodejs.org/api/fs.html#fs_fs_readfilesync_path_options

func readlink*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readlink_path_options_callback

func readlink*(path: cstring): cstring {.importjs: "(fs.$1(#) || '')".}
  ## https://nodejs.org/api/fs.html#fs_fs_readlinksync_path_options

func readlinkSync*(path: cstring): cstring {.importjs: "(fs.$1(#) || '')".}
  ## https://nodejs.org/api/fs.html#fs_fs_readlinksync_path_options

func realpath*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpath_path_options_callback

func realpathNative*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpath_native_path_options_callback

func realpathSync*(path: cstring): cstring {.importjs: "(fs.$1(#) || '')".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpathsync_path_options

func realpathSyncNative*(path: cstring): cstring {.importjs: "(fs.$1(#) || '')".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpathsync_native_path_options

func rename*[T](oldPath, newPath: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rename_oldpath_newpath_callback

func renameSync*(oldPath, newPath: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_renamesync_oldpath_newpath

func rmdir*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rmdir_path_options_callback

func rmdir*(path: cstring) {.importjs: "fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rmdirsync_path_options

func rm*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rm_path_options_callback

func rmSync*(path: cstring) {.importjs: "fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rmsync_path_options

func stat*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_stat_path_options_callback

func symlink*[T](target, path, tipe: cstring; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlink_target_path_type_callback

func symlink*[T](target, path: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlink_target_path_type_callback

func symlinkSync*(target, path, tipe: cstring) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlinksync_target_path_type

func symlinkSync*(target, path: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlinksync_target_path_type

func truncate*[T](path: cstring; len: cint; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_truncate_path_len_callback

func truncate*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_truncate_path_len_callback

func truncateSync*(path: cstring; len: cint) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_truncatesync_path_len

func unlink*[T](path: cstring; callback: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unlink_path_callback

func unlinkSync*(path: cstring) {.importjs: "fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unlinksync_path

func utimes*[T](path: cstring; atime: cstring; mtime: cstring; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func utimes*[T](path: cstring; atime: cint; mtime: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func utimesSync*(path: cstring; atime: cint; mtime: cint) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func utimesSync*(path: cstring; atime: cstring; mtime: cstring) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func watch*[T](filename: cstring; listener: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_watch_filename_options_listener

func unwatchFile*[T](filename: cstring; listener: T) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unwatchfile_filename_listener

func unwatchFile*(filename: cstring) {.importjs: "fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unwatchfile_filename_listener

func unwatchFile*[T](fd: cint; stryng: cstring; position: cint; callback: T) {.importjs: "fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_write_fd_string_position_encoding_callback

func unwatchFile*[T](fd: cint; stryng: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_write_fd_string_position_encoding_callback

func writeFile*[T](fd: cint; data: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefile_file_data_options_callback

func writeFile*[T](fd: cstring; data: cstring; callback: T) {.importjs: "fs.$1(#, #, #)".}
  # https://nodejs.org/api/fs.html#fs_fs_writefile_file_data_options_callback

func writeFileSync*(file: cstring; data: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options

func writeFileSync*(file: cint; data: cstring) {.importjs: "fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options

func writeSync*(fd: cint; buffer: cstring; offset: cint; length: cint; position: cint): cint {.importjs: "(fs.$1(#, #, #, #, #) || 0)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func writeSync*(fd: cint; buffer: cstring; offset: cint; length: cint): cint {.importjs: "(fs.$1(#, #, #, #) || 0)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func writeSync*(fd: cint; buffer: cstring; offset: cint): cint {.importjs: "(fs.$1(#, #, #) || 0)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func writeSync*(fd: cint; buffer: cstring): cint {.importjs: "(fs.$1(#, #) || 0)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func touchFileSync*(filename: cstring) {.importjs: """
  (() => {
    const path = #;
    const time = new Date();
    try {
      fs.utimesSync(path, time, time);
    } catch(err) {
      fs.closeSync(fs.openSync(path, 'w'));
    }
  })()""".}
  ## Convenience func to touch a file.

template withDir*(dir: cstring, body: untyped): untyped =
  ## Same as Fusion `withDir` but for NodeJS, uses `__dirname`.
  {.emit: "{\nconst current_directory = __dirname;\ntry {\n  require('process').chdir('" & $dir & "');".}
  body
  {.emit: "} finally {\n  require('process').chdir(current_directory)\n}\n}".}


runnableExamples:
  requireFs()
  touchFileSync("touched.txt")
  writeFileSync("touched.txt".cstring, "data".cstring)
  appendFileSync("touched.txt".cstring, "\nmore data".cstring)
  renameSync("touched.txt".cstring, "renamed.txt".cstring)
  chmodSync("renamed.txt".cstring, 0o777)
  copyFileSync("renamed.txt".cstring, "copied.txt".cstring)
  let data: cstring = readFileSync("renamed.txt")
  # Need to be commented out for Node 13 and older.
  # rmSync("renamed.txt".cstring)
  # rmSync("copied.txt".cstring)
  echo mkdtempSync("test".cstring)
  # mkdirSync("/tmp/somerandomame".cstring, recursive = true)


runnableExamples("-r:off"):
  import jsbuffer
  requireFs()
  requireBuffer()
  proc example(error: int; data: Buffer) = echo data
  readFile("somefile.ext", example)
