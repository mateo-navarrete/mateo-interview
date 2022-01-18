# FF API

Everything you ever needed to know about the Fast and Furious franchise

URL: https://api.gradientworks.dev/ff

## List Movies

HTTP Method: GET

URL: http://api.gradientworks.dev/ff/movies

### Query params

None

### Results

json document with list of movie info

### Example

```
$ curl https://api.gradientworks.dev/ff/movies
{
  "movies": [
      {
          "id": 1,
          "title": "Fast and Furious"
      },
      {
          "id": 2,
          "title": "Too Fast Too Furious"
      },
      ....
  ]
}
```

## Get movie

HTTP Method: GET

URL: http://api.gradientworks.dev/ff/movies/{ID}

### Query params

None

### Results

json document with specific movie info

### Example

```
$ curl https://api.gradientworks.dev/ff/movies/1
{
  "movie": {
    "id": 1,
    "title": "Fast and Furious",
    ....
  }
}

$ curl https://api.gradientworks.dev/ff/movies/2
{
  "movie": {
    "id": 2,
    "title": "Too Fast Too Furious",
    ....
   }
}
```

## Get characters in a movie

HTTP Method: GET
URL: http://api.gradientworks.dev/ff/characters

### Query params

None

### Results

json document with list of actors for a given movie

### Example

```
$ curl https://api.gradientworks.dev/ff/characters
{
  "characters": [
      {
          "id": 1,
          "name": "Dominic Torretto",
          "movies": [1,3,4,5,6,7,8,9,10]
          ....
      },
      {
          "id": 2,
          "name": "Brian O'Conner",
          "movies": [1,2,4,5,6,7]
          ....
      },
}
```

## Get character

HTTP Method: GET
URL: http://api.gradientworks.dev/ff/characters/{ID}

### Query params

None

### Results

json document of character info

### Example

```
$ curl https://api.gradientworks.dev/ff/characters/1
{
  "character": {
          "id": 1,
          "name": "Dominic Torretto",
          "movies": [1,3,4,5,6,7,8,9,10]
          ....
  }
}
```