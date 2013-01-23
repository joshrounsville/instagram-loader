user =
  'access_token': '11843940.f59def8.3b00c1d86a124e3b8120e1623a38ad37',
  'user':
    'username':'thebrigade',
    'bio':'',
    'website':'http:\/\/www.thisisthebrigade.com',
    'profile_picture':'http:\/\/images.instagram.com\/profiles\/profile_11843940_75sq_1340516738.jpg',
    'full_name':'The Brigade',
    'id':'203949578'
account = user
count = 25
photos = []
show = 15
animationDelay = 5000
action = 'fadeInUp'

getNextPhoto = ->
  photoCount = 0
  arrayLength = photos.length
  interval = setInterval ->
    random = Math.round(Math.random()*show)
    target = $('.image').eq(random).find('a')
    if arrayLength > photoCount + 1
      $(target).fadeOut ->
        $(this).attr('href', photos[photoCount].attr('data-link'))
        $(this).find('img').attr('src', photos[photoCount].attr('src'))
        $(target).delay(200).fadeIn()
      photoCount++
    else
      clearInterval(interval)
  , animationDelay

getInstagram = ->
  $.getJSON('https://api.instagram.com/v1/users/' + account.user.id+ '/media/recent?access_token=' + account.access_token + '&count=' + count + '&callback=?', (data) ->
      $.each(data.data, (i, image) ->
        if i < show
          $('<div>', {
            'class': 'image'
          }).appendTo('.instagram')

          $('<a>', {
            'class': 'animate animated ' + action
            href: image.link
          }).appendTo('.instagram div.image:last')

          $('<img>', {
            src: image.images.low_resolution.url
            alt: image.images.title
          }).appendTo('.instagram div.image:last a')
        else
          cacheImage = $('<img>', {
            src: image.images.low_resolution.url
            alt: 'Life at The Brigade'
            'data-link': image.link
          })
          photos.push(cacheImage)
        )
      $('.image').css('visibility', 'visible')
      getNextPhoto()
    )

$ ->
  getInstagram()