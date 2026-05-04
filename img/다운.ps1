$names = @(
    "릴리아",
    "이사벨",
    "아나스타샤",
    "세라",
    "라리스",
    "레나",
    "시아",
    "루시아",
    "엘리제",
    "세레나",
    "클로에",
    "아리아",
    "미라벨",
    "엘레나",
    "아르테미스",
    "에테라",
    "에밀리",
    "카르네",
    "세리엘"
)

$baseUrl = "https://raw.githubusercontent.com/ipip113/img/refs/heads/main/L"
$downloadRoot = ".\downloaded_images_flat"

New-Item -ItemType Directory -Force -Path $downloadRoot | Out-Null

foreach ($name in $names) {
    $i = 1

    $encodedName = [System.Uri]::EscapeDataString($name)
    $url = "$baseUrl/$encodedName/$i.webp"
    $output = Join-Path $downloadRoot "$name`_$i.webp"

    Write-Host "Downloading: $url"

    try {
        Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
    }
    catch {
        Write-Host "실패: $url" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

Write-Host "완료되었습니다. 저장 위치: $downloadRoot"