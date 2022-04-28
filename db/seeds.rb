# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users

testuser = User.new
testuser.name = 'Test User'
testuser.email = 'testuser@branti.com'
testuser.password = 'passwd'
testuser.password_confirmation = 'passwd'
testuser.save!

tt = User.new
tt.name = 'The Tech Thieves'
tt.email = 'tt@branti.com'
tt.password = 'passwd'
tt.password_confirmation = 'passwd'
tt.save!

cs = User.new
cs.name = 'Coke Studio'
cs.email = 'cs@branti.com'
cs.password = 'passwd'
cs.password_confirmation = 'passwd'
cs.save!

tc = User.new
tc.name = 'Tom Cardy'
tc.email = 'tc@branti.com'
tc.password = 'passwd'
tc.password_confirmation = 'passwd'
tc.save!

nc = User.new
nc.name = 'Nightcore'
nc.email = 'nc@branti.com'
nc.password = 'passwd'
nc.password_confirmation = 'passwd'
nc.save!

primeagen = User.new
primeagen.name = 'ThePrimeagen'
primeagen.email = 'prime@branti.com'
primeagen.password = 'passwd'
primeagen.password_confirmation = 'passwd'
primeagen.save!

# 4 Genres
genres = Genre.create!([
  { 
    title: "Pop", 
    color: "#F58D1C",
    cover_image: File.open("storage/assets/pop_genre.jpg")
  },
  { 
    title: "Bolly", 
    color: "#F095AF",
    cover_image: File.open("storage/assets/bolly_genre.jpg")
  },
  { 
    title: "EDM", 
    color: "#19499B",
    cover_image: File.open("storage/assets/edm_genre.jpg")
  },
  { 
    title: "Indie", 
    color: "#1F3879",
    cover_image: File.open("storage/assets/indie_genre.jpg")
  },
])

# 4 Albums
albums = Album.create!([
  { 
    name: "Relatively Cool", 
    color: "#f9a4ee",
    artist: primeagen
  },
  { 
    name: "Garage Wars", 
    color: "#f9a4ee",
    artist: tt
  },
  { 
    name: "Fruit Kingdom", 
    color: "#c6a4f9",
    artist: tc
  },
  { 
    name: "White Rose", 
    color: "#a4e8f9",
    artist: testuser
  },
  { 
    name: "Coke Studio", 
    color: "#a4e8f9",
    artist: cs
  },
])

# 1 Playlist
playlist = testuser.playlists.create!(name: "All Songs", 
                                 color: "#f1c0e8", 
                                 cover_image: File.open("storage/assets/all_songs_playlist.jpg"))

# 20 Songs
songs = [
  {
    title: "Gruvbox (ThePrimeagen Theme Song)",
    color: "#ffe8d6",
    album: albums[0],
    artist: primeagen,
    cover_image: File.open("storage/assets/song_1.webp"),
    music_file: File.open("storage/music/edm/k3rn3lp4n1x__-_gruvbox_(_the_primeagen_theme_song_).webm")
  },
  {
    title: "She wants me dead",
    color: "#f1c0e8",
    album: albums[3],
    artist: nc,
    cover_image: File.open("storage/assets/song_2.webp"),
    music_file: File.open("storage/music/edm/nightcore_-_she_wants_me_dead.webm")
  },
  {
    title: "Empty Love",
    color: "#b9fbc0",
    album: albums[1],
    artist: tt,
    cover_image: File.open("storage/assets/song_3.webp"),
    music_file: File.open("storage/music/edm/the_tech_thieves_-_empty_love.webm")
  },
  {
    title: "Low",
    color: "#90e0ef",
    album: albums[1],
    artist: tt,
    cover_image: File.open("storage/assets/song_4.webp"),
    music_file: File.open("storage/music/edm/the_tech_thieves_-_low.webm")
  },
  # pop
  {
    title: "Red Button",
    color: "#e07a5f",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_5.webp"),
    music_file: File.open("storage/music/pop/aja_-_red_button.webm")
  },
  {
    title: "Love Me",
    color: "#ccd5ae",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_6.webp"),
    music_file: File.open("storage/music/pop/kloud_-_love_me_(feat._gabriel_paris).webm")

  },
  {
    title: "Midnight",
    color: "#fec5bb",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_7.webp"),
    music_file: File.open("storage/music/pop/midnight.webm")
  },
  {
    title: "Monster Truck",
    color: "#fec89a",
    album: albums[2],
    artist: tc,
    cover_image: File.open("storage/assets/song_8.webp"),
    music_file: File.open("storage/music/pop/monster_truck_(don't_touch_my).webm")
  },
  {
    title: "Yellow Black Blue",
    color: "#cfe1b9",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_9.webp"),
    music_file: File.open("storage/music/pop/nina_chuba_-_yellow_black_blue.webm")
  },
  {
    title: "Taste of You",
    color: "#fde2e4",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_10.webp"),
    music_file: File.open("storage/music/pop/rezz_-_taste_of_you_(ft._dove_cameron).webm")
  },
  # indie
  {
    title: "Fruit Salad",
    color: "#bbdefb",
    album: albums[2],
    artist: tc,
    cover_image: File.open("storage/assets/song_11.webp"),
    music_file: File.open("storage/music/indie/fruit_salad.webm")
  },
  {
    title: "Harder, Better, Faster, Stronger",
    color: "#efc3e6",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_12.webp"),
    music_file: File.open("storage/music/indie/harder,_better,_faster,_stronger_-_daft_punk.webm")
  },
  {
    title: "H.Y.C.Y.BH",
    color: "#ffcad4",
    album: albums[2],
    artist: tc,
    cover_image: File.open("storage/assets/song_13.webp"),
    music_file: File.open("storage/music/indie/h.y.c.y.bh.webm")
  },
  {
    title: "I don't know",
    color: "#f38375",
    album: albums[1],
    artist: tt,
    cover_image: File.open("storage/assets/song_14.webp"),
    music_file: File.open("storage/music/indie/the_tech_thieves_-_i_don't_know.webm")
  },
  {
    title: "On my own",
    color: "#e9ff70",
    album: albums[1],
    artist: tt,
    cover_image: File.open("storage/assets/song_15.webp"),
    music_file: File.open("storage/music/indie/the_tech_thieves_-_on_my_own.webm")
  },
  {
    title: "What's Love",
    color: "#ecf8f8",
    album: albums[1],
    artist: tt,
    cover_image: File.open("storage/assets/song_16.webp"),
    music_file: File.open("storage/music/indie/the_tech_thieves_-_what's_love.webm")
  },
  # bolly
  {
    title: "Thagyan",
    color: "#dee2ff",
    album: albums[4],
    artist: cs,
    cover_image: File.open("storage/assets/song_17.webp"),
    music_file: File.open("storage/music/bolly/coke_studio___season_14___thagyan___zain_zohaib_x_quratulain_balouch.webm")
  },
  {
    title: "Tajdar-e-haram",
    color: "#feeafa",
    album: albums[4],
    artist: cs,
    cover_image: File.open("storage/assets/song_18.webp"),
    music_file: File.open("storage/music/bolly/coke_studio_season_8__tajdar-e-haram__atif_aslam.webm")
  },
  {
    title: "Teri Yaadon Mein",
    color: "#ffdab9",
    album: albums[3],
    artist: testuser,
    cover_image: File.open("storage/assets/song_19.webp"),
    music_file: File.open("storage/music/bolly/teri_yaadon_mein_-_the__killer_.webm")
  }
]

Song.create!(songs)

