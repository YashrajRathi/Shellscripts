alias cc='clear'
alias update_alias='. /home/username/shortcuts/alias.sh'
alias edit_aliases='code -n /home/username/shortcuts/alias.sh'
alias gp='git push origin $(git branch --show-current)'
alias connect_my_bluetooth="bluetoothctl connect 8C:64:A2:DF:23:8B"
alias disconnect_my_bluetooth="bluetoothctl disconnect 8C:64:A2:DF:23:8B"
alias new_temp_key="/home/username/Shellscripts/get_new_temp_key.sh"
alias ssh_to_ubuntu_node="/home/username/Shellscripts/ssh_to_ubuntu_server.sh"
alias bash_into_docker="/home/username/Shellscripts/bash_into_docker_container.sh"
alias build_metric_server="/home/username/Shellscripts/metric_server_build.sh"
alias create_new_shortcut_script="code -n /home/username/Shellscripts/"
alias modify_kube_manifest="/home/username/Shellscripts/edit_manifests_file.sh"
alias save_kube_apiserver_manifest_file_to_kube="/home/username/Shellscripts/save_kube_apiserver_manifest_file_to_kube.sh"
alias make_kube_apiserver="/home/username/Shellscripts/make_kube_apiserver.sh"
alias observe_kubeapi_pod="watch -n 2 /home/username/Shellscripts/observe_kubeapi_pod.sh"
alias mkubectl="/home/username/Shellscripts/make_kubectl.sh"
alias aa="echo '[0-9a-z\-_]*.go'"
alias k="kubectl" 
alias kube_complete="source <(kubectl completion bash) ; complete -F __start_kubectl k ;"
source <(kubectl completion bash) ;
complete -F __start_kubectl k ;
alias bkubelet="/home/username/Shellscripts/build_kubelet.sh"