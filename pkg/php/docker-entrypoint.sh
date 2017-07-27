#!/bin/bash
#######################################################
#       author : baishaohua                           #
#       mail   : nginxs@126.com                       #
#       blog   : new.nginxs.net                       #
#       msg    : startup php7.1.0 for docker #
#######################################################

#Shell Base Env
PHP_HOME="/usr/local/php-fastcgi"
PHP_FPM="${PHP_HOME}/sbin/php-fpm"
PHP_CONF_PORT="${PHP_HOME}/etc/php-fpm.conf"
PHP_CONF_SOCK="${PHP_HOME}/etc/php-fpm-sock.conf"
CHOICE="$1"
usage(){
	echo 'only one argv startup show nginx:[ sock | port ]'
}

#this shell main function
main(){
case  ${CHOICE} in
        sock)
	    echo "php sock '/usr/local/php-fastcgi/php-fpm.sock' is start"
            ${PHP_FPM} --fpm-config ${PHP_CONF_SOCK}
                ;;
        port)
	    echo "php port 9000 is start"
            ${PHP_FPM} --fpm-config ${PHP_CONF_PORT}
                ;;
        *) usage
        exit 1;
esac
}

main $1

