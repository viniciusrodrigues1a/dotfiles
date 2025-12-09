#!/usr/bin/env python3

import i3ipc


class FibonacciLayout:
    def __init__(self):
        self.i3 = i3ipc.Connection()
        self.tree = self.i3.get_tree()
        self.focused_workspace = self.tree.find_focused().workspace()
        self.window_count_on_focused_workspace = 0

    def get_next_split_direction(self):
        self.check_for_windows_on_current_workspace()
        self.split_window()

    def check_for_windows_on_current_workspace(self):
        for con in self.tree:
            if con.window and con.parent.type != 'dockarea':
                if con.workspace() != self.focused_workspace:
                    continue
                self.window_count_on_focused_workspace += 1

    def split_window(self):
        if self.window_count_on_focused_workspace % 2 == 0:
            self.i3.command('split v')
        else:
            self.i3.command('split h')


FibonacciLayout().get_next_split_direction()
