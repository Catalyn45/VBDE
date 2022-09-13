from __future__ import (absolute_import, division, print_function)

import os
import subprocess

from ranger.api.commands import Command


class fzf(Command):
    """
    :fzf
    Find a file using fzf.
    With a prefix argument to select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os
        from ranger.ext.get_executables import get_executables

        if 'fzf' not in get_executables():
            self.fm.notify('Could not find fzf in the PATH.', bad=True)
            return

        fd = None
        if 'fdfind' in get_executables():
            fd = 'fdfind'
        elif 'fd' in get_executables():
            fd = 'fd'

        if fd is not None:
            hidden = ('--hidden' if self.fm.settings.show_hidden else '')
            exclude = "--no-ignore-vcs --exclude '.git' --exclude '*.py[co]' --exclude '__pycache__'"
            only_directories = ('--type directory' if self.quantifier else '')
            fzf_default_command = '{} --follow {} {} {} --color=always'.format(
                fd, hidden, exclude, only_directories
            )
        else:
            hidden = ('-false' if self.fm.settings.show_hidden else r"-path '*/\.*' -prune")
            exclude = r"\( -name '\.git' -o -iname '\.*py[co]' -o -fstype 'dev' -o -fstype 'proc' \) -prune"
            only_directories = ('-type d' if self.quantifier else '')
            fzf_default_command = 'find -L . -mindepth 1 {} -o {} -o {} -print | cut -b3-'.format(
                hidden, exclude, only_directories
            )

        env = os.environ.copy()
        env['FZF_DEFAULT_COMMAND'] = fzf_default_command
        env['FZF_DEFAULT_OPTS'] = '--height=95% --border --layout reverse --layout=reverse --ansi --preview="{}"'.format('''
            (
                batcat --color=always {} ||
                bat --color=always {} ||
                cat {} ||
                tree -ahpCL 3 -I '.git' -I '*.py[co]' -I '__pycache__' {}
            ) 2>/dev/null | head -n 100
        ''')

        fzf = self.fm.execute_command('fzf --no-multi', env=env,
                                      universal_newlines=True, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            selected = os.path.abspath(stdout.strip())
            if os.path.isdir(selected):
                self.fm.cd(selected)
            else:
                self.fm.select_file(selected)


class fzf_mark(Command):
    """
    `:fzf_mark` refer from `:fzf_select`  (But Just in `Current directory and Not Recursion`)
        so just `find` is enough instead of `fdfind`)

    `:fzf_mark` can One/Multi/All Selected & Marked files of current dir that filterd by `fzf extended-search mode` 
        fzf extended-search mode: https://github.com/junegunn/fzf#search-syntax
        eg:    py    'py    .py    ^he    py$    !py    !^py
    In addition:
        there is a delay in using `get_executables` (So I didn't use it)
        so there is no compatible alias.
        but find is builtin command, so you just consider your `fzf` name
    Usage
        :fzf_mark
        
        shortcut in fzf_mark:
            <CTRL-a>      : select all 
            <CTRL-e>      : deselect all 
            <TAB>         : multiple select
            <SHIFT+TAB>   : reverse multiple select
            ...           : and some remap <Alt-key> for movement
    """

    def execute(self):
        # from pathlib import Path  # Py3.4+
        import os
        import subprocess

        fzf_name = "fzf" 

        hidden = ('-false' if self.fm.settings.show_hidden else r"-path '*/\.*' -prune")
        exclude = r"\( -name '\.git' -o -iname '\.*py[co]' -o -fstype 'dev' -o -fstype 'proc' \) -prune"
        only_directories = ('-type d' if self.quantifier else '')
        fzf_default_command = 'find -L . -mindepth 1 -type d -prune {} -o {} -o {} -print | cut -b3-'.format(
            hidden, exclude, only_directories
        )

        env = os.environ.copy()
        env['FZF_DEFAULT_COMMAND'] = fzf_default_command

        # you can remap and config your fzf (and your can still use ctrl+n / ctrl+p ...) + preview
        env['FZF_DEFAULT_OPTS'] = '\
        --multi \
        --reverse \
        --bind ctrl-a:select-all,ctrl-e:deselect-all,alt-n:down,alt-p:up,alt-o:backward-delete-char,alt-h:beginning-of-line,alt-l:end-of-line,alt-j:backward-char,alt-k:forward-char,alt-b:backward-word,alt-f:forward-word \
        --height 95% \
        --layout reverse \
        --border \
        --preview "cat {}  | head -n 100"'
        # if use bat instead of cat, you need install it
        # --preview "bat --style=numbers --color=always --line-range :500 {}"'

        fzf = self.fm.execute_command(fzf_name, env=env, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()

        if fzf.returncode == 0:
            filename_list = stdout.strip().split()
            for filename in filename_list:
                # Python3.4+
                # self.fm.select_file( str(Path(filename).resolve()) )
                self.fm.select_file( os.path.abspath(filename) )
                self.fm.mark_files(all=False,toggle=True)
