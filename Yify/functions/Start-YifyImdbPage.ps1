function Start-YifyImdbPage {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [Yify_Movie]$Movie
    )

    process {
        $Uri = "{0}/{1}/{2}" -f 'https://www.imdb.com', 'title', $Movie.imdb_code
    Start-Process $Uri
    }
}
