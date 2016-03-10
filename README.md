# Rails on Kontena
![](http://rubyonrails.org/images/rails-logo.svg)

## Usage

1. Setup Kontena: [Quick Start](http://kontena.io/docs/getting-started/quick-start)

2. Write secrets to [Kontena Vault](http://kontena.io/docs/using-kontena/vault)

  `$ kontena vault write POSTGRE_PASSWORD <password>`

  `$ kontena vault write RAILS_SECRET_KEY_BASE <key_base>`

  `$ kontena vault write RAILS_GITHUB_CLIENT_ID <client_id>`

  `$ kontena vault write RAILS_GITHUB_CLIENT_SECRET <client_secret>`

  `$ kontena vault write RAILS_GITHUB_TOKEN <access_token>`

  `$ kontena vault write RAILS_POSTGRE_URL <postgres_url>`

3. Deploy app

  `$ kontena app deploy`

## About Kontena

Kontena is a new open source Docker platform including orchestration, service discovery, overlay networking and all the tools required to run your containerized workloads. Kontena is built to maximize developer happiness. It works on any cloud, it's easy to setup and super simple to use. [Give it a try]((http://kontena.io/docs/getting-started/quick-start))! If you like it, please star it on [GitHub](https://github.com/kontena/kontena) and follow us on [Twitter]()!