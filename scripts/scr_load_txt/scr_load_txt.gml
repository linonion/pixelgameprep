/// @function scr_load_txt(fname)
/// @desc 同步加载文本文件，按 `/` 分割并修剪空白，返回字符串数组
/// @arg fname {string}  包含在 Included Files 里的文件名，比如 "mengpo.txt"
function scr_load_txt(fname)
{
    // 1) 读取文件全文 —— Included Files 会在运行时复制到工作目录
    var _raw = "";
    if (file_exists(fname)) {
        var _fh  = file_text_open_read(fname);
		_raw = file_text_read_string(_fh);
        file_text_close(_fh);
    } else {
        show_debug_message("File not found: " + fname);
        return [];
    }


    // 3) 按斜杠 `/` 分割 —— 你自己约定的句子结束符
    var _arr = string_split(_raw, "/");
	show_debug_message(_arr)

    // 4) 修剪每句前后空白
    for (var i = 0; i < array_length(_arr); i++) {
        _arr[i] = string_trim(_arr[i]);
    }
    return _arr;   // 返回 ["句1", "句2", …]
}
