FROM circleci/php:7.4.6-fpm-buster

RUN cd /home/circleci \
    && git clone https://github.com/suhanyujie/php-parser-combination.git \
    && cd /home/circleci/php-parser-combination \
    && composer config repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && composer install --no-progress \
    && printf '#!/bin/sh\nXvfb :99 -screen 0 1280x1024x24 &\nexec "$@"\n' > /tmp/entrypoint \
    && chmod +x /tmp/entrypoint \
        && sudo mv /tmp/entrypoint /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh"]
