#!/bin/bash
ssh joseph.mafrici@unix.cset.oit.edu -t 'tmux attach-session -t 0 || tmux new'
