# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"

# Layout Custom Elements
pin "layout_custom_elements", to: "layout_custom_elements/index.js"
pin_all_from "app/javascript/layout_custom_elements", under: "layout_custom_elements"
