const development = {
  port: 8000,
  sessionSecret: RANDOM_SECRET_KEY
}

const production = {
  port: 8080,
  sessionSecret: RANDOM_SECRET_KEY
}

module.exports = process.env.NODE_ENV === 'production' ? production : development
