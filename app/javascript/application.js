// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// application.js
import 'bootstrap'
import '../stylesheets/application.scss'

document.addEventListener('DOMContentLoaded', function() {
    var modals = document.querySelectorAll('.modal');
    modals.forEach(function(modal) {
      new bootstrap.Modal(modal);
    });
  });
  