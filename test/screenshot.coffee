Nightmare = require('nightmare')

class Runner extends Nightmare
  constructor: ->
    @dir = process.argv[2]
    super waitTimeout: 3000
    @

  capture: (name)->
    @screenshot "#{__dirname}/../#{@dir}/#{name}.png"
    @

# TODO: mobile
new Runner()
  .viewport 1024, 768

  .goto 'https://csmock-sh19910711.c9users.io'
  .wait('.cs-leading')
  .capture('001_home')

  .click 'a[href="/auth/login"]'
  .wait('.cs-form')
  .capture('002_signin')

  .click 'input[type="submit"]'
  .wait('.cs-app-link')
  .capture('003_dashboard')

  .click 'a[href="/apps"]'
  .wait('.cs-apps')
  .wait('.cs-app-link')
  .capture('004_apps')

  .click 'a[href="/apps/plus-one-counter"]'
  .wait('.cs-app')
  .wait('.cs-app-header')
  .capture('005_apps_show')

  .end()
  .then (res)-> console.log(res)
  .catch (err)-> console.errro(err)
