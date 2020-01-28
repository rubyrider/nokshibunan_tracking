require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

import 'popper.js'
import  'bootstrap';
import  'select2';
import  'lightbox2';
import 'slick-carousel'
import 'animsition'
import 'toastr'
import './plugins/slick-custom'
import './plugins/main'
import './custom'
global.toastr = require("toastr");