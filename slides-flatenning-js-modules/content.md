<!-- .slide: data-background="img/flat-belly-secrets.jpg" -->

# Flattening Javascript Modules

Improving Js modules with functional programming concepts.

<small>Version 0.1.0</small>

<small>por Paulo Diovani</small>

====
<!-- .slide: class="half-slide" data-background="url(img/paulodiovani.jpg)" data-background-size="contain" data-background-repeat="no-repeat" data-background-position="right" -->


### <i class="fa fa-user"></i> Paulo Diovani

Tecnólogo em Sistemas para Internet pela Universidade Feevale.
Desenvolvedor na Codeminer 42.
Usuário GNU/Linux.

[blog.diovani.com][blog] [@paulodiovani][twitter]

[![codeminer42][code-logo]][code-site] <!-- .element: class="no-border no-background" -->

[avatar]: img/avatar.jpg
[blog]: http://blog.diovani.com
[twitter]: http://twitter.com/paulodiovani
[code-logo]: img/codeminer42.png
[code-site]: http://codeminer42.com/

====
<!-- .slide: data-background="linear-gradient(to bottom right, red 0%, black 100%)" style="color:#fff" -->

![codeminer](img/codeminer.png) <!-- .element: class="no-border no-background" -->

We're hiring

paulodiovani@codeminer42.com

----
<!-- .slide: id="not-another" class="bigtext" -->

This is (not) another Talk

about Javascript

Functional Programming

Note:
A lot of people ou there _teach_
functional javascript.

====
<!-- .slide: data-background="img/slow-response.gif" data-background-size="contain" -->

Note:
But only a few examples how to use it?

- it takes time to figure out
- to see advantages
- needs experience

----
<!-- .slide: id="fp-jargon" class="bigtext" -->

FP Jargon

