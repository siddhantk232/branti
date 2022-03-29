Banti - a music streaming service

## Scope

### Auth

- users should be able to create a new account (with social logins) to publish
  their music
- the uploaded music will be queued for validation before made public to end
  users

- guest (unauthenticated users) users will be able to play any music

- search by Artist/Title/Genre
- Automatically queue music from similar genre
- users will be able to play songs
- users will be able to create custom playlists

### Auto playlists

- users will get "Recently Played" and "Liked Songs" playlist based on their
  activity on Branti.

## Not in Scope

- Subscription model
- Monentization
- DRM

## Key components

### Rails monolith

- account service
- upload service
- search service
- playlist service

- streaming service

## DB Model (MVP)

### Main db (postgres)

- user_table
- playlist_table

### Metadata (NoSql)

- album collection
- tracks collection
- tags

## Distribution

- S3 for capturing media (music and thumbnails)
- compress (for better delivery)
- package (chunked and streamed over http)
- convert (different quality/codec/protocol)
- push to CDN (cloudfront?)

## Flow

#### Publish:

publishers/owners -> <uploadService> -> metadata db

#### Distribute:

in Go?

raw media -> <mediaService> -> CDN // compress/convert/package

#### backend for clients

user <-> <searchService/viewService/playlist/history/auth> <-> main db

