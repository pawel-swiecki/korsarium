# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"

# Layout Custom Elements - Auto-load all layout primitives
# These auto-load with preload: true - no index.js or manual imports needed
# Just drop a new layout .js file in the directory and it works
pin_all_from "app/javascript/layout_custom_elements", under: "layout_custom_elements", preload: true
