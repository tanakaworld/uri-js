module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      'publish':
        options:
          join: true
          bare: true
        files:
          'dist/uri.js': ['src/uri.coffee']
    karma:
      unit:
        configFile: 'karma.conf.coffee'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-karma'

  grunt.registerTask 'dist', ['coffee']
  grunt.registerTask 'spec', ['karma']
