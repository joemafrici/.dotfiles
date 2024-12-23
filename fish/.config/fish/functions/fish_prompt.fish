function fish_prompt
    set -l last_status $status

    set -l stat
    if test $last_status -ne 0
	set stat (set_color red)"[$last_status]"(set_color normal)
    end
    set -l git_status (fish_git_prompt)
    echo (set_color blue)deepwater (set_color green)(prompt_pwd) (set_color yellow)$git_status $stat (set_color purple)󰬯 (set_color normal)
end
