$('#summernote').summernote({
	toolbar: [
	    // [groupName, [list of button]]
	    ['fontsize', ['fontsize']],
	    ['fontname', ['fontname']],
	    ['color', ['color']],
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']],
	    ['view', ['fullscreen', 'codeview', 'help']],
	],
	height: 300,
	minHeight: null,      // 최소 높이값(null은 제한 없음)
	maxHeight: null,      // 최대 높이값(null은 제한 없음)
	focus: false,         // 페이지가 열릴때 포커스를 지정함
	lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
});