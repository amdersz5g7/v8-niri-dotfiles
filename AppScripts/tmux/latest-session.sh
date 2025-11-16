#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux new-window -n bash -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.1 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.2 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:3.3 "vim /home/i3wm/.zshrc" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux new-session -d -n vimwiki -s vimwiki -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux split-window -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.2 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux new-window -n zsh -t vimwiki:2 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t vimwiki:2.1 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t vimwiki:2 "c4a6,208x55,0,0,9" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:3 "627f,208x55,0,0,10" > /dev/null
tmux -2u att
#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux new-window -n bash -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.1 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.2 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:3.3 "vim /home/i3wm/.zshrc" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux new-session -d -n vimwiki -s vimwiki -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux split-window -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.2 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux new-window -n zsh -t vimwiki:2 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t vimwiki:2.1 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t vimwiki:2 "648b,208x55,0,0{104x55,0,0,9,103x55,105,0,12}" > /dev/null
tmux split-window -t vimwiki:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:2.2 "vim .zshrc" Enter
tmux select-layout -t vimwiki:2 "648b,208x55,0,0{104x55,0,0,9,103x55,105,0,12}" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:3 "627f,208x55,0,0,10" > /dev/null
tmux -2u att
#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux new-window -n bash -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.1 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.2 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:3.3 "vim /home/i3wm/.zshrc" Enter
tmux select-layout -t i3-needs:3 "8cf6,208x54,0,0{87x54,0,0[87x27,0,0,4,87x26,0,28,5],120x54,88,0,6}" > /dev/null
tmux new-session -d -n vimwiki -s vimwiki -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux split-window -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.2 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux new-window -n zsh -t vimwiki:2 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t vimwiki:2.1 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t vimwiki:2 "648b,208x55,0,0{104x55,0,0,9,103x55,105,0,12}" > /dev/null
tmux split-window -t vimwiki:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:2.2 "echo -zsh" Enter
tmux select-layout -t vimwiki:2 "648b,208x55,0,0{104x55,0,0,9,103x55,105,0,12}" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:3 "627f,208x55,0,0,10" > /dev/null
tmux -2u att
#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux new-session -d -n vimwiki -s vimwiki -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux split-window -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.2 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t vimwiki:3 "627f,208x55,0,0,10" > /dev/null
tmux -2u att
#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "31fa,208x55,0,0{99x55,0,0,2,108x55,100,0,3}" > /dev/null
tmux new-session -d -n vimwiki -s vimwiki -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux split-window -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.2 "vim" Enter
tmux select-layout -t vimwiki:1 "e489,208x55,0,0{104x55,0,0,7,103x55,105,0,11}" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo btop" Enter
tmux select-layout -t vimwiki:3 "16f6,208x55,0,0[208x45,0,0,10,208x9,0,46,13]" > /dev/null
tmux split-window -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.2 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t vimwiki:3 "16f6,208x55,0,0[208x45,0,0,10,208x9,0,46,13]" > /dev/null
tmux -2u att
#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "813b,213x59,0,0{102x59,0,0,2,110x59,103,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "813b,213x59,0,0{102x59,0,0,2,110x59,103,0,3}" > /dev/null
tmux new-window -n bash -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.1 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "5f95,213x59,0,0{90x59,0,0[90x30,0,0,4,90x28,0,31,5],122x59,91,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.2 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "5f95,213x59,0,0{90x59,0,0[90x30,0,0,4,90x28,0,31,5],122x59,91,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:3.3 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "5f95,213x59,0,0{90x59,0,0[90x30,0,0,4,90x28,0,31,5],122x59,91,0,6}" > /dev/null
tmux new-session -d -n zsh -s learn-GO -c /home/i3wm
sleep 0.2
tmux send-keys -t learn-GO:1.1 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t learn-GO:1 "6311,112x56,0,0,12" > /dev/null
tmux new-window -n vimwiki -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:1 "d264,213x59,0,0,7" > /dev/null
tmux new-window -n zsh -t vimwiki:2 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t vimwiki:2.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:2 "d266,213x59,0,0,9" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:3 "695f,213x59,0,0,10" > /dev/null
tmux -2u att
#!/bin/bash
if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n i3 -s i3-needs -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.1 "vim .config/i3/config" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux split-window -t i3-needs:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:1.2 "vim .config/i3/scripts/picom.conf" Enter
tmux select-layout -t i3-needs:1 "feb0,208x55,0,0{109x55,0,0,0,98x55,110,0,1}" > /dev/null
tmux new-window -n polybar -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.1 "vim .config/polybar/config.ini" Enter
tmux select-layout -t i3-needs:2 "813b,213x59,0,0{102x59,0,0,2,110x59,103,0,3}" > /dev/null
tmux split-window -t i3-needs:2 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:2.2 "vim .config/polybar/modules.ini" Enter
tmux select-layout -t i3-needs:2 "813b,213x59,0,0{102x59,0,0,2,110x59,103,0,3}" > /dev/null
tmux new-window -n bash -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.1 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "3ff0,79x56,0,0{23x56,0,0[23x28,0,0,4,23x27,0,29,5],55x56,24,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t i3-needs:3.2 "echo -zsh" Enter
tmux select-layout -t i3-needs:3 "3ff0,79x56,0,0{23x56,0,0[23x28,0,0,4,23x27,0,29,5],55x56,24,0,6}" > /dev/null
tmux split-window -t i3-needs:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t i3-needs:3.3 "echo /bin/bash /home/i3wm/Documents/AppScripts/tmux/tmux-save-session.sh" Enter
tmux select-layout -t i3-needs:3 "3ff0,79x56,0,0{23x56,0,0[23x28,0,0,4,23x27,0,29,5],55x56,24,0,6}" > /dev/null
tmux new-session -d -n vim -s learn-GO -c /home/i3wm/Documents/GoLang/learn-01/cmd/tutorial-01
sleep 0.2
tmux send-keys -t learn-GO:1.1 "vim main.go" Enter
tmux select-layout -t learn-GO:1 "6281,79x56,0,0,12" > /dev/null
tmux new-window -n vimwiki -t vimwiki:1 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:1.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:1 "d264,213x59,0,0,7" > /dev/null
tmux new-window -n zsh -t vimwiki:2 -c /home/i3wm/Documents/AppScripts/tmux
sleep 0.2
tmux send-keys -t vimwiki:2.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:2 "d266,213x59,0,0,9" > /dev/null
tmux new-window -n btop -t vimwiki:3 -c /home/i3wm
sleep 0.2
tmux send-keys -t vimwiki:3.1 "echo -zsh" Enter
tmux select-layout -t vimwiki:3 "695f,213x59,0,0,10" > /dev/null
tmux -2u att
