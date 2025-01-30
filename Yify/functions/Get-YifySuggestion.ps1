function Get-YifySuggestion {
    param (
        [Parameter(Mandatory, ValueFromPipeline = $true)]
        [Yify_Movie]$Movie
    )

    begin {

    }

    process {
        $Uri = Format-UriString -Uri $Script:YifyBaseUri -Endpoint 'movie_suggestions.json' -Parameters @{ movie_id = $Movie.id }
        [Yify_Movie[]](Invoke-RestMethod -Uri $Uri).data.movies
    }
}
