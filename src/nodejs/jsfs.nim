
func importNodeFs*() {.importjs: "import * as node_fs from 'fs'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeFs*() {.importjs: "const node_fs = require('fs')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func dirRead*(path: cstring; callback: proc) {.importjs: """
  (() => { const d = node_fs.opendirSync(#); d.read(#); d.closeSync() })()""".}
  ## https://nodejs.org/api/fs.html#fs_dir_read_callback

func access*(path: cstring; mode: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_access_path_mode_callback

func accessSync*(path: cstring; mode: cint) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_accesssync_path_mode

func appendFile*(path, data: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_appendfile_path_data_options_callback

func appendFileSync*(path, data: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_appendfilesync_path_data_options

func chmod*(path: cstring; mode: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmod_path_mode_callback

func chmod*(path: cstring; mode: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmod_path_mode_callback

func chmodSync*(path: cstring; mode: cint) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmodsync_path_mode

func chmodSync*(path: cstring; mode: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chmodsync_path_mode

func chown*(path: cstring; uid: cint; gid: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chown_path_uid_gid_callback

func chownSync*(path: cstring; uid: cint; gid: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_chownsync_path_uid_gid

func close*(fd: cint; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_close_fd_callback

func closeSync*(fd: cint) {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_closesync_fd

func copyFile*(src, dest: cstring; mode: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_mode_callback

func copyFile*(src, dest: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_mode_callback

func copyFileSync*(src, dest: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfilesync_src_dest_mode

func copyFileSync*(src, dest: cstring; mode: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_copyfilesync_src_dest_mode

func existsSync*(path: cstring): bool {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_existssync_path

func fchmod*(fd: cint; mode: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmod_fd_mode_callback

func fchmod*(fd: cint; mode: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmod_fd_mode_callback

func fchmodSync*(fd: cint; mode: cint) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmodsync_fd_mode

func fchmodSync*(fd: cint; mode: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchmodsync_fd_mode

func fchown*(fd, uid, gid: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchown_fd_uid_gid_callback

func fchownSync*(fd, uid, gid: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fchownsync_fd_uid_gid

func fdatasync*(fd: cint; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fdatasync_fd_callback

func fdatasyncSync*(fd: cint) {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fdatasyncsync_fd

func fstat*(fd: cint; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fstat_fd_options_callback

func fsync*(fd: cint; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_fsync_fd_callback

func ftruncate*(fd: cint; len: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_ftruncate_fd_len_callback

func ftruncate*(fd: cint; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_ftruncate_fd_len_callback

func ftruncateSync*(fd: cint; len: cint) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_ftruncatesync_fd_len

func futimes*(fd: cint; atime: cint; mtime: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimes_fd_atime_mtime_callback

func futimes*(fd: cint; atime: cstring; mtime: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimes_fd_atime_mtime_callback

func futimesSync*(fd: cint; atime: cstring; mtime: cstring) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimessync_fd_atime_mtime

func futimesSync*(fd: cint; atime: cint; mtime: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_futimessync_fd_atime_mtime

func lchmod*(path: cstring; mode: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lchmod_path_mode_callback

func lchmodSync*(path: cstring; mode: cint) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lchmodsync_path_mode

func lchown*(path: cstring; uid: cint; gid: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lchown_path_uid_gid_callback

func lchownSync*(path: cstring; uid: cint; gid: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lchownsync_path_uid_gid

func lutimes*(path: cstring; atime: cint; mtime: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimes_path_atime_mtime_callback

func lutimes*(path: cstring; atime: cstring; mtime: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimes_path_atime_mtime_callback

func lutimesSync*(path: cstring; atime: cstring; mtime: cstring) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimessync_path_atime_mtime

func lutimesSync*(path: cstring; atime: cint; mtime: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lutimessync_path_atime_mtime

func link*(existingPath: cstring; newPath: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_link_existingpath_newpath_callback

func linkSync*(existingPath: cstring; newPath: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_linksync_existingpath_newpath

func lstat*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_lstat_path_options_callback

func mkdir*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdir_path_options_callback

func mkdirSync*(path: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdirsync_path_options

func mkdtemp*(prefix: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdtemp_prefix_options_callback

func mkdtempSync*(prefix: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_mkdtempsync_prefix_options

func open*(path: cstring; flags: cstring; mode: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback

func open*(path: cstring; flags: cint; mode: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback

func open*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback

func opendir*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_opendir_path_options_callback

func openSync*(path: cstring; flags: cint; mode: cint): cint {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_opensync_path_flags_mode

func openSync*(path: cstring; flags: cstring; mode: cstring): cint {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_opensync_path_flags_mode

func read*(fd: cint; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_read_fd_options_callback

func readdir*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readdir_path_options_callback

func readFile*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback

func readFileSync*(path: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readfilesync_path_options

func readlink*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readlink_path_options_callback

func readlink*(path: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readlinksync_path_options

func readlinkSync*(path: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_readlinksync_path_options

func realpath*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpath_path_options_callback

func realpathNative*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpath_native_path_options_callback

func realpathSync*(path: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpathsync_path_options

func realpathSyncNative*(path: cstring): cstring {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_realpathsync_native_path_options

func rename*(oldPath, newPath: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rename_oldpath_newpath_callback

func renameSync*(oldPath, newPath: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_renamesync_oldpath_newpath

func rmdir*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rmdir_path_options_callback

func rmdir*(path: cstring) {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rmdirsync_path_options

func rm*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rm_path_options_callback

func rmSync*(path: cstring) {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_rmsync_path_options

func stat*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_stat_path_options_callback

func symlink*(target, path, tipe: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlink_target_path_type_callback

func symlink*(target, path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlink_target_path_type_callback

func symlinkSync*(target, path, tipe: cstring) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlinksync_target_path_type

func symlinkSync*(target, path: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_symlinksync_target_path_type

func truncate*(path: cstring; len: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_truncate_path_len_callback

func truncate*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_truncate_path_len_callback

func truncateSync*(path: cstring; len: cint) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_truncatesync_path_len

func unlink*(path: cstring; callback: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unlink_path_callback

func unlinkSync*(path: cstring) {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unlinksync_path

func utimes*(path: cstring; atime: cstring; mtime: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func utimes*(path: cstring; atime: cint; mtime: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func utimesSync*(path: cstring; atime: cint; mtime: cint) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func utimesSync*(path: cstring; atime: cstring; mtime: cstring) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback

func watch*(filename: cstring; listener: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_watch_filename_options_listener

func unwatchFile*(filename: cstring; listener: proc) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unwatchfile_filename_listener

func unwatchFile*(filename: cstring) {.importjs: "node_fs.$1(#)".}
  ## https://nodejs.org/api/fs.html#fs_fs_unwatchfile_filename_listener

func unwatchFile*(fd: cint; stryng: cstring; position: cint; callback: proc) {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_write_fd_string_position_encoding_callback

func unwatchFile*(fd: cint; stryng: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_write_fd_string_position_encoding_callback

func writeFile*(fd: cint; data: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefile_file_data_options_callback

func writeFile*(fd: cstring; data: cstring; callback: proc) {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefile_file_data_options_callback

func writeFileSync*(file: cstring; data: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options

func writeFileSync*(file: cint; data: cstring) {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options

func writeSync*(fd: cint; buffer: cstring; offset: cint; length: cint; position: cint): cint {.importjs: "node_fs.$1(#, #, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func writeSync*(fd: cint; buffer: cstring; offset: cint; length: cint): cint {.importjs: "node_fs.$1(#, #, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func writeSync*(fd: cint; buffer: cstring; offset: cint): cint {.importjs: "node_fs.$1(#, #, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func writeSync*(fd: cint; buffer: cstring): cint {.importjs: "node_fs.$1(#, #)".}
  ## https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position

func touchFile*(filename: cstring) {.importjs: """
  (() => {
    const path = #;
    const time = new Date();
    node_fs.utimes(path, time, time, err => {
      if (err) {
        return node_fs.open(path, 'w', (err, fd) => {
          if (err) {
            throw err;
          } else {
             node_fs.close(fd);
          };
        });
      }
    });
  };)()""".}
  ## Convenience func to touch a file.

func touchFileSync*(filename: cstring) {.importjs: """
  (() => {
    const path = #;
    const time = new Date();
    try {
      node_fs.utimesSync(path, time, time);
    } catch(err) {
      node_fs.closeSync(node_fs.openSync(path, 'w'));
    }
  };)()""".}
  ## Convenience func to touch a file.
