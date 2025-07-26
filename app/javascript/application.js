// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// TURBO STREAM RELOAD FOR PROFILE PAGES
Turbo.StreamActions.reload = function() {
  window.location.reload()
};

