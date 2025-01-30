function Get-YifyParentalGuide {
    param (
        [Parameter(Mandatory, ValueFromPipeline = $true)]
        [Yify_Movie]$Movie
    )

    begin {

    }

    process {
        $Uri = Format-UriString -Uri $Script:YifyBaseUri -Endpoint 'movie_parental_guides.json' -Parameters @{movie_id = $Movie.id}
        [Yify_Parental_Guide[]](Invoke-RestMethod -Uri $Uri).data.parental_guides
    }
}
