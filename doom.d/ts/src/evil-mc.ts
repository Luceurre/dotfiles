declare var lisp: any;

function addCursorsAtBeginningOfLines(begin: number, end: number): void {
  if (begin >= end) {
    return;
  }
  lisp.beginning_of_line();
  lisp.evil_mc_make_cursor_here();
  lisp.forward_line();
  addCursorsAtBeginningOfLines(lisp.point(), end);
}

lisp.defun({
  name: "mc-mark-beginning-of-lines",
  docString: "Mark the beginning of lines between BEGIN and END",
  interactive: false,
  args: "begin end",
  func: addCursorsAtBeginningOfLines,
});
