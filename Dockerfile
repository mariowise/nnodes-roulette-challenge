
FROM phusion/passenger-ruby21

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Expose Nginx HTTP service
EXPOSE 80

# Git y descargar código fuente
RUN mkdir /home/app/webapp
WORKDIR /home/app/webapp
#RUN git clone https://github.com/mariowise/nnodes-roulette-challenge.git /home/app/webapp
ADD . /home/app/webapp

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Configure nginx site
RUN rm /etc/nginx/sites-enabled/default
RUN cp config/nginx/webapp.conf /etc/nginx/sites-enabled/webapp.conf
RUN cp config/nginx/secret_key.conf /etc/nginx/main.d/secret_key.conf
RUN cp config/nginx/gzip_max.conf /etc/nginx/conf.d/gzip_max.conf
RUN cp config/nginx/00_app_env.conf /etc/nginx/conf.d/00_app_env.conf

# Preparar gemas y assets
RUN bundle install --binstubs --deployment --without test development
RUN bundle exec rake assets:precompile
RUN RAILS_ENV=production bundle exec rake db:migrate
RUN chown -R app:app /home/app
RUN chmod -R 755 /home/app/webapp/public
RUN chmod 0664 /home/app/webapp/log/production.log
RUN bundle exec whenever -w

VOLUME ["/home/app/webapp"]

