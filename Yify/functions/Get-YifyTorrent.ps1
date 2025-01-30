function Get-YifyTorrent {
    param (
        [Parameter(Mandatory)]
        [Yify_Torrent]$Torrent,

        [Parameter(Mandatory)]
        [string]$Path
    )

    process {
        Invoke-WebRequest -Uri $Torrent.url -OutFile $Path
    }
}
