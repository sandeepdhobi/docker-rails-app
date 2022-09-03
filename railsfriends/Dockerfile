# Inspiration for dockerization of existing rails app
# https://towardsdatascience.com/how-to-dockerize-an-existing-ruby-on-rails-application-3eb6d16ec392
# https://docs.docker.com/samples/rails/
# https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application
# https://towardsdatascience.com/how-to-dockerize-an-existing-react-application-c27bd8517dcb
# https://nickjanetakis.com/blog/dealing-with-lock-files-when-using-ruby-node-and-elixir-with-docker
# https://github.com/sandeepdhobi/docker_workshop
# https://github.com/flatplanet/railsfriends
# https://www.reddit.com/r/docker/comments/th8icf/copying_files_from_a_parent_directory/

FROM ruby:2.6.6
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN yarn install
RUN bundle install
CMD ["bash"]