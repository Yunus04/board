# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
 Rails.application.config.assets.precompile += %w(    bootstrap.scss custom.js chart.min.js chart-data.js easypiechart.js bootstrap.js  html5shiv.min.js lumino.glyphs.js  respond.min.js easypiechart-data.js bootstrap-datepicker.js custom.js jquery-1.11.1.min.js admin.js admin.css bootstrap.min.scss bootstrap.min.js ie10-viewport-bug-workaround.js ie-emulation-modes-warning.js home.scss devise.scss reset.scss devise.js dashboard.scss datepicker3.scss )
