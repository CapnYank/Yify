function Format-UriString {
    param ($Uri, $Endpoint, [hashtable]$Parameters)

    $ParamString = @(
        foreach ($Parameter in $Parameters.GetEnumerator()) {
            "{0}={1}" -f $Parameter.Name,$Parameter.Value
        }
    ) -join '&'

    "{0}/{1}?{2}" -f $Uri, $Endpoint, $ParamString
}
