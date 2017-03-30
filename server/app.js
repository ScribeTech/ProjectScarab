const config = require('./config.js')
const express = require('express')
const app = express()

app.listen(config.port, () => console.log(`Listening on port ${config.port}`))
