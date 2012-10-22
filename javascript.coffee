user =
  access_token:'11843940.f59def8.3b00c1d86a124e3b8120e1623a38ad37',
  user:
    username:'joshrounsville',
    bio:'',
    website:'http:\/\/www.joshuarounsville.com',
    profile_picture:'http:\/\/images.instagram.com\/profiles\/profile_11843940_75sq_1340516738.jpg',
    full_name:'Josh Rounsville',
    id:'11843940'
account = user
count = -1
photos = []
animationDelay = 5000
action = 'fadeInUp'

getNextPhoto = ->
  photoCount = 0
  arrayLength = 10

  interval = setInterval ->
    random = Math.round(Math.random()*10)
    target = document.querySelectorAll 'instagram'
    if arrayLength > photoCount
      console.log target
  , 2000

getNextPhoto()