gulp           = require('gulp')
deploy         = require('gulp-deploy-git')
connect        = require('gulp-connect')
mainBowerFiles = require('main-bower-files')

gulp.task 'populate-slides', ->
  gulp.src mainBowerFiles(), base: './bower_components'
    .pipe gulp.dest('./dist')

gulp.task 'copy-dependencies', ->
  gulp.src 'bower_components/{font-awesome,headjs,reveal.js}/**/*.{css,js}', base: './'
    .pipe gulp.dest('./dist')
  gulp.src 'bower_components/font-awesome/fonts/**/*', base: './'
    .pipe gulp.dest('./dist')
  gulp.src 'bower_components/reveal.js/lib/font/**/*', base: './'
    .pipe gulp.dest('./dist')

gulp.task 'build', ['populate-slides', 'copy-dependencies']

gulp.task 'serve', ->
  connect.server(root: ['./dist'])

gulp.task 'deploy', ['build'], ->
  gulp.src 'dist/**/*', read: false
    .pipe deploy
      prefix: 'dist'
      repository: 'https://github.com/paulodiovani/slides.diovani.com.git'
      remoteBranch: 'gh-pages'
      verbose: true

gulp.task 'default', ['build', 'serve']
