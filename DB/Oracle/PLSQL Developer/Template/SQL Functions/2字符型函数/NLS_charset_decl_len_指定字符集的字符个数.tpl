NLS_charset_decl_len([#]bytecnt, csid)
--返回一个 NCHAR 列的声明长度（也就是字符个数）。bytecnt 参数是列的宽度。csid参数是字符集 ID
--SELECT  NLS_CHARSET_DECL_LEN(200, nls_charset_id('ja16eucfixed')) a1 FROM DUAL;