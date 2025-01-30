class Yify_Torrent {
    [string]$url
    [string]$hash
    [string]$quality
    [string]$type
    [string]$is_repack
    [string]$video_codec
    [string]$bit_depth
    [string]$audio_channels
    [string]$seeds
    [string]$peers
    [string]$size
    [string]$size_bytes
    [string]$date_uploaded
    [string]$date_uploaded_unix
}

class Yify_Movie {
    [string]$background_image
    [string]$background_image_original
    [string]$date_uploaded
    [string]$date_uploaded_unix
    [string]$description_full
    [string[]]$genres
    [string]$id
    [string]$imdb_code
    [string]$language
    [string]$large_cover_image
    [string]$medium_cover_image
    [string]$mpa_rating
    [string]$rating
    [string]$runtime
    [string]$slug
    [string]$small_cover_image
    [string]$state
    [string]$summary
    [string]$synopsis
    [string]$title
    [string]$title_english
    [string]$title_long
    [Yify_Torrent[]]$torrents
    [string]$url
    [string]$year
    [string]$yt_trailer_code
}

class Yify_Cast {
    [string]$name
    [string]$character_name
    [string]$url_small_image
    [string]$imdb_code
}

class Yify_Movie_Details : Yify_Movie {
    [Yify_Cast[]]$cast
    [string]$description_intro
    [string]$large_screenshot_image1
    [string]$large_screenshot_image2
    [string]$large_screenshot_image3
    [string]$like_count
    [string]$medium_screenshot_image1
    [string]$medium_screenshot_image2
    [string]$medium_screenshot_image3
}

class Yify_Data {
    [int]$limit
    [int]$movie_count
    [int]$page_number
    [Yify_Movie]$movies
}

class Yify_Parental_Guide {
    [string]$type
    [string]$parental_guide_text
}
