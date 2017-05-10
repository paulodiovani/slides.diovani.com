del            = require('del')
ejs            = require("gulp-ejs")
gulp           = require('gulp')
bower          = require('bower')
deploy         = require('gulp-deploy-git')
replace        = require('gulp-replace')
connect        = require('gulp-connect')
mainBowerFiles = require('main-bower-files')

gulp.task 'clean', ->
  del(['./dist/**/*'])

gulp.task 'populate-slides', ['clean'], ->
  gulp.src mainBowerFiles(/slides-/, group: 'slides'), base: './bower_components'
    .pipe gulp.dest('./dist')

gulp.task 'copy-index-files', ['clean'], ->
  gulp.src ['home/CNAME', 'home/**/*.{css,js}'], base: './home'
    .pipe gulp.dest('./dist')

gulp.task 'update-index', ['clean'], (cb) ->
  bower.commands.list().on 'end', (pkg) ->
    gulp.src 'home/index.ejs'
      .pipe ejs(pkg, ext: '.html')
      .pipe gulp.dest('./dist')
      .on 'end', cb
    return
  return

gulp.task 'copy-dependencies', ['clean'], ->
  gulp.src [
    'bower_components/**'
    '!bower_components/slides-*/**/*'
  ], base: './'
    .pipe gulp.dest('./dist')

gulp.task 'replace-bower', ['populate-slides'], ->
  gulp.src [
    'dist/**/*.html'
    '!dist/bower_components/**/*'
  ], base: './dist'
    .pipe replace('./bower_components', '../bower_components')
    .pipe gulp.dest('./dist')

gulp.task 'build', [
  'clean'
  'populate-slides'
  'copy-index-files'
  'update-index'
  'copy-dependencies'
  'replace-bower'
]

gulp.task 'serve', ['build'], ->
  connect.server(root: ['./dist'])

gulp.task 'deploy', ['build'], ->
  gulp.src 'dist/**/*', read: false
    .pipe deploy
      prefix: 'dist'
      repository: 'https://github.com/paulodiovani/slides.diovani.com.git'
      remoteBranch: 'gh-pages'
      verbose: true

gulp.task 'default', ['build', 'serve']
