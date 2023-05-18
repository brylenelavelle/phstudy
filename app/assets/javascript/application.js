// import { Application } from "@hotwired/stimulus"
import 'aframe';

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

//= require aframe.min.js

export { application }
