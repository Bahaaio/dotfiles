local Config = require('config')

require('utils.backdrops'):set_images():random()

-- stylua: ignore
return Config:init()
   :append(require('config.appearance'))
   :append(require('config.keys')).options
