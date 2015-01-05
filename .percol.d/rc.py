# Run command file for percol

# By default, percol interprets input queries by users as string. If you prefer regular expression, try --match-method command line option.
# $ percol --match-method regex


# mutiple selection
# percol.command.toggle_mark_and_next() (which is bound to C-SPC by default).
# percol.command.mark_all() (bound to M-a), percol.command.unmark_all() (bound to M-e) and percol.command.toggle_mark_all() (反向选择M-t) are useful to mark / unmark all candidates at once.

# XDDDDDD and color prompt
percol.view.PROMPT  = ur"<bold><magenta> XDDDDDD </magenta></bold> %q"

percol.view.CANDIDATES_LINE_BASIC    = ("on_default", "default")
percol.view.CANDIDATES_LINE_SELECTED = ("block", "on_blue", "white")
percol.view.CANDIDATES_LINE_MARKED   = ("bold", "on_cyan", "black")
percol.view.CANDIDATES_LINE_QUERY    = ("blue", "bold")

# Emacs like
percol.import_keymap({
    "C-h" : lambda percol: percol.command.delete_backward_char(),
    "C-d" : lambda percol: percol.command.delete_forward_char(),
    "C-k" : lambda percol: percol.command.kill_end_of_line(),
    "C-y" : lambda percol: percol.command.yank(),
    "C-t" : lambda percol: percol.command.transpose_chars(),
    "C-a" : lambda percol: percol.command.beginning_of_line(),
    "C-e" : lambda percol: percol.command.end_of_line(),
    "C-b" : lambda percol: percol.command.backward_char(),
    "C-f" : lambda percol: percol.command.forward_char(),
    "M-f" : lambda percol: percol.command.forward_word(),
    "M-b" : lambda percol: percol.command.backward_word(),
    "M-d" : lambda percol: percol.command.delete_forward_word(),
    "M-h" : lambda percol: percol.command.delete_backward_word(),
    "C-n" : lambda percol: percol.command.select_next(),
    "C-p" : lambda percol: percol.command.select_previous(),
    "C-v" : lambda percol: percol.command.select_next_page(),
    "M-v" : lambda percol: percol.command.select_previous_page(),
    "M-a" : lambda percol: percol.command.mark_all(),
    "M-e" : lambda percol: percol.command.unmark_all(),
    "M-t" : lambda percol: percol.command.toggle_mark_all(),
})