[hemanth/functional-programming-jargon](https://github.com/hemanth/functional-programming-jargon)

Note:
get used to the jargon

We'll be using some fp concepts explained 
on the following slides

====

## Higher-Order Functions (HOF)

A function which takes a function as an argument and/or returns a function.

    const filter = (predicate, xs) => xs.filter(predicate)
    const is = (type) => (x) => Object(x) instanceof type

    filter(is(Number), [0, '1', 2, null]) // [0, 2]

====

## Lambdas

An anonymous function that can be treated like a value.

    (function (a) {
      return a + 1
    })
<!-- .element: class="half-pre" -->

    (a) => a + 1

Lambdas are often passed as arguments to Higher-Order functions.

    [1, 2].map((a) => a + 1) // [2, 3]

You can assign a lambda to a variable.

    const add1 = (a) => a + 1

====
<!-- .slide: id="purity" -->

## Purity

A function is pure if the return value is only determined by its input values, and does not produce side effects.

Pure function

    const greet = (name) => `Hi, ${name}`
    greet('Brianne') // 'Hi, Brianne'

Impure function

    window.name = 'Brianne'
    const greet = () => `Hi, ${window.name}`
    greet() // "Hi, Brianne"

====
<!-- .slide: id="composition" -->

## Function Composition

The act of putting two functions together to form a third function where the output of one function is the input of the other.

    const compose = (f, g) => (a) => f(g(a)) // Definition
    const floorAndToString = compose(
        (val) => val.toString(), 
        Math.floor
    ) // Usage
    
    floorAndToString(121.212121) // '121'

====
<!-- .slide: id="currying" -->

## Currying

The process of converting a function that takes multiple arguments into a function that takes them one at a time.

    const sum = (a, b) => a + b
    const curriedSum = (a) => (b) => a + b
    curriedSum(40)(2) // 42.

    const add2 = curriedSum(2) // (b) => 2 + b
    add2(10) // 12

Note:
Each time the function is called it only accepts one argument and returns a function that takes one argument until all arguments are passed.

====

## Arity

The number of arguments a function takes.

    const sum = (a, b) => a + b

    const arity = sum.length
    console.log(arity) // 2

    // The arity of sum is 2


====

## Filter

Creates a new array with all elements that pass the test implemented by the provided function.

    const even = (n) => n % 2 === 0
    filter([1, 2, 3, 4, 5, 6]) // [2, 4, 6]

## Map

Used to apply a function to a list of values and return another list with the results.

    const square = (n) => n * n
    map([4, 8], square) // [16, 64]

Note:
Filter and map are widely used when
writing functional code, specially while
using composition

====

## Promises

Used for asynchronous computations. A Promise represents a value which may be available now, or in the future, or never.

    const promise = new Promise((resolve, reject) => {
      setTimeout(() => resolve('ok'), 1000)
      setTimeout(() => { throw new Error('not ok') }, 2000)
    })

    promise
      .then(console.log) // prints 'ok' after 1 second
      .catch(console.error) // prints 'Error: not ok' after 2 seconds

Note:
I decided to add Promises too,
since many examples here use them
and they work just like
function composition

====
<!-- .slide: id="how" class="bigtext" data-background="img/slow-response.gif" data-background-size="contain" -->

but how can I

USE IT?

Note:
Ok, I did it.

----
<!-- .slide: id="refactor" class="bigtext" -->

Code Refactoring

for better Readability

and better Maintainability

Note:
In other words,
Lets see how to use fp to
(re)write better code

====

Example case: Reading files from a directory

    const directory = process.argv[2]

    fs.readdir(directory, (err, files) => {
      if (err) console.error(err)
      const jpgFiles = []

      files.forEach(filename => {
        if (filename.endsWith('.jpg')) {
          jpgFiles.push(filename)
        }
      })

      console.log('JPEG FILES:')
      jpgFiles.forEach(filename => console.log(`\t ${filename}`))
    })

====
<!-- .slide: data-background="img/hadouken.png" -->

====
<!-- .slide: id="use-promises" class="bigtext" -->

Using Promises to solve

🔥 Callback Hell 🔥

====

Nothing much different... 🤔

    const directory = process.argv[2]

    fs.readdir(directory)
      .then(files => {
        const jpgFiles = []

        files.forEach(filename => {
          if (filename.endsWith('.jpg')) {
            jpgFiles.push(filename)
          }
        })

        console.log('JPEG FILES:')
        jpgFiles.forEach(filename => console.log(`\t ${filename}`))
      })
      .catch(console.error)

====
<!-- .slide: id="promise-hell" class="bigtext" -->

Using Functional Programming to solve

🔥 ~~Callback~~ Promise Hell 🔥

====

Remember [Purity](#/purity)?

    const directory = process.argv[2]

    fs.readdir(directory)
      .then(files => {
        const jpgFiles = []

        files.forEach(filename => {
          if (filename.endsWith('.jpg')) {
            jpgFiles.push(filename)
          }
        })

        console.log('JPEG FILES:')
        jpgFiles.forEach(filename => console.log(`\t ${filename}`))
      })
      .catch(console.error)
<!-- .element: data-line="7, 11" data-line-offset="2" -->

====

Using `filter`

    const directory = process.argv[2]

    fs.readdir(directory)
      .then((files) => {
        const jpgFiles = files.filter(filename => filename.endsWith('.jpg'))

        console.log('JPEG FILES:')
        jpgFiles.forEach(filename => console.log(`\t ${filename}`))
      })
      .catch(console.error)
<!-- .element: data-line="7" data-line-offset="2" -->

====
<!-- .slide: id="promise-chain" -->

Improving and using `map`

    const directory = process.argv[2]

    fs.readdir(directory)
      .then(files => files.filter(filename => filename.endsWith('.jpg')))
      .then(files => files.map(filename => `\t ${filename}`))
      .then(files => `JPEG FILES: \n${files.join('\n')}`)
      .then(console.log)
      .catch(console.error)

====
<!-- .slide: id="like-composition" class="bigtext" data-background="img/does-he-looks-like-a-bitch.gif" -->

Does it look

like [Composition](#/composition)?

====

It's just like [Composition](#/composition).

    const directory = process.argv[2]

    const printFiles = R.compose(
      console.log,
      files => `JPEG FILES: \n${files.join('\n')}`,
      files => files.map(filename => `\t ${filename}`)
    )

    fs.readdir(directory)
      .then(files => files.filter(filename => filename.endsWith('.jpg')))
      .then(printFiles)
      .catch(console.error)
<!-- .element: data-line="7-9, 14" data-line-offset="3" -->

Note:
Using Ramda.js library

====

Using [Curried](#/currying) functions

    const directory = process.argv[2]

    const printFiles = R.compose(
      console.log,
      R.join('\n'), // String → [a] → String
      R.prepend('JPEG FILES:'), // a → [a] → [a]
      R.map(filename => `\t ${filename}`) // Functor f => (a → b) → f a → f b
    )

    fs.readdir(directory)
      .then(R.filter(filename => filename.endsWith('.jpg')))
      .then(printFiles)
      .catch(console.error)
<!-- .element: data-line="7-10, 14" data-line-offset="3" -->

====

Differences between `curried` and `not curried`

    const printFiles = R.compose(
      console.log,
      R.join('\n'),
      R.prepend('JPEG FILES:'),
      R.map(fname => `\t ${fname}`)
    )
<!-- .element: class="half-pre" -->

    const printFiles = R.compose(
      console.log,
      f => R.join('\n', f),
      f => R.prepend('JPEG FILES:', f),
      f => R.map(fname => `\t ${fname}`, f)
    )

====

Differences between `compose` and `pipe`.

    const printFiles = R.compose(
      console.log,
      R.join('\n'),
      R.prepend('JPEG FILES:'),
      R.map(filename => `\t ${filename}`)
    )
<!-- .element: class="half-pre" -->

    const printFiles = R.pipe(
      R.map(filename => `\t ${filename}`)
      R.prepend('JPEG FILES:'),
      R.join('\n'),
      console.log,
    )

Note:
`compose`: right-to-left function composition

`pipe`: left-to-right function composition
(just like promises)

----
<!-- .slide: id="this-is-real" class="bigtext" -->

some real life

examples

====
<!-- .slide: data-background="#3D2E50" style="color: #fff" -->

![isapp](img/isapp.png) <!-- .element: class="no-border no-background" -->

Close friends made closer

[isapp.com](http://isapp.com/)

Note:
Current project

====

Before Refactoring

    const fetch = (user) => {
      return user.refresh({
        withRelated: ['phone', 'friends', 'friendRequests.user', 'followings.friend']
      }).then((freshUser) => {
        return profileData(freshUser);
      });
    };

    const publish = (db, profile) => {
        return db.ref(`data/${profile.id}/profile`).set(profile);
    };

    const update = (user, db = Firebase.database()) => {
      return fetch(user)
        .then((profile) => publish(db, profile));
    };

====

After refactoring

    const publish = _.curry((db, [model, data]) => {
      return db.ref(`data/${model.id}/profile`).set(data);
    });

    const update = (user, db = Firebase.database()) => {
      return Promise.resolve([user, {}])
        .then(mountUser)
        .then(mountPhone)
        .then(mountFriendships)
        .then(mountFriendRequests)
        .then(publish(db));
    };

Note:
There is some missing methods in the example.

====

Before refactoring

    export function killedDragonsOnTheGame(frames) {
      let dragonsKilled = []

      frames.forEach(frame => {
        const killedDragonsInTheFrame = frame.events.filter(event => {
            return event.monsterType === 'DRAGON'
        })
        dragonsKilled = dragonsKilled.concat(killedDragonsInTheFrame)
      })

      return dragonsKilled
    }

by [@boniattirodrigo](http://twitter.com/@boniattirodrigo)

====

After refactoring

    import { compose, curry, flatten, map } from 'ramda'

    const flatMap = curry(compose(flatten, map))
    const dragonKill = event => event.monsterType === 'DRAGON'
    const killedDragonsOnTheGame = flatMap(frame => frame.events.filter(dragonKill))

    export { killedDragonsOnTheGame }

by [@boniattirodrigo](http://twitter.com/@boniattirodrigo)

----
<!-- .slide: id="es2017" class="bigtext" -->

ES2017

`async` and `await`

====

The `async function` declaration defines an asynchronous function.

- When an async function is called, it returns a Promise.
    - When the async function returns a value, the Promise will be resolved with the returned value.
    - When the async function throws an exception or some value, the Promise will be rejected with the thrown value.

====

The `await` operator is used to wait for a `Promise` returned by an `async function`.

- The await expression causes async function execution to pause,
    - to wait for the Promise's resolution,
    - and to resume the async function execution when the value is resolved.
    - It then returns the resolved value.

====

Replacing the [promise chain](#/promise-chain)

    const joinNewline = R.join('\n')
    const prependText = R.prepend('JPEG FILES:')
    const mapIndent = R.map(filename => `\t ${filename}`)
    const jpegFiles = files => files.filter(filename => filename.endsWith('.jpg'))

    const listFiles = async directory => {
      try {
        console.log(
        joinNewline(
        prependText(
        mapIndent(
        jpegFiles(
        await fs.readdir(directory))))))
      } catch (err) { console.error(err) }
    }

    listFiles(process.argv[2])

Note:
Not sure how to use with Ramda or
other lib. Maybe on next versions.

----
<!-- .slide: id="concusions" class="bigtext" -->

Conclusions

Functional Javascript is not a replacement

Use it to improve/refactor code

Adapt to your needs

Note:
Don't look fp as new paradigm to replace other

====

### Bibliografy

- [blog.codeminer42.com](https://blog.codeminer42.com/introduction-to-functional-programming-with-javascript-c06a2540a7c3)
- [blog.diovani.com](http://blog.diovani.com/technology/2017/02/11/flattening-javascript-modules.html)
- [hemanth/functional-programming-jargon](https://github.com/hemanth/functional-programming-jargon)
- [Lodash](https://lodash.com/)
- [MDN](https://developer.mozilla.org/en-US/)
- [Ramda](http://ramdajs.com/)

Gifs from [giphy](https://giphy.com/)

====

### Credits

by Paulo Diovani Gonçalves

<small>[paulo@diovani.com]((mailto:paulo@diovani.com)</small>

_powered by: [reveal.js](http://lab.hakim.se/reveal-js/)_

<small>[http://lab.hakim.se/reveal-js/](http://lab.hakim.se/reveal-js/)</small>

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png" /></a>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Docker for Lazy People</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://diovani.com" property="cc:attributionName" rel="cc:attributionURL">Paulo Diovani</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
