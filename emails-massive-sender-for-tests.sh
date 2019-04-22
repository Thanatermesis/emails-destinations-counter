#!/bin/bash
[[ -z $HOME ]] && export HOME="/home/$(id -un)"
[[ -z $USER ]] && export USER="$(id -un)"


mailx_send(){
    local to subject
    if [[ -z "$3" ]] ; then
        echo "Usage: $(basename $0) to subject body"
        exit 1
    fi

    to="$1"
    shift
    subject="$1"
    shift

    if [[ -x "$(which heirloom-mailx)" ]] ; then
        echo "$@" | heirloom-mailx \
            -r "no-reply@$(hostname)" \
            -s "$subject" "$to"
    else
        echo "$@" | mailx -e -s "$subject" -a "Content-Type: text/plain; charset=UTF-8" -a "Content-Transfer-Encoding: 8bit" "$to"
    fi
}



main(){
    # pre {{{
    local count

    # }}}
    count=0

    while true
    do
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:_$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:__$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:___$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:____$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:_____$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:______$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:_______$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:________$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:_________$count" "body message"
        sleep 60
        count="$(( $count +1 ))"
        mailx_send yoda@stop-spams.com "Test:__________$count" "body message"
        sleep 60
    done


}

#
#  MAIN
#
main "$@"

# vim: set foldmethod=marker :
count=
