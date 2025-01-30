function Find-YifyMovie {
    param (
        # Search on Movie Title/IMDB Code, Actor Name/IMDB Code, Director Name/IMDB Code
        [string]$Query,
        [ValidateSet('480p','720p','1080p','1080p.x265','2160p','3D')]
        [string]$Quality,
        [ValidateRange(0,9)]
        [int]$MinimumRating,
        # filter by IMDB genre (https://imdb.com/interest/all)
        [string]$Genre,
        [ValidateSet('title','year','rating','peers','seeds','download_count','like_count','date_added')]
        [string]$SortBy,
        [ValidateSet('desc','asc')]
        [string]$Order
    )

    begin {
        $Parameters = [ordered]@{
            limit = 50
            page = 1
        }

        switch ($PSBoundParameters) {
            {$_.ContainsKey('Query')} {$Parameters.Add('query_term', $Query)}
            {$_.ContainsKey('Quality')} {$Parameters.Add('quality', $Quality)}
            {$_.ContainsKey('MinimumRating')} {$Parameters.Add('minimum_rating', $MinimumRating)}
            {$_.ContainsKey('Genre')} {$Parameters.Add('genre', $Genre)}
            {$_.ContainsKey('SortBy')} {$Parameters.Add('sort_by', $SortBy)}
            {$_.ContainsKey('Order')} {$Parameters.Add('order_by', $Order)}
            {$_.ContainsKey('RottenTomatoes')} {$Parameters.Add('with_rt_ratings', ([bool]$RottenTomatoes).ToString().ToLower())}
        }
    }

    process {
        do
        {
            try
            {
                $Uri = Format-UriString -Uri $Script:YifyBaseUri -Endpoint 'list_movies.json' -Parameters $Parameters
                $Response = Invoke-RestMethod -Uri $Uri -ErrorAction Stop
                [Yify_Movie[]]($Response.Data.movies | Select-Object -Property * -Unique)
                $Parameters['page'] = $Parameters['page']++

            }
            catch { throw $_ }

        }
        until ($Response.data.movies)
    }
}
