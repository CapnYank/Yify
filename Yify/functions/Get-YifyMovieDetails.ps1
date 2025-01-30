function Get-YifyMovieDetails {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [Yify_Movie]$Movie,
        [switch]$Images,
        [switch]$Cast
    )

    begin {
        $Parameters = [ordered]@{ 'movie_id' = $null }

        switch ($PSBoundParameters) {
            {$_.ContainsKey('Images')} {$Parameters.Add('with_images', ([bool]$Images).ToString().ToLower())}
            {$_.ContainsKey('Cast')} {$Parameters.Add('with_cast', ([bool]$Cast).ToString().ToLower())}

        }
    }

    process {
        $Parameters['movie_id'] = $Movie.id
        $Uri = Format-UriString -Uri $Script:YifyBaseUri -Endpoint 'movie_details.json' -Parameters $Parameters
        [Yify_Movie_Details](Invoke-RestMethod -Uri $Uri).data.movie
    }
}
