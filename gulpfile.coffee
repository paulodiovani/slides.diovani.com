gulp           = require('gulp')
connect        = require('gulp-connect')
mainBowerFiles = require('main-bower-files')

gulp.task 'populate-slides', ->
  gulp
    .src mainBowerFiles(), base: './bower_components'
    .pipe gulp.dest('./slides')

gulp.task 'build', ['populate-slides']

gulp.task 'serve', ->
  connect.server(root: ['./slides', './'])

gulp.task 'default', ['build', 'serve']
