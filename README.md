# INFORMATION
<h1>The repository will be archived on November 9.</h1>
<table align="center">
<tr>
    <th colspan="4" height="20px" alt="info"> information</th></tr>
    <tr>
     <td>
        <img src="https://novayagazeta.eu/assets/media/logo-flat.svg" height="20px" alt="[RIP]novayagazeta.eu">
        <a href="https://novayagazeta.eu/articles/2026/10/30/nas-ubili-novaia-gazeta-obiavila-o-zakrytii-news" target="_blank"> novayagazeta.eu </a>
      </td>
     <td>
        <img src="https://rtvi.com/favicon.ico" height="20px" alt="[RIP]RTVI_LOGO">
        <a href="https://rtvi.com/news/novaya-gazeta-obyavila-o-vynuzhdennom-zakrytii-posle-30-let-raboty-v-rf/" target="_blank"> RTVI.com </a>
      </td>
     <td>
        <img src="https://meduza.io/favicon.ico" height="20px" alt="[RIP]mediza_LOGO">
        <a href="https://meduza.io/news/2026/10/30/novaya-gazeta-ob-yavila-o-zakrytii" target="_blank"> meduza.io </a>
      </td>
     <td>
        <img src="https://tv8.md/_next/static/filles/logoLight.svg" height="20px" alt="tv8.md">
        <a href="https://tv8.md/ru/2026/10/30/nas-ubili-rossiiskaya-novaya-gazeta-obyavila-o-zakritii-posle-bolee-chem-30-let-raboti/311714" target="_blank"> tv8.md </a>
      </td>
      <td>
        <img src="https://static.delfi.lv/Portal/Icons/Favicon/Delfi.ico" height="20px" alt="rus.delfi.lv">
        <a href="https://rus.delfi.lv/57862/v-mire/120140629/rossiyskaya-novaya-gazeta-zakryvaetsya-posle-33-let-raboty" target="_blank"> rus.delfi.lv </a>
      </td>
    </tr>
</table>

# novayagazeta
web-api for novayagazeta.ru Говорим как есть. Пишем о происходящем в России, Украине и Европе. Новости, аналитика, мнения экспертов, специальные репортажи и журналистские расследования.
# main
```swift
import Foundation
import novayagazeta
let client = Novayagazeta()

do {
    let slugs = try await client.getSlugsList(eu: false,slugs: ["2026/04/24/daleko-idushchie-vyvody-nalichnykh"])
    print(slugs)
} catch {
    print("Error: \(error)")
}
```

# Launch (your script)
```
swift run
```
