FROM ruby:2.7.2-slim

RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    curl gnupg2 build-essential patch ruby-dev zlib1g-dev liblzma-dev libpq-dev git-core nano

RUN set -x; \
		echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
		&& curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
		&& apt-get update \
		&& apt-get install -y postgresql-client-12

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .
