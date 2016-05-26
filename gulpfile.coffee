gulp           = require('gulp')
mainBowerFiles = require('main-bower-files')

gulp.task 'populate-slides', ->
  gulp
    .src mainBowerFiles(), base: './bower_components'
    .pipe gulp.dest('./slides')

gulp.task 'default', ['populate-slides']
