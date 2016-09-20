Nightmare = require('nightmare')

baseUrl = process.argv[2]

class Runner extends Nightmare
  constructor: ->
    @dir = process.argv[3]
    super waitTimeout: 3000
    @

  capture: (name)->
    @screenshot "#{__dirname}/../#{@dir}/#{name}.png"
    @

# TODO: mobile
new Runner()
  .viewport 1024, 768

  .goto baseUrl
	.wait 1000
  .wait '.cs-leading'
  .capture '001_home'

  .click 'a[href="/auth/login"]'
	.wait 1000
  .wait '.cs-form'
  .capture '002_signin'

  .click 'input[type="submit"]'
	.wait 1000
  .wait '.cs-app-link'
  .capture '003_dashboard'

  .click 'a[href="/apps"]'
	.wait 1000
  .wait '.cs-apps'
  .wait '.cs-app-link'
  .capture '004_apps'

  .click 'a[href="/apps/plus-one-counter"]'
	.wait 1000
  .wait '.cs-app'
  .wait '.cs-app-header'
  .capture '005_apps_show'

  .end()
  .then (res)-> console.log(res)
  .catch (err)-> console.errro(err)
